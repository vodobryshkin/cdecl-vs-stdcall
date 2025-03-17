org 0x100

a: word 0x0001

start:
    ld a
    push
    
    call $get_sign

    hlt

get_sign:
    push

    ld #0x01
    st &0

    ld &2
    cmp #0x00

    bge end_of_func
    ld #0xFF
    st &0

    end_of_func:
        ld &0

        swap
        pop

        swap
        st &1
        pop

        ret