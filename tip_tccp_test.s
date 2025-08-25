_start:
    li x1, 5
    li x2, 10

    beq x1, x2, block_1   # if (x1 == x2) goto block_1
    beq x1, x2, block_1   # if (x1 == x2) goto block_1
    bne x1, x2, block_2   # if (x1 != x2) goto block_2

block_1:
    li x3, 20
    blt x1, x3, block_3   # if (x1 < x3) goto block_3
    bge x1, x3, _start    # if (x1 >= x3) goto _start

block_2:
    li x4, 15
    jal block_3          # x28 = PC + 4; PC = label3

block_3:
    li x5, 30
    bge x4, x5, block_2  # if (x4 >= x5) goto block_2
    j _start             # 