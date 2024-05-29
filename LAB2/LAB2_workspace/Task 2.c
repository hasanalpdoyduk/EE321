int ones = 0;
int tens = 0;
int hundreds = 0;
int state = 0;
int times = 1;
int i = 0;


void main() {
        PCON.OSCF = 1;
        TRISB = 0x00;
        PORTB = 0x00;
        TRISA = 0xF0;

        while(1) {
                 if(RA6_bit == 1) {
                            ones = 0;
                            tens = 0;
                            hundreds = 0;
                 }
                 else if (RA5_bit == 1) {
                      state =  1-state;
                      while(RA5_bit == 1){}



                 }

                 if(state == 1){

                      for (i = 0; i<times; i++){
                          delay_ms(10);
                      }

                      ones++;
                      if(ones == 10) {
                                ones = 0;
                                tens++;

                      }
                      if(tens == 10) {
                              tens = 0;
                              hundreds++;
                              PORTA = hundreds;

                      }
                      if(hundreds == 10) {
                                  ones = 0;
                                  tens = 0;
                                  hundreds = 0;
                                  PORTA = hundreds;
                                  times = times * 10;
                                  
                      }

                      PORTB = (ones << 4) + tens;


                 }

        }

}