from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import numpy as np

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))

from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi

axi_datawidth = 32
datawidth = 32

matrix_size = 32
a_offset = 0
b_offset = 4096
c_offset = 4096 * 2
core_num = 2
para = 2


def mkLed():
    m = Module('blinkled')
    clk = m.Input('CLK')
    rst = m.Input('RST')
    
    addrwidth = 20

    # ram_a0 = vthread.MultibankRAM(m, 'ram_a0', clk, rst, datawidth, addrwidth, numbanks=para)# 2^addrwidth * datawidth
    # ram_a1 = vthread.MultibankRAM(m, 'ram_a1', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_a2 = vthread.MultibankRAM(m, 'ram_a2', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_a3 = vthread.MultibankRAM(m, 'ram_a3', clk, rst, datawidth, addrwidth, numbanks=para)

    # ram_b0 = vthread.MultibankRAM(m, 'ram_b0', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_b1 = vthread.MultibankRAM(m, 'ram_b1', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_b2 = vthread.MultibankRAM(m, 'ram_b2', clk, rst, datawidth, addrwidth, numbanks=para)
    # ram_b3 = vthread.MultibankRAM(m, 'ram_b3', clk, rst, datawidth, addrwidth, numbanks=para)


    ram_c = vthread.MultibankRAM(m, 'ram_c', clk, rst, datawidth, addrwidth, numbanks=core_num)
    
    # or write some class to manage the ram_lists
    # ram_a_lists = [[ram_a0, ram_a1], [ram_a2, ram_a3]]
    # ram_b_lists = [[ram_b0, ram_b1], [ram_b0, ram_b1]]


    # ram_a_list = [ram_a0, ram_a1, ram_a2, ram_a3]
    #ram_b_list = [ram_b0, ram_b1, ram_b2, ram_b3]
    
    ram_a_list = []
    ram_b_list = []
    for i in range(core_num):
        ram_a_list.append(vthread.MultibankRAM(m, 'ram_a'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))
        ram_b_list.append(vthread.MultibankRAM(m, 'ram_b'+str(i), clk, rst, datawidth, addrwidth, numbanks=para))
    
    maxi = vthread.AXIM(m, 'maxi', clk, rst, datawidth)
    saxi = vthread.AXISLiteRegister(m, 'saxi', clk, rst, datawidth, length=8)

    # Stream definition
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

    def matmul():
        while True:
            saxi.wait_flag(0, value=1, resetvalue=0)
            saxi.write(1, 1)  # set busy

            matrix_size = saxi.read(2)
            a_offset = saxi.read(3)
            b_offset = saxi.read(4)
            c_offset = saxi.read(5)
            offset = 0

            # maxi.dma_read_packed(ram_a0, offset, a_offset, matrix_size)
            # maxi.dma_read_packed(ram_a1, offset, a_offset, matrix_size)
            # maxi.dma_read_packed(ram_a2, offset, a_offset+matrix_size*4, matrix_size)
            # maxi.dma_read_packed(ram_a3, offset, a_offset+matrix_size*4, matrix_size)
            
            # maxi.dma_read_packed(ram_b0, offset, b_offset, matrix_size)
            # maxi.dma_read_packed(ram_b1, offset, b_offset+matrix_size*4, matrix_size)

            
            comp(matrix_size, matrix_size, matrix_size, c_offset)

            saxi.write(1, 0)  # unset busy

# matrix_size*(matrix_size*datawidth/axi_datawidth + matrix_size*(matrix_size*datawidth/axi_datawidth+4) 
# + matrix_size*datawidth/axi_datawidth) 
    def comp_stream(size, offset, indexa, indexb):
        _size = size // (core_num*para)
        # print("begin")
        # print(_size)
        # print("end")
        strm.set_parameter('size', _size)
        # strm.set_multicore_ram_lists('a', ram_a_lists, 'indexa', offset, _size)
        # strm.set_multicore_ram_lists('b', ram_b_lists, 'indexb', offset, _size)
        strm.set_multicore('a', ram_a_list, offset, _size)
        strm.set_multicore('b', ram_b_list, offset, _size)

        # strm.set_source_parallel('a', ram_a_list, offset, _size)
        # strm.set_source_parallel('b', ram_b_list, offset, _size)
        # strm.set_source_parallel_pattern('a1', ram_a, offset, (4, size)) how to set start address
        # strm.set_source_parallel('a1', ram_a1, offset, _size)
        # print("ssss:",size//para)
        # strm.set_source_parallel('b0', ram_b0, offset, _size)
        # strm.set_source_parallel('b1', ram_b1, offset, _size)
        #strm.set_source_parallel(name='a', ram = ram_a, offset = offset, size = size//para)
        # this offest is the offset of every ram
        # print(offset+indexa*matrix_size+indexb*core_num)
        strm.set_sink_parallel('sum_list', ram_c, offset=offset, size = 1, stride=1)
        strm.run()
        strm.join()

# 16*(16+16*(16+pipline_depth+5+16)+16) =  11008
# actually: 16556 cycle
    def comp(matrix_size_a, matrix_size_b, matrix_size_k, c_offset):
        # maxi.dma_read_packed(ram_b0, 0, b_offset, matrix_size)
        # maxi.dma_read_packed(ram_b1, 0, a_offset+matrix_size*4, matrix_size)
        for i in range(matrix_size_a):
            # maxi.dma_read_packed(ram_a0, 0, a_offset+i*matrix_size*4, matrix_size)
            # maxi.dma_read_packed(ram_a1, 0, a_offset+i*matrix_size*4, matrix_size)
            # maxi.dma_read_packed(ram_a2, 0, a_offset+i*matrix_size*4, matrix_size)   
            # maxi.dma_read_packed(ram_a3, 0, a_offset+i*matrix_size*4, matrix_size)       
            maxi.dma_read_packed_multi_ram(ram_a_list, 0, a_offset+i*matrix_size*4, matrix_size_a, core_num, same_content=True)
            for j in range(matrix_size_b//(core_num)):
                maxi.dma_read_packed_multi_ram(ram_b_list, 0, b_offset+j*core_num*matrix_size*4, matrix_size_b, core_num)
                # maxi.dma_read_packed(ram_b0, 0, b_offset+(j*core_num+0)*matrix_size*4, matrix_size)
                # maxi.dma_read_packed(ram_b1, 0, b_offset+(j*core_num+1)*matrix_size*4, matrix_size)
                # maxi.dma_read_packed(ram_b2, 0, b_offset+(j*core_num+2)*matrix_size*4, matrix_size)
                # maxi.dma_read_packed(ram_b3, 0, b_offset+(j*core_num+3)*matrix_size*4, matrix_size)
                comp_stream(matrix_size*core_num,  0, i, j)
                maxi.dma_write(ram_c, 0, c_offset+(i*matrix_size+j*core_num)*4, core_num)
        #maxi.dma_write(ram_c, 0, c_offset, matrix_size*matrix_size)
    
    th = vthread.Thread(m, 'th_matmul', clk, rst, matmul)
    fsm = th.start()
    return m


def mkTest(memimg_name=None):

    a_shape = (matrix_size, matrix_size)
    b_shape = (matrix_size, matrix_size)
    c_shape = (a_shape[0], b_shape[0])

    n_raw_a = axi.shape_to_length(a_shape)
    n_raw_b = axi.shape_to_length(b_shape)

    n_a = axi.shape_to_memory_size(a_shape, datawidth)
    n_b = axi.shape_to_memory_size(b_shape, datawidth)

    a = np.zeros(a_shape, dtype=np.int32)
    b = np.zeros(b_shape, dtype=np.int32)

    value = 1
    for y in range(a_shape[0]):
        for x in range(a_shape[1]):
            if x == y:
                a[y][x] = value
                value += 1
            else:
                a[y][x] = 0
    # a[0][1] = 10
    #a[1][0] = 2
    for y in range(b_shape[0]):
        for x in range(b_shape[1]):
            if x == y:
                b[y][x] = 2
            else:
                b[y][x] = 0
    
    # b[0][1] = 10
    # b[1][0] = 7
    a_addr = a_offset
    size_a = n_a * datawidth // 8
    b_addr = b_offset
    size_b = n_b * datawidth // 8

    mem = np.zeros([1024 * 1024 * 8 // axi_datawidth], dtype=np.int64)
    axi.set_memory(mem, a, axi_datawidth, datawidth, a_addr)
    axi.set_memory(mem, b, axi_datawidth, datawidth, b_addr)

    led = mkLed()

    m = Module('test')
    params = m.copy_params(led)
    ports = m.copy_sim_ports(led)
    clk = ports['CLK']
    rst = ports['RST']

    memory = axi.AxiMemoryModel(m, 'memory', clk, rst,
                                mem_datawidth=axi_datawidth,
                                memimg=mem, memimg_name=memimg_name, write_delay=0, read_delay=0, sleep_interval=0, keep_sleep=0)

    memory.connect(ports, 'maxi')

    # AXI-Slave controller
    _saxi = vthread.AXIMLite(m, '_saxi', clk, rst, noio=True)
    _saxi.connect(ports, 'saxi')

    # Timer
    counter = m.Reg('counter', 32, initval=0)
    seq = Seq(m, 'seq', clk, rst)
    seq(
        counter.inc()
    )

    def ctrl():
        for i in range(100):
            pass

        awaddr = 2 * 4
        print('# matrix_size = %d' % matrix_size)
        _saxi.write(awaddr, matrix_size)

        awaddr = 3 * 4
        print('# a_offset = %d' % a_offset)
        _saxi.write(awaddr, a_offset)

        awaddr = 4 * 4
        print('# b_offset = %d' % b_offset)
        _saxi.write(awaddr, b_offset)

        awaddr = 5 * 4
        print('# c_offset = %d' % c_offset)
        _saxi.write(awaddr, c_offset)

        awaddr = 0 * 4
        start_time = counter
        print('# start time = %d' % start_time)
        _saxi.write(awaddr, 1)

        araddr = 4 * 1
        while True:
            busy = _saxi.read(araddr)
            if not busy:
                break

        end_time = counter
        print('# end time = %d' % end_time)
        time = end_time - start_time
        print('# core_num = %d, par = %d, exec_time = %d' % (core_num, para, time))

        all_ok = True
        
        for i in range(16):
            v = memory.read(c_offset + i * datawidth // 8)
            # print(v)

        for y in range(matrix_size):
            for x in range(matrix_size):
                v = memory.read(
                    c_offset + (y * matrix_size + x) * datawidth // 8)
                if y == x and vthread.verilog.NotEql(v, (y + 1) * 2):
                    all_ok = False
                    print("NG [%d,%d] = %d" % (y, x, v))
                if y != x and vthread.verilog.NotEql(v, 0):
                    all_ok = False
                    print("NG [%d,%d] = %d" % (y, x, v))

        if all_ok:
            print('# verify: PASSED')
        else:
            print('# verify: FAILED')

        vthread.finish()

    th = vthread.Thread(m, 'th_ctrl', clk, rst, ctrl)
    fsm = th.start()

    uut = m.Instance(led, 'uut',
                     params=m.connect_params(led),
                     ports=m.connect_ports(led))

    simulation.setup_waveform(m, uut)
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
    rslt = run(filename='tmpGEMM.v')
    print(rslt)
    # memimg_name = 'memimg_' + 'tmp.v'
    # test = mkTest(memimg_name=memimg_name)
    # sim = simulation.Simulator(test, sim='verilator')
    # rslt = sim.run(outputfile='verilator.out')
    # print(rslt)
