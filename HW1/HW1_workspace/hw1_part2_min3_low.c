// It is the low-level C version of the same program
// In the low-level version, every line corresponds to an assembly instruction
min = a;
tmp = a;
tmp = tmp < b; // LT
if(tmp == 0) goto MAINIF; //BZJ
else
    tmp = a;
    tmp = tmp < c; // LT
    if(tmp == 0) goto LASTIF; // BZJ
    else  goto END;

MAINIF: min = b;
tmp = b;
tmp = tmp < c;
if(tmp == 0) goto LASTIF;
else goto END;

LASTIF: min = c;

END:
  goto END;


