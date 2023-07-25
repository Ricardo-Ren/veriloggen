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
    para = 128
    datawidth = 32
    addrwidth = 10
    myaxi = vthread.AXIM(m, 'myaxi', clk, rst, datawidth)
    ram_a = vthread.MultibankRAM(m, 'ram_a', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_b = vthread.MultibankRAM(m, 'ram_b', clk, rst, datawidth, addrwidth, numbanks=para)
    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)

    ram_x = vthread.RAM(m, 'ram_x', clk, rst, datawidth, addrwidth)
    ram_y = vthread.RAM(m, 'ram_y', clk, rst, datawidth, addrwidth)
    ram_z = vthread.RAM(m, 'ram_z', clk, rst, datawidth, addrwidth)
    
    strm = vthread.Stream(m, 'mystream', clk, rst)
    size = strm.parameter('size')
    tensor_size = strm.parameter('tensor_size')

    a_vec = strm.source_parallel('a', par=para)  # 32 * 4
    b_vec = strm.source_parallel('b', par=para)  # 32 * 4
    c_vec = a_vec + b_vec
    args = c_vec.par_var_list
    count = (strm.Counter(step=para))
    conds = [count + i >= tensor_size for i, _ in enumerate(args)]
    args = [strm.Mux(cond, 0, arg) for arg, cond in zip(args, conds)]
    
    c = strm.AddN(*args) # c = c_vec[0] + c_vec[1] + c_vec[2] + c_vec[3]   
    sum, sum_valid = strm.ReduceAddValid(c, size)
    strm.sink(sum, 'sum', when=sum_valid, when_name='sum_valid')
    
    # Timer
    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )

    def comp_stream(size, offset):
        start_time = counter
        strm.set_parameter('tensor_size', size)
        strm.set_parameter('size', (size+para-1)//para)
        strm.set_source_parallel('a', ram_a, offset, (size+para-1)//para)
        print("ssss:",size//para)
        strm.set_source_parallel('b', ram_b, offset, (size+para-1)//para)
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
        myaxi.dma_read_packed(ram_a, offset, 0, size)
        myaxi.dma_read_packed(ram_b, offset, 512, size)
        comp_stream(size, offset)

        # st = ram_c.read(offset)
        # print(st)
        myaxi.dma_write_packed(ram_c, offset, 1024, 1)
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
    fsm = th.start(1024)

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