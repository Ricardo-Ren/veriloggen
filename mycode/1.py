from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import numpy as np
from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi
datawidth = 32

def mkLed():
    m = Module('blinkled')
    clk = m.Input('CLK')
    rst = m.Input('RST')

    addrwidth = 10
    ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth, addrwidth)
    ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth, addrwidth)
    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)

    maxi = vthread.AXIM(m, 'maxi', clk, rst, datawidth)
    saxi = vthread.AXISLiteRegister(m, 'saxi', clk, rst, datawidth, length=8)

    # Stream definition
    strm = vthread.Stream(m, 'strm_madd', clk, rst)
    a = strm.source('a')
    b = strm.source('b')
    size = strm.parameter('size')
    sum, sum_valid = strm.ReduceAddValid(a * b, size)
    strm.sink(sum, 'sum', when=sum_valid, when_name='sum_valid')

    def strm_madd(size, waddr):
        strm.set_source('a', ram_a, 0, size)
        strm.set_source('b', ram_b, 0, size)
        strm.set_parameter('size', size)
        strm.set_sink('sum', ram_c, waddr, 1)
        strm.run()
        strm.join()

    def matmul():
        while True:
            saxi.wait_flag(0, value=1, resetvalue=0)
            saxi.write(1, 1)  # set busy

            matrix_size = saxi.read(2)
            a_offset = saxi.read(3)
            b_offset = saxi.read(4)
            c_offset = saxi.read(5)
            comp(matrix_size, a_offset, b_offset, c_offset)

            saxi.write(1, 0)  # unset busy

    def comp(matrix_size, a_offset, b_offset, c_offset):
        a_addr, c_addr = a_offset, c_offset

        for i in range(matrix_size):
            maxi.dma_read(ram_a, 0, a_addr, matrix_size)

            b_addr = b_offset
            for j in range(matrix_size):
                maxi.dma_read(ram_b, 0, b_addr, matrix_size)

                strm_madd(matrix_size, j)

                b_addr += matrix_size * (datawidth // 8)

            maxi.dma_write(ram_c, 0, c_addr, matrix_size)
            a_addr += matrix_size * (datawidth // 8)
            c_addr += matrix_size * (datawidth // 8)

    th = vthread.Thread(m, 'th_matmul', clk, rst, matmul)
    fsm = th.start()

    return m


led = mkLed()
m = Module('test')
params = m.copy_params(led)
ports = m.copy_sim_ports(led)
clk = ports['CLK']
rst = ports['RST']

counter = m.Reg('counter', 32, initval=0)
ounter = m.Reg('counter', 32, initval=0)
seq = Seq(m, 'seq', clk, rst)
seq(
    counter.inc()
)