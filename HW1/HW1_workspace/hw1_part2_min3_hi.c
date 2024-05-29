// This program finds the min of three numbers
// This file contains the high-level C version of this program
min = a;
if(a < b)
    if(a < c)
        min = a;
    else
        min = c;
else
    if(b < c)
        min = b;
    else 
        min = c;