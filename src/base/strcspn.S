global strcspn
section .text

strcspn:
        xor rax, rax

loop1:
        mov r8b, [rdi]
        cmp r8b, 0
        je end
        jmp start2
reprise1:
        inc rdi
        inc rax
        jmp loop1



start2:
        xor rcx, rcx
loop2:
        mov r9b, [rsi+rcx]
        cmp r8b, r9b
        je end
        cmp r9b, 0
        je reprise1
        inc rcx
        jmp loop2

end:
        mov rax, rax
        ret