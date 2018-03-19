global memmove
section .text

while1:
        mov al, [rsi + rcx]
        mov [rdi + rcx], al

        cmp rdx, rcx
        je end
        inc rcx
        jmp while1

memmove:
        xor rcx, rcx

        cmp rdx, 0
        je end
        dec rdx
        cmp rsi, rdi
        jg while1

while:
        mov al, [rsi + rdx]
        mov [rdi + rdx], al

        dec rdx
        cmp rdx, -1
        je end
        jmp while

end:
        mov rax, rdi
        ret