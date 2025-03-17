org 0x100

a:  word 0x0005
b:  word 0x0002

start:
    ld b
    push

    ld a
    push
    
    call $multiply

    hlt

multiply:
    ; prologue
    push ; memory for c
    push ; memory for i

    ; body
    cla ; c
    st  &1

    cla ; i
    st  &0

    ; loop for
    for_body:
        ld  &0 ; next i
        cmp &4 ; comparison with b
        bge for_done ; go to for_exit if 

        ld  &1
        add &3 ; c = c + a
        st &1

        ld &0
        inc
        st  &0 ; i++

        jump for_body  
    for_done:
        ld  &1
    ; end
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
