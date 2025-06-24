
_start:
    ##### Block 2 ############
    # Arithmetic Instructions
    add x1, x2, x3       # x1 = x2 + x3
    sub x4, x5, x6       # x4 = x5 - x6
    mul x7, x8, x9       # x7 = x8 * x9
    div x10, x11, x12    # x10 = x11 / x12
    rem x13, x14, x15    # x13 = x14 % x15
    # Control Flow Instructions
    beq x20, x21, block_3 # if (x20 == x21) goto block_3,
     
    #Block 1: The number of halfwords represented by instructions retired in this block is 44

block_3:
    # Logical Instructions
    and x16, x17, x18    # x16 = x17 & x18
    or x19, x20, x21     # x19 = x20 | x21
    xor x22, x23, x24    # x22 = x23 ^ x24
    sll x25, x26, x27    # x25 = x26 << x27
    srl x28, x29, x30    # x28 = x29 >> x30

    li x22, 5  # Load constant value 5 into register X22
    li x23, 10 # Load constant value 10 into register X23
    
    # Control Flow Instructions
    bne x22, x23, block_4 # if (x22 != x23) goto block_4

block_4:
    # Immediate Instructions
    addi x31, x1, 10     # x31 = x1 + 10
    andi x2, x3, 0xFF    # x2 = x3 & 0xFF
    ori x4, x5, 0xFF     # x4 = x5 | 0xFF
    xori x6, x7, 0xFF    # x6 = x7 ^ 0xFF
    slli x8, x9, 2       # x8 = x9 << 2
    srli x10, x11, 2     # x10 = x11 >> 2

    # Load and Store Instructions
    lw x12, 0(x13)       # x12 = Memory[x13 + 0]
    sw x14, 4(x15)       # Memory[x15 + 4] = x14
    ld x16, 8(x17)       # x16 = Memory[x17 + 8]
    sd x18, 12(x19)      # Memory[x19 + 12] = x18
    li x22, 5  # Load constant value 5 into register X22
    li x23, 10 # Load constant value 10 into register X23
    li x1, 15  # Load constant value 15 into register x24
    li x2, 20 # Load constant value 20 into register x25    
    blt x1, x2, block_5 # if (x24 < x25) goto block_5


block_5:
    li x1, 25  # Load constant value 25 into register x26
    li x2, 20 # Load constant value 20 into register x27
    bge x1, x2, block_6 # if (x26 >= x27) goto _start

block_6:
    jal x28, block_7      # x28 = PC + 4; PC = label6
    
block_7:
    li x30, 0x80000000 
    jalr x29, x30, 0     # x29 = PC + 4; PC = x30 + 0
    
    # System Instructions
    #ecall               # Environment call
    #ebreak              # Environment break
    # End of program
    #j 0x80000000            # Loop back to start
    