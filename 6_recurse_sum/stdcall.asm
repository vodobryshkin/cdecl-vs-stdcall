org 0x100

a: word 0x0004
ld a

push

call $sum

hlt

sum:
    cmp #0x01
    beq ret_one
    jump ret_con

    ret_one:
        ld #0x01
        
        swap
        st &1
        pop

        ret

    ret_con:
        push

        dec

        push
        call $sum

        add &2
        
        st &0

        ld &0

        swap
        pop

        swap
        st &1
        pop

        ret