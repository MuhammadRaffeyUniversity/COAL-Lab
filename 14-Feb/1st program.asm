.model small;model segment there are 6 types of models
;--tiny
;--small
;--compact
;--medium
;--large
;--huge

.stack 100h; stack segment of 100hex
.data; data segment to define all the variables
.code; code segment is all the code part
main proc; main procedure LIKE main func in cpp  Entery point of code segment 
    
    main endp; to end main procedure
end main; like return 0 in cpp