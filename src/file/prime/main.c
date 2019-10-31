#include <stdlib.h>

#include <stdio.h>

extern long int prime(long int *vars);

long int vars[5];
int main (int argc, char ** argv)

{
    if (argc != 6) {
        printf("Usage: prime[count, i, k, range, result]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);
    vars[4] = atoi(argv[ 5]);


    printf("Initial state: \n");
    printf("count is %ld\n",vars[0]);
    printf("i is %ld\n",vars[1]);
    printf("k is %ld\n",vars[2]);
    printf("range is %ld\n",vars[3]);
    printf("result is %ld\n",vars[4]);


    prime(vars);

    printf("\nEnd state: \n");
    printf("count is %ld\n",vars[0]);
    printf("i is %ld\n",vars[1]);
    printf("k is %ld\n",vars[2]);
    printf("range is %ld\n",vars[3]);
    printf("result is %ld\n",vars[4]);
}
