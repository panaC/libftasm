
; char  *ft_strcpy(char *dest, const char *src)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_strcpy

_ft_strcpy:
		enter			0, 0
		mov				rax, 0				; assgn 0 to rax (i)

loop:
		cmp		BYTE	[rsi + rax], 0		; set the flags if end of string
		je				return				; and jump to return
		mov				r8, [rsi + rax]		; used tempory register to save src[i]
		mov				[rdi + rax], r8		; dest[i] = src[i]
		inc				rax					; i++
		jmp				loop				; loop while src isn't finish

return:
		mov		BYTE	[rdi + rax], 0		; finish the string with a '\0'
		mov				rax, rdi			; return dest
		leave
		ret
