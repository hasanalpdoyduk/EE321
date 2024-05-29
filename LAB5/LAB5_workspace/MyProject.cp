#line 1 "C:/Users/DOYDUK/Desktop/labb5/MyProject.c"
unsigned char number1 = 0;
unsigned char number2 = 0;
unsigned char state = 0;
unsigned char buttonP = 0;

void display(unsigned char,unsigned char,unsigned char);
void increment();

void main() {
 PCON.OSCF = 0;
 TRISA = 0x60;
 TRISB = 0x00;
 PORTA = 0x00;
 PORTB = 0x00;


 T1CON.T1CKPS1 = 1;
 T1CON.T1CKPS0 = 1;
#line 26 "C:/Users/DOYDUK/Desktop/labb5/MyProject.c"
 T1CON.TMR1CS = 0;
 TMR1H = 0xC2;
 TMR1L = 0xF7;
 T1CON.TMR1ON = 1;

 INTCON.GIE = 1;
 PIE1.TMR1IE = 1;
 INTCON.PEIE = 1;

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



 TMR1H = 0xC2;
 TMR1L = 0xF7;
 PIR1.TMR1IF = 0;
}
