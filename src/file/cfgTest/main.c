#include <stdlib.h>

#include <stdio.h>

extern long int cfgTest(long int *vars);

long int vars[4];
int main (int argc, char ** argv)

{
    if (argc != 5) {
        printf("Usage: cfgTest[a, b, c, m]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("m is %ld\n",vars[3]);


    cfgTest(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("m is %ld\n",vars[3]);
}
