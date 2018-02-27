;ÕýÈý½Ç

assume cs:code,ds:data,ss:stack1
data segment
	str db 10 dup('*'),'$'
	len_str=$-str-1		;loopcount
data ends
;-------data

stack1 segment stack
	db 256 dup(?)
stack1 ends
;-------stack


;====main====
code segment
start:
	mov ax,data
	mov ds,ax
	mov cx,len_str
	xor bx,bx
again:
	mov bx,cx
	sub bx,01H
	add bx,offset str
	mov dx,bx
	mov ah,09H
	int 21h
	mov ah,02h
	mov dl,0Dh
	int 21h
	mov ah,02h
	mov dl,0ah
	int 21h
loop again
	mov ax,4c00H
	int 21h
code ends
end start