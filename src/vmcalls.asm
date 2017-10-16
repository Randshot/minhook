PUBLIC checkhv
PUBLIC setDataPagehv
PUBLIC activatePagehv
PUBLIC deactivatePagehv
PUBLIC deactivateAllPageshv
PUBLIC isPageSplithv
PUBLIC writeCodePagehv
PUBLIC setAdjusterhv

.CODE
MAGIC_NUMBER:
dq 0B045EACDACD52E22h
ALIGN     8
checkhv PROC FRAME
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rcx,0000h
vmcall
mov rax,rcx
pop rbx
ret
checkhv ENDP
ALIGN     8

setDataPagehv PROC FRAME
;void* pageAddr, void* data
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx,rcx
mov rcx,0001h
vmcall
mov rax,rcx
pop rbx
ret
ALIGN     8
setDataPagehv ENDP

activatePagehv PROC FRAME
;void* pageAddr
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx,rcx
mov rcx,0002h
vmcall
mov rax,rcx
pop rbx
ret
ALIGN     8
activatePagehv ENDP

writeCodePagehv PROC FRAME
;rcx, rdx, r8 from,to,bytes
push rsi
push rbx
.ENDPROLOG
mov rax,2
mov rsi, rdx
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx, rcx
;mov r8, r8
mov rcx,0006h
vmcall
mov rax,rcx
pop rbx
pop rsi
ret
ALIGN     8
writeCodePagehv ENDP

deactivatePagehv PROC FRAME
;void* pageAddr
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx,rcx
mov rcx,0003h
vmcall
mov rax,rcx
pop rbx
ret
ALIGN     8
deactivatePagehv ENDP

deactivateAllPageshv PROC FRAME
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rcx,0004h
vmcall
mov rax,rcx
pop rbx
ret
ALIGN     8
deactivateAllPageshv ENDP
ALIGN     8

isPageSplithv PROC FRAME
push rbx
.ENDPROLOG
mov rax,2
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx, rcx
mov rcx,0005h
vmcall
mov rax,rcx
pop rbx
ret
ALIGN     8
isPageSplithv ENDP
ALIGN     8

setAdjusterhv PROC FRAME
;rcx, rdx, r8 from,to,by
push rsi
push rbx
.ENDPROLOG
mov rax,2
mov rsi, rdx
mov rdx,QWORD PTR [MAGIC_NUMBER]
mov rbx, rcx
;mov r8, r8
mov rcx,1000h
vmcall
mov rax,rcx
pop rbx
pop rsi
ret
ALIGN     8
setAdjusterhv ENDP

_TEXT ENDS
END
