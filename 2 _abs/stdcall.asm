org 0x100

a: word 0xFFFF

start:
    ld a
    push
    
    call $abs

    swap
    pop

    hlt

abs:
    push

    ld &2
    st &0

    bpl end_of_func
    neg
    st &0
    
    end_of_func:
        ld &0

        swap
        pop

        ret