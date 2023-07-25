from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import math
# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))))

from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi


def mkLed(size_len = 32, core_num=1, para=2):
    m = Module('blinkled')
    clk = m.Input('CLK')
    rst = m.Input('RST')
    core_num = core_num
    para = para
    datawidth = 32
    addrwidth = 10
    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    ram_a_list = []
    ram_b_list = []
    for i in range(core_num):
        ram_a_list.append(vthread.MultibankRAM(m, 'ram_a'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))
        ram_b_list.append(vthread.MultibankRAM(m, 'ram_b'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))

    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)

    ram_x = vthread.RAM(m, 'ram_x', clk, rst, datawidth, addrwidth)
    ram_y = vthread.RAM(m, 'ram_y', clk, rst, datawidth, addrwidth)
    ram_z = vthread.RAM(m, 'ram_z', clk, rst, datawidth, addrwidth)

    strm = vthread.Stream(m, 'mystream', clk, rst)
    size = strm.parameter('size')
    a_multi_vec = strm.source_multicore('a', core_num=core_num, par_for_every_core=para)
    b_multi_vec = strm.source_multicore('b', core_num=core_num, par_for_every_core=para)
    c_multi_vec = a_multi_vec+b_multi_vec
    
    c_list = []
    for vec in c_multi_vec.multicore_list:
        args = vec.par_var_list
        c = strm.AddN(*args)
        c_list.append(c)
    
    res = strm.AddN(*c_list)
    sum, sum_valid = strm.ReduceAddValid(res, size)
    strm.sink(sum, 'sum', when=sum_valid, when_name='sum_valid')

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
        strm.set_multicore('a', ram_a_list, offset, _size)
        strm.set_multicore('b', ram_b_list, offset, _size)
        strm.set_sink('sum', ram_c, offset, 1)
        strm.run()
        strm.join()
        end_time = counter
        exec_time = end_time - start_time
        print('# core_num = %d, par = %d, exec_time = %d' % (core_num, para, exec_time))

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
        global_offset = 0
        myaxi.dma_read_packed_multi_ram(ram_a_list, offset, global_offset, size//core_num, core_num)

        global_offset = 512
        myaxi.dma_read_packed_multi_ram(ram_b_list, offset, global_offset, size//core_num, core_num)

        comp_stream(size, offset)

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
    fsm = th.start(size_len)

    return m


def vg_reduce(memimg_name=None, size=32, core_num=1, para=2):
    m = Module('test')

    # target instance
    led = mkLed(size, core_num, para)

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


def run(filename='tmp.v', simtype='iverilog', outputfile=None, size=64, core_num=1, para=2):
    if math.log(para, 2) % 1.0 != 0.0:
            raise ValueError('parallel must be power-of-2')
    
    if outputfile is None:
        outputfile = os.path.splitext(os.path.basename(__file__))[0] + '.out'

    memimg_name = 'memimgw_' + outputfile

    #test = vg_reduce(memimg_name=memimg_name, address_a=0, address_b=1, size=64, core_num=2, para=2)
    test = vg_reduce(memimg_name=memimg_name, size=size, core_num=core_num, para=para)

    if filename is not None:
        test.to_verilog(filename)

    sim = simulation.Simulator(test, sim=simtype)
    rslt = sim.run(outputfile=outputfile)
    lines = rslt.splitlines()
    if simtype == 'verilator' and lines[-1].startswith('-'):
        rslt = '\n'.join(lines[:-1])
    return rslt


if __name__ == '__main__':
    rslt = run(filename='tmp.v', size=1024, core_num=1, para=32)
    print(rslt)