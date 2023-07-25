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
    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    ram_a = vthread.MultibankRAM(m, 'ram_a', clk, rst, datawidth, addrwidth, numbanks=4)
    ram_b = vthread.MultibankRAM(m, 'ram_b', clk, rst, datawidth, addrwidth, numbanks=4)

    ram_a0 = ram_a[0]
    ram_a1 = ram_a[1]

    # original (inner product of two vectors)
    strm = vthread.Stream(m, 'mystream', clk, rst)
    a = strm.source('a')
    b = strm.source('b')
    size = strm.parameter('size')
    c = a * b
    sum, sum_valid = strm.ReduceAddValid(c, size)
    strm.sink(sum, 'sum', when=sum_valid, when_name='sum_valid')

    # parallel
    strm = vthread.Stream(m, 'mystream', clk, rst)
    a_par = strm.source_parallel('a', par=4)
    # -> a_list = [strm.source('a_%d' % i) for i in range(4)]
    b_par = strm.source_parallel('b', par=4)
    # -> b_list = [strm.source('b_%d' % i) for i in range(4)]
    size = strm.parameter('size')
    c = a_par * b_par  # -> c = strm.Cat(*[a_i * b_i for a_i, b_i in zip(list(a_par), list(b_par))])

    def comp_stream(size, offset):
        # strm.set_source('a', ram_a, offset, size)

        strm.set_source_parallel('a', ram_a, offset, size)
        # ->
        _size = size // a.par
        for a_i, ram_i in zip(strm.sources['a'].to_list, list(ram_a.rams)):
            strm.set_source(a_i.name, ram_i, offset, _size)

            
        strm.set_parameter('size', size)
        strm.set_sink('sum', ram_b, offset, 1)
        strm.run()
        strm.join()

    def comp_sequential(size, offset):
        sum = 0
        for i in range(size):
            a = ram_a.read(i + offset) + 1000
            sum += a
        ram_b.write(offset, sum)

    def check(size, offset_stream, offset_seq):
        all_ok = True
        for i in range(size):
            st = ram_b.read(i + offset_stream)
            sq = ram_b.read(i + offset_seq)
            if vthread.verilog.NotEql(st, sq):
                all_ok = False
        if all_ok:
            print('# verify: PASSED')
        else:
            print('# verify: FAILED')

    def comp(size):
        # stream
        offset = 0
        myaxi.dma_read(ram_a, offset, 0, size)
        comp_stream(size, offset)
        myaxi.dma_write(ram_b, offset, 1024, 1)

        # sequential
        offset = size
        myaxi.dma_read(ram_a, offset, 0, size)
        comp_sequential(size, offset)
        myaxi.dma_write(ram_b, offset, 1024 * 2, 1)

        # verification
        myaxi.dma_read(ram_b, 0, 1024, 1)
        myaxi.dma_read(ram_b, offset, 1024 * 2, 1)
        check(1, 0, offset)

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

    # vcd_name = os.path.splitext(os.path.basename(__file__))[0] + '.vcd'
    # simulation.setup_waveform(m, uut, dumpfile=vcd_name)
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
