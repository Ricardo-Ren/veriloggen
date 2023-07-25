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
    # for i in range(core_num):
    #     ram_a_list.append(vthread.MultibankRAM(m, 'ram_a'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))
    #     ram_b_list.append(vthread.MultibankRAM(m, 'ram_b'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))



    ram_a0 = vthread.MultibankRAM(m, 'ram_a0', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_a1 = vthread.MultibankRAM(m, 'ram_a1', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_a2 = vthread.MultibankRAM(m, 'ram_a2', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_a3 = vthread.MultibankRAM(m, 'ram_a3', clk, rst, datawidth, addrwidth, numbanks=para)

    ram_b0 = vthread.MultibankRAM(m, 'ram_b0', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b1 = vthread.MultibankRAM(m, 'ram_b1', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b2 = vthread.MultibankRAM(m, 'ram_b2', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b3 = vthread.MultibankRAM(m, 'ram_b3', clk, rst, datawidth, addrwidth, numbanks=para)


    ram_c = vthread.MultibankRAM(m, 'ram_c', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_a_lists = [[ram_a0, ram_a1], [ram_a0, ram_a1]]
    ram_b_lists = [[ram_b0, ram_b1], [ram_b2, ram_b3]]

    # ram_a_list = [ram_a0, ram_a1, ram_a2, ram_a3]
    # ram_b_list = [ram_a0, ram_b1, ram_b2, ram_b3]

    strm = vthread.Stream(m, 'mystream', clk, rst)
    size = strm.parameter('size')
    a_multi_vec = strm.source_multicore('a', core_num=core_num, par_for_every_core=para)
    b_multi_vec = strm.source_multicore('b', core_num=core_num, par_for_every_core=para)
    c_multi_vec = a_multi_vec*b_multi_vec
    
    c_list = []
    for vec in c_multi_vec.multicore_list:
        args = vec.par_var_list
        c = strm.AddN(*args)
        c_list.append(c)
    
    sum_list = []
    sum_valid_list = []
    for c in c_list:
        sum, sum_valid = strm.ReduceAddValid(c, size)
        sum_list.append(sum)
        sum_valid_list.append(sum_valid)
    
    strm.sink_parallel_different_core(sum_list, 'sum_list', when=sum_valid_list, when_name='sum_valid_list', core_num = core_num)

    # Timer

    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )


    def GEMM(size_a, size_b, size_k, offset):
        for i in range(size_b):
            for j in range(size_a//core_num):
                comp_stream(size_k*core_num, offset, i, j)
                
    def comp_stream(size, offset, indexb, indexa):
        start_time = counter
        _size = size // (core_num*para)
        strm.set_parameter('size', _size)
        strm.set_multicore_ram_lists('a', ram_a_lists, 'indexa', offset, _size)
        # strm.set_multicore('a', ram_a_list, offset, _size)
        strm.set_multicore_ram_lists('b', ram_b_lists, 'indexb', offset, _size)
        
        # strm.set_source_parallel('a', ram_a_list, offset, _size)
        # strm.set_source_parallel('b', ram_b_list, offset, _size)
        # strm.set_source_parallel_pattern('a1', ram_a, offset, (4, size)) how to set start address
        # strm.set_source_parallel('a1', ram_a1, offset, _size)
        # print("ssss:",size//para)
        # strm.set_source_parallel('b0', ram_b0, offset, _size)
        # strm.set_source_parallel('b1', ram_b1, offset, _size)
        #strm.set_source_parallel(name='a', ram = ram_a, offset = offset, size = size//para)
        strm.set_sink_parallel('sum_list', ram_c, offset=indexb*_size, size =_size)
        strm.run()
        strm.join()
        end_time = counter
        exec_time = end_time - start_time
        print('#core=%d, para = %d, exec_time = %d' % (core_num, para, exec_time))

    def comp_sequential(size, offset):
        # sum = 0
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
        myaxi.dma_read_packed(ram_b1, offset, 512, size//2)

        myaxi.dma_read_packed(ram_b2, offset, 512+(size//2)*4, size//2)
        myaxi.dma_read_packed(ram_b3, offset, 512+(size//2)*4, size//2)

        # myaxi.dma_read_packed(ram_b1, offset, 512+(size//2)*4, size//2)

        # for i in range(core_num):
        #     myaxi.dma_read_packed(ram_a_list[i], offset, ((size//core_num)*i)*4, size//core_num)
        #     myaxi.dma_read_packed(ram_b_list[i], 512, 512+((size//core_num)*i)*4, size//core_num)
        # myaxi.dma_read_packed(ram_a0, offset, 0, size//core_num)
        # myaxi.dma_read_packed(ram_a1, offset, (size//core_num)*4, size//4)
        # myaxi.dma_read_packed(ram_a2, offset, ((size//4)*2)*4, size//4)
        # myaxi.dma_read_packed(ram_a3, offset, ((size//4)*3)*4, size//4)

        # myaxi.dma_read_packed(ram_b0, offset, 512, size//4)
        # myaxi.dma_read_packed(ram_b1, offset, 512+ (size//4)*4, size//4)
        # myaxi.dma_read_packed(ram_b2, offset, 512+((size//4)*2)*4, size//4)
        # myaxi.dma_read_packed(ram_b3, offset, 512+((size//4)*3)*4, size//4)
        # myaxi.dma_read_packed(ram_a, offset, 0, size)
        # myaxi.dma_read_packed(ram_b, offset, 512, size)

        GEMM(2, 2, size//2, 0)

        # st = ram_c.read(offset)
        # print(st)
        myaxi.dma_write(ram_c, offset, 1024, 4)
        
        # sequential
        offset = 512
        myaxi.dma_read(ram_x, offset, 0, size)
        myaxi.dma_read(ram_y, offset, 512, size)
        comp_sequential(size, offset)
        myaxi.dma_write(ram_z, offset, 1024 * 2, 1)

        # verification
        myaxi.dma_read(ram_c, offset, 1024 * 2, 1)
        check(10, 0, offset)

        vthread.finish()

    th = vthread.Thread(m, 'th_comp', clk, rst, comp)
    fsm = th.start(32)

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