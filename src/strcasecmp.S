global strcasecmp
section .text

strcasecmp:
start1:
        mov r9b, [rsi]
        mov r11b, [rsi]

        cmp r9b, 65
        jl start2
        cmp r9b, 91
        jl tolower1
        jmp start2

tolower1:
        add r9b, 32

start2:
        mov r8b, [rdi]
        mov r10b, [rdi]

        cmp r8b, 65
        jl realloop
        cmp r8b, 91
        jl tolower2
        jmp realloop

tolower2:
        add r8b, 32

realloop:
        cmp r8b, r9b
        jne end         ; if not equal
        cmp r8b, 0
        je end
        cmp r9b, 0
        je end

        inc rdi
        inc rsi

        jmp start1

end:
        sub r8b, r9b
        movsx rax, r8b
        ret