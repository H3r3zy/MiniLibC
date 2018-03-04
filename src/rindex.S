global rindex
section .text

rindex:
        xor rcx, rcx

loop1:
        cmp BYTE [rdi + rcx], 0
        jz loop2
        inc rcx
        jmp loop1

loop2:
        cmp BYTE [rdi + rcx], sil
        je found
        cmp rcx, 0
        je notfound
        dec rcx
        jmp loop2

notfound:
        mov rax, 0
        jmp end

found:
        mov rax, rdi
        add rax, rcx

end:
        ret