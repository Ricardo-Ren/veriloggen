import parallel_veriloggen
n = 10
m = 10
k = 20
A = [[j for j in range(k)] for i in range(n)] 
B = [[j for j in range(m)] for i in range(k)] 
C = [[ None for j in range(m)] for i in range(n)] 


num_cores = 8
par = 4

@vg.to_veriloggen(num_cores, par)
def mm(maxi: vg.AXIM(vg.int32), a: vg.RAM(vg.int32, 128), b: vg.RAM(vg.int32, 128), c: vg.RAM(vg.int32, 128)):
    offset = 0
    num_iter = 1024 / 128
    sum = 0
    for j in range(num_iter):
        maxi.dma_read(a, 0, 0x1000 + offset, 128)  # -> thread
        maxi.dma_read(b, 0, 0x2000 + offset, 128)  # -> thread

        vg.to_stream_begin()
        # -> strm.run()
        # -> strm (begin)
        a = vg.tensor(size)
        b = vg.tensor(size)
        # for i in range(c.size):
        #     sum += a[i] * b[i]
        # -> strm (end)
        # -> strm.join()
        vg.to_stream_end()

        offset += 128 * 4
    c[0] = sum
    maxi.dma_write(c, 0, 0x3000 + offset, 1)
# pynq
@parallel_veriloggen.parallel_veriloggen
def Matrix_add(n,m,A,B,C, core_num, par):
    for i in range(n):
        for j in range(m):
            C[i][j] = A[i][j] + B[i][j]


# for i in range(n):
#     for j in range(m):
#         for t in range(k):
#             C[i][j] = C[i][j] + (A[i][t] * B[t][j])

# how to map the memory to the FPGA side
Matrix_add(n, m, A, B, C, 1, 4)