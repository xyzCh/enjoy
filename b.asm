;µ¹Èý½Ç

	assume ds:data,cs:code,ss:stack1

	data segment
		str db 10 dup('*'),'$'
		len_str=$-str-1
	data ends

	stack1 segment stack
		db 256 dup(?)
	stack1 ends

	code segment
start:
		mov ax,data
		mov ds,ax
		mov cx,len_str
		xor bx,bx
again:
		add bx,offset str
		mov dx,bx
		inc bx
		mov ah,09h
		int 21h
		mov ah,02h
		mov dl,0Dh
		int 21h
		mov ah,02h
		mov dl,0ah
		int 21h
loop again
		mov ax,4c00h
		int 21h
	code ends
end start