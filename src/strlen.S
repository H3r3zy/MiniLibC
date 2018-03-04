global strlen
section .text

strlen:
        xor eax, eax        ; Define EAX (32 bits variable) as length (xor is need to set all bits at 0)

while:
        cmp BYTE [rdi], 0          ; check if we are at the end of the string (0 = '\0')
        jz end          ; go to the label end if the statment before is true
        inc eax            ; incrment the length of the string
        inc rdi            ; go to the next char of the string
        jmp while           ; jump to the label while

end:
        ret                 ; return
