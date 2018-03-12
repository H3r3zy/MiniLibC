global strchr
section .text

strchr:
        cmp BYTE [rdi], sil
        jz found
        cmp BYTE [rdi], 0
        jz notfound
        inc rdi
        jmp strchr

notfound:
        mov rax, 0
        jmp end

found:
        mov rax, rdi

end:
        ret