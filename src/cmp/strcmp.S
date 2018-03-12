global strcmp
section .text

strcmp:
loop:
        mov al, [rsi]
        mov r8b, [rdi]

        cmp r8b, al
        jne end
        cmp r8b, 0
        je end
        cmp al, 0
        je end

        inc rdi
        inc rsi

        jmp loop

end:
        sub r8b, al
        movsx rax, r8b
        ret