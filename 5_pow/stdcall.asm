org 0x100

a:  word 0xFFFE
b:  word 0x0003

start:
    ld b
    push

    ld a
    push
    
    call $pow

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

        swap
        st &2
        pop

        swap
        pop

        ret

multiply:
    push
    push
    push
    push
    push

    ; c
    cla
    st &4

    ; sign
    push
    push

    ld &9
    st &1
    
    ld &8
    st &0

    call $get_divison_sign
    st &3

    ; abs_a
    push

    ld &7
    st &0

    call $abs
    st &2

    ; abs_b
    push

    ld &8
    st &0

    call $abs
    st &1

    ; i
    cla
    st &0

    multiply_start_loop:
        ld &0

        cmp &1
        bge multiply_end_loop
        
        inc
        st &0
        
        ld &4
        add &2
        st &4

        jump multiply_start_loop
    
    multiply_end_loop:
        ld &3
        cmp #0xFF

        bne end_of_func_multiply
        ld &4
        neg
        st &4
    
    end_of_func_multiply:
        ld &4
        
        swap
        pop

        swap
        pop

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

pow:
    push
    push

    ; res
    ld #0x01
    st &1

    ; i
    cla
    st &0

    pow_start_of_loop:
        ld &0
        cmp &4
        bge pow_end_of_loop
        inc
        st &0

        ld &3
        push

        ld &2
        push

        call $multiply

        st &1

        jump pow_start_of_loop
    pow_end_of_loop:
        ld &1

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