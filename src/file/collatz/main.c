#include <stdlib.h>
#include <stdio.h>

extern long int collatz (long int *vars);

long int vars[7];
int main (int argc, char ** argv)
{
        int i;
        if (argc != 7) {
            printf("Usage: collatz input n output quot rem  steps \n");
            exit(1);
        }
        vars[0] = atoi(argv[1]);
        vars[1] = atoi(argv[2]);
        vars[2] = atoi(argv[3]);
        vars[3] = atoi(argv[4]);
        vars[4] = atoi(argv[5]);
        vars[5] = atoi(argv[6]);
        printf("Initial state: \n");
        printf("input is %ld\n", vars[0]);
        printf("n is %ld\n", vars[1]);
        printf("output is %ld\n", vars[2]);
        printf("quot is %ld\n", vars[3]);
        printf("rem is %ld\n", vars[4]);
        printf("steps is %ld\n", vars[5]);


        collatz(vars);
        printf("\n");
        printf("Final state: \n");

        printf("input is %ld\n", vars[0]);
        printf("n is %ld\n", vars[1]);
        printf("output is %ld\n", vars[2]);
        printf("quot is %ld\n", vars[3]);
        printf("rem is %ld\n", vars[4]);
        printf("steps is %ld\n", vars[5]);

}