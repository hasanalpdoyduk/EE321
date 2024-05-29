list      p=16f628A           ; list directive to define processor
#include <p16F628A.inc>       ; processor specific variable definitions
__CONFIG _INTRC_OSC_NOCLKOUT & _WDT_OFF

num EQU 0x20
array EQU 0x21
cnt EQU 0x35

; num = 10
movlw 0xA
movwf num
; array[10]={200,2,3,5,14,15,16,114,115,200};
movlw 0xC8 ; or .200 for decimal assignment
movwf array
movlw 0x2 ; or .2 for decimal assignment
movwf array+1
movlw 0x03
movwf array+2
; fill here with array datas above
???












; cnt=0;
movlw 0
movwf cnt

ii EQU 0x36
; ii = 10
movlw 0xA
movwf ii

; Your tasks start here...
movlw array ; start point
movwf FSR

loopTop:

; if((array[ii] & 0x01) == 0)
; fill here (4 lines)
???          ; 0x01 -> w
???          ; 0x01 & array[ii], HINT:INDF
???          ; test, skip or no skip
???          ; goto loopBottom

; fill here (1 line)
???          ; cnt++

loopBottom:


; fill here (1 line)
???          ; ptr++

; fill here (2 lines)
???          ; if(--ii != 0)
???          ;  goto loopTop



; that's it ...

clrf PORTB
banksel TRISB
clrf TRISB
banksel PORTB

movf  cnt, w
movwf PORTB
; return
progEnd: goto progEnd

end


