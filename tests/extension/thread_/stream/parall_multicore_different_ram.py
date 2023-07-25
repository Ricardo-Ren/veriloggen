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
    core_num = 2
    para = 2
    datawidth = 32
    addrwidth = 10
    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    # ram_wrapper = vthread.WrapperRAM(m, clk, rst, datawidth, addrwidth, para)

    ram_a0 = vthread.MultibankRAM(m, 'ram_a0', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_a1 = vthread.MultibankRAM(m, 'ram_a1', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b0 = vthread.MultibankRAM(m, 'ram_b0', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b1 = vthread.MultibankRAM(m, 'ram_b1', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)
    # ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)
    # ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth*para, addrwidth)
    # ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth*para, addrwidth)
    ram_x = vthread.RAM(m, 'ram_x', clk, rst, datawidth, addrwidth)
    ram_y = vthread.RAM(m, 'ram_y', clk, rst, datawidth, addrwidth)
    ram_z = vthread.RAM(m, 'ram_z', clk, rst, datawidth, addrwidth)
    
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
    # think about the situations of parallel version like two rams
    # core 1
 
    a_vec1 = strm.source_parallel('a0', par=para)  # 32 * 4
    b_vec1 = strm.source_parallel('b0', par=para)  # 32 * 4
    c_vec1 = a_vec1 + b_vec1
    #c_vec = a_vec * b_vec + bias # parallel multiplication (4) with 1 scala value
    args1 = c_vec1.par_var_list
    c1 = strm.AddN(*args1) # c = c_vec[0] + c_vec[1] + c_vec[2] + c_vec[3]
    sum1, sum_valid1 = strm.ReduceAddValid(c1, size)
    # # strm.sink(sum1, 'sum1', when=sum_valid1, when_name='sum_valid1')
    
    # # core 2
    a_vec2 = strm.source_parallel('a1', par=para)  # 32 * 4
    b_vec2 = strm.source_parallel('b1', par=para)  # 32 * 4
    c_vec2 = a_vec2 + b_vec2
    #c_vec = a_vec * b_vec + bias # parallel multiplication (4) with 1 scala value
    args2 = c_vec2.par_var_list
    c2 = strm.AddN(*args2) # c = c_vec[0] + c_vec[1] + c_vec[2] + c_vec[3]
    
    sum2, sum_valid2 = strm.ReduceAddValid(c2, size)
    # strm.sink(sum2, 'sum2', when=sum_valid2, when_name='sum_valid2')
    sum = sum1 + sum2
    strm.sink(sum, 'sum', when=sum_valid2, when_name='sum_valid2')
    # Timer

    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )

    def comp_stream(size, offset):
        start_time = counter
        _size = size // (core_num*para)
        strm.set_parameter('size', _size)
        strm.set_source_parallel('a0', ram_a0, offset, _size)
        # strm.set_source_parallel_pattern('a1', ram_a, offset, (4, size)) how to set start address
        strm.set_source_parallel('a1', ram_a1, offset, _size)
        print("ssss:",size//para)
        strm.set_source_parallel('b0', ram_b0, offset, _size)
        strm.set_source_parallel('b1', ram_b1, offset, _size)
        #strm.set_source_parallel(name='a', ram = ram_a, offset = offset, size = size//para)
        strm.set_sink('sum', ram_c, offset, 1)
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
            c = a + b
            # print(a)
            sum += c
        ram_z.write(offset, sum)

    def check(size, offset_stream, offset_seq):
        all_ok = True
        for i in range(size):
            st = ram_c.read(i + offset_stream)
            sq = ram_c.read(i + offset_seq)
            print(st)
            print(sq)
            if vthread.verilog.NotEql(st, sq):
                all_ok = False
        if all_ok:
            print('# verify: PASSED')
        else:
            print('# verify: FAILED')

    def comp(size):
        # stream
        offset = 0
        myaxi.dma_read_packed(ram_a0, offset, 0, size//2)
        myaxi.dma_read_packed(ram_a1, offset, (size//2)*4, size//2)

        myaxi.dma_read_packed(ram_b0, offset, 512, size//2)
        myaxi.dma_read_packed(ram_b1, offset, 512+(size//2)*4, size//2)
        # myaxi.dma_read_packed(ram_a, offset, 0, size)
        # myaxi.dma_read_packed(ram_b, offset, 512, size)
        comp_stream(size, offset)

        # st = ram_c.read(offset)
        # print(st)
        myaxi.dma_write(ram_c, offset, 1024, 1)
        # sequential
        offset = 512
        myaxi.dma_read(ram_x, offset, 0, size)
        myaxi.dma_read(ram_y, offset, 512, size)
        comp_sequential(size, offset)
        myaxi.dma_write(ram_z, offset, 1024 * 2, 1)

        # verification
        myaxi.dma_read(ram_c, offset, 1024 * 2, 1)
        check(1, 0, offset)

        vthread.finish()

    th = vthread.Thread(m, 'th_comp', clk, rst, comp)
    fsm = th.start(128)

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
    rslt = run(filename='tmp1.v')
    print(rslt)