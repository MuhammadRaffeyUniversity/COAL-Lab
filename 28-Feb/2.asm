.model small
.stack 100h
.data
.code
main proc
    
   mov ah,02h
   
   mov dx,30h
   int 21h
   
   mov dx,31h
   int 21h
   
   mov dx,32h
   int 21h
   
   mov dx,33h
   int 21h
   
   mov dx,34h
   int 21h 
   
   mov dx,35h
   int 21h
   
   mov dx,36h
   int 21h
   
   mov dx,37h
   int 21h
   
   mov dx,38h
   int 21h
   
   mov dx,39h
   int 21h
   
   mov ah,4ch
   int 21h
    
    
    main endp
end main