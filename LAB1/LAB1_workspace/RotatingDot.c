int value = 1;
int counter = 0;

void main() {
     
     PCON.OSCF = 1;
     CMCON = 0x07;

     TRISA = 0x80;
     TRISB = 0x00;
     
     while(1){
              if(RA0_bit == 1){
                         value = value*2;
                         if (value >= 128){
                                   value = 1;
                                         }
              }
              else{
                         value = value/2;
                         if (value <= 1){
                          value = 128;
                          }
              }




              PORTB = value;
              delay_ms(500);
     }
}

