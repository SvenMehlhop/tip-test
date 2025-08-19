_start:
    li x1, 5
    li x2, 10

    add x3, x1, x2       # x3 = x1 + x2
    sub x4, x3, x1       # x4 = x3 - x1
    mul x5, x2, x4       # x5 = x2 * x4

    beq x1, x2, block_1   # if (x1 == x2) goto block_1
    bne x1, x2, block_2   # if (x1 != x2) goto block_2

block_1:
    li x6, 20
    and x7, x5, x6       # x7 = x5 & x6
    or x8, x7, x4        # x8 = x7 | x4
    xor x9, x8, x3       # x9 = x8 ^ x3

    blt x1, x6, block_3   # if (x1 < x6) goto block_3
    bge x1, x6, _start    # if (x1 >= x6) goto _start

block_2:
    li x10, 15
    sll x11, x9, 2       # x11 = x9 << 2
    srl x12, x11, 2      # x12 = x11 >> 2
    jal block_3          # x28 = PC + 4; PC = label3

block_3:
    li x13, 32
    lw x14, 0(x13)       # x14 = Memory[x13 + 0]
    sw x15, 4(x14)       # Memory[x14 + 4] = x15
    ld x16, 8(x15)       # x16 = Memory[x15 + 8]

    bge x10, x13, block_2  # if (x10 >= x13) goto block_2
    j _start             # Loop zurück zum Anfang