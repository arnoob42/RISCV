
# .data
# hello_string:
#     .string "Hello %d"

# .text
#     main:
#         # addi x2,x0, 4# x2 - value
#         la x2, hello_string
#         addi a7,x0, 4
#         addi a0,x0,1
#         add a1,x0,x2
#         ecall

#         nop

## The following snippet prints a string "Hello world\n" using ecall 4
.data

X:
.asciiz "X["

num:
.word 42

endX:
.asciiz "]   "



.text
.globl main

main:
addi a0, x0, 4# print_string ecall (ecall no. 4)
la a1,X
ecall

addi a0,x0,1
la x2, num
lw a1, 0(x2)
ecall


# addi a0, x0, 4 # print_string ecall (ecall no. 4)
# la a1,num
# ecall
addi a0, x0, 4# print_string ecall (ecall no. 4)
la a1,endX
ecall
