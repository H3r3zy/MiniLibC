global memcpy
section .text

memcpy:
        xor rcx, rcx ; define counter to 0

while:
        cmp rcx, rdx
        jz end
        mov al, [rsi + rcx]
        mov [rdi + rcx], al
        inc rcx
        jmp while

end:
        mov rax, rdi
        ret