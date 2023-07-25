from __future__ import absolute_import
from __future__ import print_function
import sys
import os

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))))

from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi


def mkLed():
    m = Module('blinkled')
    clk = m.Input('CLK')
    rst = m.Input('RST')
    para = 21
    binary = bin(para)[2:]
    binary_list = [int(bit) * (2 ** idx) for idx, bit in enumerate(binary[::-1])if bit=='1']
    ram_a_list = []
    ram_b_list = []
    ram_c_list = []
    
    datawidth = 32
    addrwidth = 10
    for idx, bin_num in enumerate(binary_list):
        if(bin_num==1):
            ram_a_list.append(vthread.RAM(m, 'ram_a'+str(idx), clk, rst, datawidth, addrwidth))
            ram_b_list.append(vthread.RAM(m, 'ram_b'+str(idx), clk, rst, datawidth, addrwidth))
            ram_c_list.append(vthread.RAM(m, 'ram_c'+str(idx), clk, rst, datawidth, addrwidth))
        else:
            ram_a_list.append(vthread.MultibankRAM(m, 'ram_a'+str(idx), clk, rst, datawidth, addrwidth, numbanks=bin_num))
            ram_b_list.append(vthread.MultibankRAM(m, 'ram_b'+str(idx), clk, rst, datawidth, addrwidth, numbanks=bin_num))
            ram_c_list.append(vthread.MultibankRAM(m, 'ram_c'+str(idx), clk, rst, datawidth, addrwidth, numbanks=bin_num))
    
    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    
    # ram_a = vthread.MultibankRAM(m, 'ram_a', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_b = vthread.MultibankRAM(m, 'ram_b', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_c = vthread.MultibankRAM(m, 'ram_c', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)
    # ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth*para, addrwidth)
    # ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth*para, addrwidth)
    ram_x = vthread.RAM(m, 'ram_x', clk, rst, datawidth, addrwidth+10)
    ram_y = vthread.RAM(m, 'ram_y', clk, rst, datawidth, addrwidth+10)
    ram_z = vthread.RAM(m, 'ram_z', clk, rst, datawidth, addrwidth+10)
    
    # strm = vthread.Stream(m, 'mystream', clk, rst)
    # a = strm.source('a') + 1000
    # size = strm.parameter('size')
    # a_list = strm.Split(a, width=datawidth, signed=True)
    
    # a_list = strm.Split(a, width=datawidth, signed=True)
    # for i in range(1, len(a_list)):
    #     a_list[0] += a_list[i]
    # s = 1
    # while s<len(a_list):
    #     for i in range(len(a_list)):
    #         if i%(2*s)==0:
    #             a_list[i] = a_list[i]+a_list[i+s]
    #     s *= 2
    # sum, sum_valid = strm.ReduceAddValid(a_list[0] , size)
    # strm = vthread.Stream(m, 'mystream', clk, rst)
    # size = strm.parameter('size')

    # a = strm.source('a')
    # b = strm.source('b')

    # a_vec = strm.source_parallel('a', par=4)  # 32 * 4
    # b_vec = strm.source_parallel('b', par=4)  # 32 * 4
    # c = a * b
    # d, valid = strm.ReduceAddValid(c, size)

    # strm = vthread.Stream(m, 'mystream', clk, rst)
    # a = strm.source('a', datawidth=datawidth * para)
    # b = strm.source('b', datawidth=datawidth * para)
    # a_list = strm.Split(a, width=datawidth, signed=True)
    # b_list = strm.Split(b, width=datawidth, signed=True)
    # c_list = [ai * bi for ai, bi in zip(a_list, b_list)]
    # c = strm.AddN(*c_list)
    # d, valid = strm.ReduceAddValid(c, size)
    # strm.sink(d, 'd', when=valid, when_name='d_valid')
    
    strm = vthread.Stream(m, 'mystream', clk, rst)
    size = strm.parameter('size')

    a_vec = strm.source_parallel('a', par=para)  # 32 * 4
    b_vec = strm.source_parallel('b', par=para)  # 32 * 4

    d_vec  = strm.source_parallel('bias', par=para) # 32 * 4
    c_vec = a_vec + b_vec
    # e_vec = a_vec + d_vec
    #c_vec = a_vec * b_vec + bias # parallel multiplication (4) with 1 scala value
    args = c_vec.par_var_list
    # c = strm.cat(args)
    # for i in range(1, len(args)):
    #     args[0] += (args[i]+1000)
    # c = args[0]

    strm.sink_parallel(args, 'sum_vec', par=para)
    
    # Timer
    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )

    def comp_stream(size, offset):
        start_time = counter
        strm.set_parameter('size', size//para)
        strm.set_source_parallel('a', ram_a_list, offset, size//para, multi_ram = True)
        print("ssss:",size//para)
        strm.set_source_parallel('b', ram_b_list, offset, size//para, multi_ram = True)
        #strm.set_source_parallel(name='a', ram = ram_a, offset = offset, size = size//para)
        strm.set_sink_parallel('sum_vec', ram_c_list, offset, size//para)
        strm.run()
        strm.join()
        end_time = counter
        exec_time = end_time - start_time   
        print('# para = %d, exec_time = %d' % (para, exec_time))
    
    def comp_sequential(size, offset):
        sum = 0
        for i in range(size):
            a = ram_x.read(i + offset)
            b = ram_y.read(i + offset)
            sum = a + b
            ram_z.write(i + offset, sum)

    def check(size, offset_stream, offset_seq):
        all_ok = True
        #for i in range(size):
            # st = ram_c.read(i + offset_stream)
            # sq = ram_c.read(i + offset_seq)
            # print(st)
            # print(sq)
            # if vthread.verilog.NotEql(st, sq):
            #     all_ok = False
        if all_ok:
            print('# verify: PASSED')
        else:
            print('# verify: FAILED')

    def comp(size):
        # stream
        
        offset_b = size*4
        size = size//2
        offset = 0
        myaxi.dma_read_packed_multi_ram(ram_a_list, offset, 0+size*4, size)
        myaxi.dma_read_packed_multi_ram(ram_b_list, offset, offset_b+size*4, size)
        comp_stream(size, offset)
        myaxi.dma_read_packed_multi_ram(ram_c_list, offset, 1024, size)
        
        # sequential
        offset = 512
        myaxi.dma_read(ram_x, offset, 0+size*4, size)
        myaxi.dma_read(ram_y, offset, offset_b+size*4, size)
        comp_sequential(size, offset)
        myaxi.dma_write(ram_z, offset, 1024 * 2, size)

        # verification
        myaxi.dma_read_packed_multi_ram(ram_c_list, offset, 1024 * 2, size)
        check(size, 0, offset)

        vthread.finish()

    th = vthread.Thread(m, 'th_comp', clk, rst, comp)
    fsm = th.start(100)

    return m


def mkTest(memimg_name=None):
    m = Module('test')

    # target instance
    led = mkLed()

    # copy paras and ports
    params = m.copy_params(led)
    ports = m.copy_sim_ports(led)

    clk = ports['CLK']
    rst = ports['RST']

    memory = axi.AxiMemoryModel(m, 'memory', clk, rst, memimg_name=memimg_name)
    memory.connect(ports, 'myaxi')

    uut = m.Instance(led, 'uut',
                     params=m.connect_params(led),
                     ports=m.connect_ports(led))

    # simulation.setup_waveform(m, uut)
    simulation.setup_clock(m, clk, hperiod=5)
    init = simulation.setup_reset(m, rst, m.make_reset(), period=100)

    init.add(
        Delay(1000000),
        Systask('finish'),
    )

    return m


def run(filename='tmp.v', simtype='iverilog', outputfile=None):

    if outputfile is None:
        outputfile = os.path.splitext(os.path.basename(__file__))[0] + '.out'

    memimg_name = 'memimg_' + outputfile

    test = mkTest(memimg_name=memimg_name)

    if filename is not None:
        test.to_verilog(filename)

    sim = simulation.Simulator(test, sim=simtype)
    rslt = sim.run(outputfile=outputfile)
    lines = rslt.splitlines()
    if simtype == 'verilator' and lines[-1].startswith('-'):
        rslt = '\n'.join(lines[:-1])
    return rslt


if __name__ == '__main__':
    rslt = run(filename='tmp.v')
    print(rslt)