org 0x100

a: word 0xFFFF

start:
    ld a
    push
    
    call $abs

    hlt

abs:
    push

    ld &2
    st &0

    bpl end_of_func_abs
    neg
    st &0
    end_of_func_abs:
        ld &0

        swap
        pop

        swap
        st &1
        pop

        ret