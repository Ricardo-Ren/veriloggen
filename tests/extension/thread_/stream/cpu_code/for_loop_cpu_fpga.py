# original_program
'''
for i in range(2): # and this is to write address to main memory
    for j in range(10): # from this line, it works on FPGA
        c[j] = a[j]+b[j]

'''

# code
main_memory = [None]*10000

address_a = 0
address_b = 50
address_c = 100
tensor_n  = 10

ram_a = [None]*100
ram_b = [None]*100
ram_c = [None]*100

i=0
j=0
k=0

a = ram_a[i]
b = ram_b[j]
c = ram_c[k]
c = a + b

# thread

# cpu outer_for_loop is just to write the address
main_memory[0] = address_a
main_memory[1] = address_a+10
main_memory[2] = address_b
main_memory[3] = address_b+10
main_memory[4] = address_c
main_memory[5] = address_c+10

# FPGA


address_a_temp = main_memory[0]
address_b_temp = main_memory[2]
address_c_temp = main_memory[4]

ram_a = main_memory[address_a_temp:address_a_temp+tensor_n]
ram_b = main_memory[address_b_temp:address_b_temp+tensor_n]

for t in range(tensor_n):
    i=t, j=t, k=t
    ram_c[k] = c

main_memory[address_c_temp:address_c_temp+tensor_n] = ram_c[address_c_temp:address_c_temp+tensor_n]

address_a_temp = main_memory[1]
address_b_temp = main_memory[3]
address_c_temp = main_memory[5]

ram_a = main_memory[address_a_temp:address_a_temp+tensor_n]
ram_b = main_memory[address_b_temp:address_b_temp+tensor_n]
for t in range(tensor_n):
    i=t, j=t, k=t
    ram_c[k] = c
main_memory[address_c_temp:address_c_temp+tensor_n] = ram_c[address_c_temp:address_c_temp+tensor_n]

#


