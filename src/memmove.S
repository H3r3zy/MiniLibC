global memmove
section .text

memmove:
        dec rdx
while:
        mov al, [rsi + rdx]
        mov [rdi + rdx], al
        dec rdx
        jmp while
        cmp rdx, 0
        jz end

end:
        mov rax, rdi
        ret