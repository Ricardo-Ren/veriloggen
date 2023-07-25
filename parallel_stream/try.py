def append_to_list(num, my_list=[1,2]):
    my_list.append(num)
    return my_list

print(append_to_list(1))  # 输出 [1]
print(append_to_list(2))  # 输出 [1, 2]，而不是 [2]
print(append_to_list(3))  # 输出 [1, 2, 3]，而不是 [3]
