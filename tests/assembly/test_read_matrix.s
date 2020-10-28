.import ../../src/read_matrix.s
.import ../../src/utils.s

.data
file_path: .asciiz "tests/inputs/simple0/bin/inputs/input0.bin"

.text
main:
    # Read matrix into memory
    addi sp, sp, -24
    sw s0, 0(sp)
    sw s1, 4(sp)        # num of rows
    sw s2, 8(sp)        # num of cols
    sw s3, 12(sp)       #first pointer
    sw s4, 16(sp)       #second pointer
    sw ra, 20(sp)

    la s0 file_path     #store file_path

    li a0 4             #malloc 4 bytes
    jal ra malloc
    mv s3 a0            #set s3 to first pointer

    li a0 4             #malloc 4 bytes
    jal ra malloc
    mv s4 a0            #set s4 to second pointer
    
    addi t1, x0, -1
    addi t2, x0, -1
    sw t1 0(s3)         #store int to pointer
    sw t2 0(s4)         #store int to pointer

    mv a1 s3
    mv a2 s4
    mv a0 s0            #set a0 to file_path

    jal ra read_matrix  #stored in a0

    # Print out elements of matrix
    #mv a1 t1
    #jal ra print_int
    #mv a1 t2
    #jal ra print_int

    add a1, x0, t1
    add a2, x0, t2
    jal ra print_int_array

    jal ra free     #free matrix in a0
  
    # Terminate the program

    mv a0 s3
    jal ra free             #free the pointers
    mv a0 s4    
    jal ra free

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw ra, 20(sp)
    addi sp, sp, 24

    j exit
    