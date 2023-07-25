# original_program

'''
for i in range(10):
    a2[i] = a1[i]+b1[i]

for j in range(10): 
    c2[j] = a2[j]+b2[j]

'''


main_memory = [None]*1000

address_a1 = 0


address_a2 = 0
address_b2 = 50
address_c2 = 100

address_a2 = 0
address_a1 = 150
address_b1 = 0


tensor_n  = 10



ram_a = [None]*100
ram_b = [None]*100
ram_c = [None]*100

i=0
j=0
k=0
main_memory[0] = address_a2
main_memory[1] = address_b2
main_memory[2] = address_c2
main_memory[3] = tensor_n

# stream
a = ram_a[i]
b = ram_b[j]
c = ram_c[k]
c = a + b

# thread
 
for i in range(10):
    main_memory[address_a2+i] = main_memory[address_a1+i]+main_memory[address_b1+i]


address_a = main_memory[0]
address_b = main_memory[1]
address_c = main_memory[2]
tensor_n = main_memory[3]

ram_a = main_memory[address_a:address_a+tensor_n]
ram_b = main_memory[address_b:address_b+tensor_n]



for t in range(tensor_n):
    i=t, j=t, k=t
    ram_c[k] = c

main_memory[address_c:address_c+tensor_n] = ram_c[address_c:address_c+tensor_n]



