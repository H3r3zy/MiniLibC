global strstr
section .text

strstr:
        xor rcx, rcx ; counter principal

loop1:
        mov r8b, [rdi]
        mov r9b, [rsi]

        cmp r9b, 0
        je found

        cmp r8b, r9b
        je start2

reprise1:
        cmp r8b, 0
        je notfound
        inc rdi
        jmp loop1

start2:
        xor rcx, rcx ; counter secondaire

loop2:
        mov r8b, [rdi + rcx]
        mov r9b, [rsi + rcx]

        cmp r9b, 0
        je found
        cmp r8b, r9b
        jne reprise1
        inc rcx
        jmp loop2


found:
        mov rax, rdi
        jmp end

notfound:
        xor rax, rax

end:
        ret
