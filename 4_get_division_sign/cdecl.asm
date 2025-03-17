org 0x100

a: word 0x1233
b: word 0x0777

start:
    ld b
    push

    ld a
    push

    call $get_divison_sign

    swap
    pop

    swap
    pop

    hlt

get_sign:
    push

    ld #0x01
    st &0

    ld &2
    cmp #0x00

    bge end_of_func_get_sign
    ld #0xFF
    st &0

    end_of_func_get_sign:
        ld &0

        swap
        pop

        swap
        st &1
        pop

        ret

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

        ret
org 0x100

a: word 0x1233
b: word 0x0777

start:
    ld b
    push

    ld a
    push

    call $get_divison_sign

    hlt

get_sign:
    push

    ld #0x01
    st &0

    ld &2
    cmp #0x00

    bge end_of_func_get_sign
    ld #0xFF
    st &0

    end_of_func_get_sign:
        ld &0

        swap
        pop

        swap
        st &1
        pop

        ret