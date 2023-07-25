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

    datawidth = 32
    addrwidth = 10
    para = 2

    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth * para, addrwidth)
    ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth * para, addrwidth)
    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth * para, addrwidth)

    ram_x = vthread.RAM(m, 'ram_x', clk, rst, datawidth, addrwidth)
    ram_y = vthread.RAM(m, 'ram_y', clk, rst, datawidth, addrwidth)
    ram_z = vthread.RAM(m, 'ram_z', clk, rst, datawidth, addrwidth)

    ## Original
    # strm = vthread.Stream(m, 'mystream', clk, rst)
    # a = strm.source('a')
    # b = strm.source('b')
    # c = a + b
    # strm.sink(c, 'c')

    strm = vthread.Stream(m, 'mystream', clk, rst)
    a = strm.source('a', datawidth=datawidth * para)
    b = strm.source('b', datawidth=datawidth * para)
    a_list = strm.Split(a, width=datawidth, signed=True)
    b_list = strm.Split(b, width=datawidth, signed=True)
    c_list = [ai + bi for ai, bi in zip(a_list, b_list)]
    c = strm.Cat(*c_list)
    strm.sink(c, 'c')

    # Timer
    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )
    # how to write several threads
    def comp_stream(size, offset):
        start_time = counter
        strm.set_source('a', ram_a, offset, size // para)
        strm.set_source('b', ram_b, offset, size // para)
        strm.set_sink('c', ram_c, offset, size // para)
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
        for i in range(size):
            st = ram_z.read(i + offset_stream)
            sq = ram_z.read(i + offset_seq)
            if vthread.verilog.NotEql(st, sq):
                all_ok = False
        if all_ok:
            print('# verify: PASSED')
        else:
            print('# verify: FAILED')

    def comp(size):
        # stream
        offset = 0
        myaxi.dma_read(ram_a, offset, 0, size // para)
        myaxi.dma_read(ram_b, offset, 512, size // para)
        comp_stream(size, offset)
        myaxi.dma_write(ram_c, offset, 1024, size // para)

        # sequential
        offset = size
        myaxi.dma_read(ram_x, offset, 0, size)
        myaxi.dma_read(ram_y, offset, 512, size)
        comp_sequential(size, offset)
        myaxi.dma_write(ram_z, offset, 1024 * 2, size)

        # verification
        myaxi.dma_read(ram_z, 0, 1024, size)
        myaxi.dma_read(ram_z, offset, 1024 * 2, size)
        check(size, 0, offset)

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

    vcd_name = os.path.splitext(os.path.basename(__file__))[0] + '.vcd'
    simulation.setup_waveform(m, uut, dumpfile=vcd_name)
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
