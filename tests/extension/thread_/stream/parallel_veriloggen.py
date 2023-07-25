import parallel_multicore

def parallel_veriloggen(func):
    def wrapper(*args, **kwargs):
        n = args[0]
        m = args[1]
        A = args[2]
        B = args[3]
        C = args[4]
        core_num = args[5]
        para = args[6]
        rslt= parallel_multicore.run(size=n*m, core_num=core_num, para=para)
        print(rslt)
    return wrapper
