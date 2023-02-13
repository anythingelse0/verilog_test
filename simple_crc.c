//   While (more message bits)
//      Begin
//      Shift the register left by one bit, reading the next bit of the
//         augmented message into register bit position 0.
//      If (a 1 bit popped out of the register during step 3)
//         Register = Register XOR Poly.
//      End
//   The register now contains the remainder.
// 20230210


#include <stdlib.h>
#include <limits.h>
#include <stdio.h>
#include <errno.h>

unsigned int simple_crc(unsigned int divisor ,dividend){
    unsigned int remainder;
    unsigned int MASK = 0x3fff;
    unsigned int reg = 0 ; //width 5bit
    int cnt = 14; 
    while(cnt >0){
        reg = dividend & 0x3fff ;
        cnt--;
    }


  


    return remainder;

}

int main(int argc, char *argv[])
 {
     int base;
     char *endptr, *str;
     long val;

     if (argc < 2) {
         fprintf(stderr, "Usage: %s str [base]\n", argv[0]);
         exit(EXIT_FAILURE);
     }

     str = argv[1];
     base = (argc > 2) ? atoi(argv[2]) : 0;

     errno = 0;    /* To distinguish success/failure after call */
     val = strtol(str, &endptr, base);

     /* Check for various possible errors */

     if (errno != 0) {
         perror("strtol");
         exit(EXIT_FAILURE);
     }

     if (endptr == str) {
         fprintf(stderr, "No digits were found\n");
         exit(EXIT_FAILURE);
     }

     /* If we got here, strtol() successfully parsed a number */

     printf("strtol() returned %ld\n", val);

     if (*endptr != '\0')        /* Not necessarily an error... */
         printf("Further characters after number: \"%s\"\n", endptr);

     exit(EXIT_SUCCESS);
 }

