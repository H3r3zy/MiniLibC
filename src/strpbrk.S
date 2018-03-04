global strpbrk
section .text

strpbrk:
        xor rcx, rcx ; counter principal

loop1:
        mov r8b, [rdi]
        mov r9b, [rsi]


        jmp start2

reprise1:
        cmp r8b, 0
        je notfound
        inc rdi
        jmp loop1

start2:
        xor rcx, rcx ; counter secondaire

loop2:
        mov r9b, [rsi + rcx]

        cmp r9b, 0
        je reprise1
        cmp r9b, r8b
        je found

        inc rcx
        jmp loop2


found:
        mov rax, rdi
        jmp end

notfound:
        mov rax, 0

end:
        ret
