
; void  ft_bzero(void *s, size_t n)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_bzero

_ft_bzero:
		enter			0, 0
	
loop:
		cmp				rsi, 0		; set flag ZF if rsi (n) - 0 == 0
		je				return		; if ZF is set jump to return
		dec				rsi			; decrement size_t n
		mov		BYTE	[rdi + rsi], 0
		jmp				loop		; loop while n > 0

return:
		leave
		ret

