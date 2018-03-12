global memmove
section .text

memmove:
        dec rdx
while:
        mov al, [rsi + rdx]
        mov [rdi + rdx], al
        dec rdx
        cmp rdx, 0
        jz end
        jmp while

end:
        mov rax, rsi
        ret