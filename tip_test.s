
_start:
    # Arithmetic Instructions
    add x1, x2, x3       # x1 = x2 + x3
    sub x4, x5, x6       # x4 = x5 - x6
    mul x7, x8, x9       # x7 = x8 * x9
    div x10, x11, x12    # x10 = x11 / x12
    rem x13, x14, x15    # x13 = x14 % x15

    # Logical Instructions
    and x16, x17, x18    # x16 = x17 & x18
    or x19, x20, x21     # x19 = x20 | x21
    xor x22, x23, x24    # x22 = x23 ^ x24
    sll x25, x26, x27    # x25 = x26 << x27
    srl x28, x29, x30    # x28 = x29 >> x30

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

    # Control Flow Instructions
    beq x20, x21, label1 # if (x20 == x21) goto label1
    bne x22, x23, label2 # if (x22 != x23) goto label2
    blt x24, x25, label3 # if (x24 < x25) goto label3
    bge x26, x27, label4 # if (x26 >= x27) goto label4
    jal x28, label5      # x28 = PC + 4; PC = label5
    jalr x29, x30, 0     # x29 = PC + 4; PC = x30 + 0

label1:
    j _start                 # No operation

label2:
    nop                 # No operation

label3:
    nop                 # No operation

label4:
    nop                 # No operation

label5:
    nop                 # No operation

    # System Instructions
    ecall               # Environment call
    ebreak              # Environment break

    # End of program
    j _start            # Loop back to start
    