#include <stdlib.h>

#include <stdio.h>

extern long int cfgTest2(long int *vars);

long int vars[11];
int main (int argc, char ** argv)

{
    if (argc != 12) {
        printf("Usage: cfgTest2[a, b, c, d, f, k, loop1, loop2, loop3, p, q]\n");
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
    vars[8] = atoi(argv[ 9]);
    vars[9] = atoi(argv[ 10]);
    vars[10] = atoi(argv[ 11]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("d is %ld\n",vars[3]);
    printf("f is %ld\n",vars[4]);
    printf("k is %ld\n",vars[5]);
    printf("loop1 is %ld\n",vars[6]);
    printf("loop2 is %ld\n",vars[7]);
    printf("loop3 is %ld\n",vars[8]);
    printf("p is %ld\n",vars[9]);
    printf("q is %ld\n",vars[10]);


    cfgTest2(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("d is %ld\n",vars[3]);
    printf("f is %ld\n",vars[4]);
    printf("k is %ld\n",vars[5]);
    printf("loop1 is %ld\n",vars[6]);
    printf("loop2 is %ld\n",vars[7]);
    printf("loop3 is %ld\n",vars[8]);
    printf("p is %ld\n",vars[9]);
    printf("q is %ld\n",vars[10]);
}
