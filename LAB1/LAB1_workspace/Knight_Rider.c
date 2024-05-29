  int counter = 0;
int direction = 0;//0 "left" , 1 right;
  
  int leds[8] = {128,64,32,16,8,4,2,1};
  void main () {

     PCON.OSCF = 1;
     CMCON = 0x07;

     TRISA = 0x80;
     TRISB = 0x00;



     while(1)
     {

             if(RA0_bit == 0)
             {
                if( direction == 0){    // to left
                         counter = counter +1 ;
                         }
                else   {
                         counter = counter -1 ;
                        }
               }
             else
             {
                      //  counter = counter -1  ;  // if switch is 0 decrement

             }

             PORTB=leds[counter];    // light the led according to counter
              delay_ms(500);
                         if (counter==7){   // counter should be between 0 - 7
                              direction = 1 ; //"right"

                          }
                          if (counter==0){
                             direction = 0 ; // "left"
                          }
     }
  }
