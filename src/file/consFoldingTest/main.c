#include <stdlib.h>

#include <stdio.h>

extern long int consFoldingTest(long int *vars);

long int vars[8];
int main (int argc, char ** argv)

{
    if (argc != 9) {
        printf("Usage: consFoldingTest[a, b, c, d, m, n, x, y]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);
    vars[4] = atoi(argv[ 5]);
    vars[5] = atoi(argv[ 6]);
    vars[6] = atoi(argv[ 7]);
    vars[7] = atoi(argv[ 8]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("d is %ld\n",vars[3]);
    printf("m is %ld\n",vars[4]);
    printf("n is %ld\n",vars[5]);
    printf("x is %ld\n",vars[6]);
    printf("y is %ld\n",vars[7]);


    consFoldingTest(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("d is %ld\n",vars[3]);
    printf("m is %ld\n",vars[4]);
    printf("n is %ld\n",vars[5]);
    printf("x is %ld\n",vars[6]);
    printf("y is %ld\n",vars[7]);
}
