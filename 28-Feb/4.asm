.model small
.stack 100h
.data
.code
main proc
    
   mov ah,02h
   
   mov dx,48
   int 21h
     
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,49
   int 21h
   
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,50
   int 21h
   
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,51
   int 21h
   
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,52
   int 21h 
   
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,53
   int 21h

   mov dx,10
   int 21h
   mov dx,13
   int 21h
   
   mov dx,54
   int 21h

   mov dx,10
   int 21h
   mov dx,13
   int 21h
   
   mov dx,55
   int 21h

   mov dx,10
   int 21h
   mov dx,13
   int 21h
   
   mov dx,56
   int 21h
   
   mov dx,10
   int 21h
   mov dx,13
   int 21h

   mov dx,57
   int 21h
   
   mov ah,4ch
   int 21h
    
    
    main endp
end main