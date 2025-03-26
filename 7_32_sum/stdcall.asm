; result in 0x100(older) 0x101(smaller)

org 0x100

res_older: word 0x0000
res_smaller: word 0x0000

a_older: word 0x00ff
a_smaller: word 0x4567

b_older: word 0x1111
b_smaller: word 0x0671

start:
    ld b_smaller
    push

    ld b_older
    push

    ld a_smaller
    push

    ld a_older
    push

    call $sum_32

    hlt

sum_32:
    clc
    ld &2
    add &4

    st res_smaller
    
    ld &1
    adc &3

    st res_older
    
    swap
    st &4
    pop

    swap
    pop

    swap
    pop

    swap
    pop

    ret