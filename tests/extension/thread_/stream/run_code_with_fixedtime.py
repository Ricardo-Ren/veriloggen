import threading
import time
from parallel_reduce_multicore import vg_reduce
def run_with_timeout(func, args=(), timeout=5):
    class TimeoutError(Exception):
        pass

    def target():
        try:
            result = func(*args)
            event.set()  # 任务完成，设置事件
            return result
        except Exception as e:
            exception[0] = e
            event.set()  # 任务异常，设置事件

    event = threading.Event()
    exception = [None]

    thread = threading.Thread(target=target)
    thread.start()

    event.wait(timeout)  # 等待事件，超时时间为timeout

    if event.is_set():
        if exception[0] is not None:
            raise exception[0]  # 抛出任务异常
        else:
            print("程序执行完毕")
    else:
        thread.join()
        print("程序超时，执行被终止")

# 示例函数
def long_running_task(name):
    print(f"任务 {name} 开始")
    # 模拟一个长时间执行的任务
    for i in range(10**7):
        pass
    print(f"任务 {name} 完成")

# 使用示例
run_with_timeout(vg_reduce, timeout=5)
