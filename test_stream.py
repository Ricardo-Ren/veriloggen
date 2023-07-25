from __future__ import absolute_import
from __future__ import print_function
from __future__ import division

import math

import veriloggen as vg
import veriloggen.thread as vthread
import veriloggen.stream as vstream

from . import util

def _tmp_name(prefix=None):
    global _tmp_counter
    if prefix is None:
        prefix = 'tmp'
    name = '%s_%d' % (prefix, _tmp_counter)
    _tmp_counter += 1
    return name

def madd(m, clk, rst,
         x_datawidth, x_point, x_signed,
         y_datawidth, y_point, y_signed,
         z_datawidth, z_point, z_signed,
         sum_width=None, sum_point=None, sum_signed=None):

    name = _tmp_name('madd')
    datawidth = max(x_datawidth, y_datawidth, z_datawidth)
    point = max(x_point, y_point, z_point)

    stream = vthread.Stream(m, name, clk, rst, datawidth)
    x = stream.source('x', x_datawidth, x_point, x_signed)
    y = stream.source('y', y_datawidth, y_point, y_signed)
    z = stream.source('z', z_datawidth, z_point, z_signed)

    sum = stream.Madd(x, y, z)
    sum.latency = 4
    if sum_width is not None:
        sum.width = sum_width
    if sum_signed is not None:
        sum.signed = sum_signed
    if sum_point is not None and point != sum_point:
        sum = stream.Cast(sum, point=sum_point)

    stream.sink(sum, 'sum')
    return stream

