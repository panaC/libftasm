
segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _my_fct

_my_fct:
		enter 0,0
		pusha

		popa
		mov eax, 0
		leave
		ret

