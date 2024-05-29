unsigned char number1 = 0;
unsigned char number2 = 0;
unsigned char state = 0;
unsigned char buttonP = 0;

void display(unsigned char,unsigned char,unsigned char);
void increment();

void main() {
        PCON.OSCF = 0;
        TRISA = 0x60; //  0110 0000
        TRISB = 0x00;
        PORTA = 0x00;
        PORTB = 0x00;

        // TIMER1 Settings
        T1CON.T1CKPS1 = 1; // Set PRESCALERS
        T1CON.T1CKPS0 = 1; // Set PRESCALERS
        
        /* page 50 of the document bit 5-4 T1CKPS<1:0>: Timer1 Input Clock Prescale Select bits
        11 = 1:8 Prescale value
        10 = 1:4 Prescale value
        01 = 1:2 Prescale value
        00 = 1:1 Prescale value*/

        T1CON.TMR1CS = 0;         // TODO TIMER use internal clock // Set internal clock as the clock source for Timer1
        TMR1H = 0xC2;            // TODO TIMER1 Counter TMR1H:TMR1L  // Set the most significant byte of the timer/counter register
        TMR1L = 0xF7;            // TODO TIMER1 Counter TMR1H:TMR1L  // Set the least significant byte of the timer/counter register
        T1CON.TMR1ON = 1;           // TODO set TIMER1 on // Turn on Timer1
        // intterupts
        INTCON.GIE = 1; // TURN on global interruts enable
        PIE1.TMR1IE = 1; // TURN on timer 1 interrupt
        INTCON.PEIE = 1; // TURN on peripheral interrupt enable

        while(1) {
                if(buttonP == 0 && RA5_bit == 1){
                        state = state == 9 ? 0 : state + 1;
                }
                if(RA6_bit == 1)
                        state = 0;
                buttonP = RA5_bit;
                display(number2,number1,state);
        }
}

void increment() {
        number1 = number1 + 1;
        if(number1 == 10) {
                number1 = 0;
                number2++;
                if( number2 == 10) {
                        number2 = 0;
                }
        }
}

void display(unsigned char num1, unsigned char num2,unsigned char num3){
        PORTB = (num3<<4) + num2;
    PORTA = num1;
}

void interrupt() {
        increment();
        // TODO reset timer1 counter according to your need
        // TODO TIMER1 interrupt flag

                TMR1H = 0xC2;
                TMR1L = 0xF7;
                PIR1.TMR1IF = 0;
}