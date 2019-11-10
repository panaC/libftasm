
; char			*ft_strcat(char *dest, const char *src)

segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _ft_strcat
		extern _ft_strlen

_ft_strcat:
		enter			0, 0
		mov				r8, rdi			; save dest ptr

		mov				rdi, rsi		; set in rcx the length of src
		call			_ft_strlen
		mov				r9, rax

		mov				rdi, r8			; set dest += strlen(dest)
		call			_ft_strlen
		add		BYTE	rdi, rax

		cld
		mov				rcx, r9

loop:
		lodsb
		movsb
		loop			loop

		mov				rax, r8
		leave
		ret
