get_divison_sign:
    push
    push
    push

    ; zn
    ld #0x01
    st &2

    ; a_sign
    ld &4
    push
    call $get_sign
    st &1

    ; b_sign
    ld &5
    push
    call $get_sign
    st &0

    ; if a_sign != b_sign => zn = FFFF
    ld &0
    cmp &1

    beq end_of_func_get_divison_sign
    ld #0xFF
    st &2

    end_of_func_get_divison_sign:
        ld &2

        swap
        pop

        swap
        pop

        swap
        pop

        swap
        st &2
        pop

        swap
        pop

        ret