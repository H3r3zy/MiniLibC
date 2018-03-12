global memset
section .text

memset: ; void *memset(void *s, int c, size_t n)
        mov rax, rdi ; create a tmp
while:
        cmp rdx, 0
        jz end
        mov [rax], sil
        inc rax
        dec rdx
        jmp while

end:
        mov rax, rdi
        ret