
_main:

;MyProject.c,9 :: 		void main() {
;MyProject.c,10 :: 		PCON.OSCF = 0;
	BCF        PCON+0, 3
;MyProject.c,11 :: 		TRISA = 0x60; //  0110 0000
	MOVLW      96
	MOVWF      TRISA+0
;MyProject.c,12 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;MyProject.c,13 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;MyProject.c,14 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,17 :: 		T1CON.T1CKPS1 = 1; // Set PRESCALERS
	BSF        T1CON+0, 5
;MyProject.c,18 :: 		T1CON.T1CKPS0 = 1; // Set PRESCALERS
	BSF        T1CON+0, 4
;MyProject.c,26 :: 		T1CON.TMR1CS = 0;         // TODO TIMER use internal clock // Set internal clock as the clock source for Timer1
	BCF        T1CON+0, 1
;MyProject.c,27 :: 		TMR1H = 0xC2;            // TODO TIMER1 Counter TMR1H:TMR1L  // Set the most significant byte of the timer/counter register
	MOVLW      194
	MOVWF      TMR1H+0
;MyProject.c,28 :: 		TMR1L = 0xF7;            // TODO TIMER1 Counter TMR1H:TMR1L  // Set the least significant byte of the timer/counter register
	MOVLW      247
	MOVWF      TMR1L+0
;MyProject.c,29 :: 		T1CON.TMR1ON = 1;           // TODO set TIMER1 on // Turn on Timer1
	BSF        T1CON+0, 0
;MyProject.c,31 :: 		INTCON.GIE = 1; // TURN on global interruts enable
	BSF        INTCON+0, 7
;MyProject.c,32 :: 		PIE1.TMR1IE = 1; // TURN on timer 1 interrupt
	BSF        PIE1+0, 0
;MyProject.c,33 :: 		INTCON.PEIE = 1; // TURN on peripheral interrupt enable
	BSF        INTCON+0, 6
;MyProject.c,35 :: 		while(1) {
L_main0:
;MyProject.c,36 :: 		if(buttonP == 0 && RA5_bit == 1){
	MOVF       _buttonP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main4
L__main10:
;MyProject.c,37 :: 		state = state == 9 ? 0 : state + 1;
	MOVF       _state+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	CLRF       ?FLOC___mainT20+0
	CLRF       ?FLOC___mainT20+1
	GOTO       L_main6
L_main5:
	MOVF       _state+0, 0
	ADDLW      1
	MOVWF      ?FLOC___mainT20+0
	MOVLW      0
	MOVWF      ?FLOC___mainT20+1
L_main6:
	MOVF       ?FLOC___mainT20+0, 0
	MOVWF      _state+0
;MyProject.c,38 :: 		}
L_main4:
;MyProject.c,39 :: 		if(RA6_bit == 1)
	BTFSS      RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L_main7
;MyProject.c,40 :: 		state = 0;
	CLRF       _state+0
L_main7:
;MyProject.c,41 :: 		buttonP = RA5_bit;
	MOVLW      0
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	MOVLW      1
	MOVWF      _buttonP+0
;MyProject.c,42 :: 		display(number2,number1,state);
	MOVF       _number2+0, 0
	MOVWF      FARG_display+0
	MOVF       _number1+0, 0
	MOVWF      FARG_display+0
	MOVF       _state+0, 0
	MOVWF      FARG_display+0
	CALL       _display+0
;MyProject.c,43 :: 		}
	GOTO       L_main0
;MyProject.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_increment:

;MyProject.c,46 :: 		void increment() {
;MyProject.c,47 :: 		number1 = number1 + 1;
	INCF       _number1+0, 1
;MyProject.c,48 :: 		if(number1 == 10) {
	MOVF       _number1+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_increment8
;MyProject.c,49 :: 		number1 = 0;
	CLRF       _number1+0
;MyProject.c,50 :: 		number2++;
	INCF       _number2+0, 1
;MyProject.c,51 :: 		if( number2 == 10) {
	MOVF       _number2+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_increment9
;MyProject.c,52 :: 		number2 = 0;
	CLRF       _number2+0
;MyProject.c,53 :: 		}
L_increment9:
;MyProject.c,54 :: 		}
L_increment8:
;MyProject.c,55 :: 		}
L_end_increment:
	RETURN
; end of _increment

_display:

;MyProject.c,57 :: 		void display(unsigned char num1, unsigned char num2,unsigned char num3){
;MyProject.c,58 :: 		PORTB = (num3<<4) + num2;
	MOVF       FARG_display_num3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       FARG_display_num2+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,59 :: 		PORTA = num1;
	MOVF       FARG_display_num1+0, 0
	MOVWF      PORTA+0
;MyProject.c,60 :: 		}
L_end_display:
	RETURN
; end of _display

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,62 :: 		void interrupt() {
;MyProject.c,63 :: 		increment();
	CALL       _increment+0
;MyProject.c,67 :: 		TMR1H = 0xC2;
	MOVLW      194
	MOVWF      TMR1H+0
;MyProject.c,68 :: 		TMR1L = 0xF7;
	MOVLW      247
	MOVWF      TMR1L+0
;MyProject.c,69 :: 		PIR1.TMR1IF = 0;  // Clear the Timer1 interrupt flag
	BCF        PIR1+0, 0
;MyProject.c,70 :: 		}
L_end_interrupt:
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
