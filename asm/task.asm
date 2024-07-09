[bits 64]

global context_switch

context_switch:
    ; Save current task state
    ; pushfq  
    ; pushfq
    push rax
    push rcx
    push rdx
    push rbx
    push rbp
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    mov [rdi], rsp

    ; Load new task state
    mov rsp, [rsi]

    mov rax, cr0
    or rax, 8
    mov cr0, rax

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rbp
    pop rbx
    pop rdx
    pop rcx
    pop rax
    ; popfq

	iretq
