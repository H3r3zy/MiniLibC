global strncmp
section .text

strncmp:
        mov rcx, 1
loop:
        mov al, [rsi]
        mov r8b, [rdi]

        cmp rcx, rdx
        jz end
        cmp r8b, al
        jne end
        cmp r8b, 0
        je end
        cmp al, 0
        je end

        inc rdi
        inc rsi
        inc rcx

        jmp loop

end:
        sub r8b, al
        movsx rax, r8b
        ret