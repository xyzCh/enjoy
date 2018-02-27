
assume ds:data,cs:code

data segment
	str db 20 dup('*'),'$'
	str_len=$-str-1
	spac db 10 dup(' '),'$'
	spac_len=$-spac-1
data ends

code segment
start:
	mov ax,data
	mov ds,ax
	mov cx,spac_len
	xor bx,bx
again:
	mov dx,offset spac+1
	add dx,bx
	inc bx
	mov ah,09h
	int 21h
	xor ax,ax
	mov al,02h
	mul bx
	mov dx,str_len+1
	sub dx,ax
	mov ah,09h
	int 21h
	mov ah,02h
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
loop again
	mov ah,4ch
	int 21h
code ends
end start