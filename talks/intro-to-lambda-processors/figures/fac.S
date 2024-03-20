factorial:
        beqz    a0, .LBB0_6
        addi    a1, a0, 1
        li      a0, 2
        bltu    a0, a1, .LBB0_3
        li      a1, 2
.LBB0_3:
        li      a2, 1
        li      a0, 1
.LBB0_4:
        mul     a0, a2, a0
        addi    a2, a2, 1
        bne     a1, a2, .LBB0_4
        ret
.LBB0_6:
        li      a0, 1
        ret
