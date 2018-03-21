global strncmp
section .text

strncmp:
        mov rcx, 1
loop:
        cmp rdx, 0
        je endNull
        mov al, [rsi]
        mov r8b, [rdi]

        cmp r8b, 0
        je end
        cmp al, 0
        je end
        cmp rcx, rdx
        jz end
        cmp r8b, al
        jne end


        inc rdi
        inc rsi
        inc rcx

        jmp loop

end:
        sub r8b, al
        movsx rax, r8b
        ret

endNull:
        mov rax, 0
        ret