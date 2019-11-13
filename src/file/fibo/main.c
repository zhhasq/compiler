#include <stdlib.h>

#include <stdio.h>

extern long int fibo(long int *vars);

long int vars[4];
int main (int argc, char ** argv)

{
    if (argc != 5) {
        printf("Usage: fibo[a, b, sum, tmp1]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("sum is %ld\n",vars[2]);
    printf("tmp1 is %ld\n",vars[3]);


    fibo(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("sum is %ld\n",vars[2]);
    printf("tmp1 is %ld\n",vars[3]);
}
