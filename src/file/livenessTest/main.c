#include <stdlib.h>

#include <stdio.h>

extern long int livenessTest(long int *vars);

long int vars[3];
int main (int argc, char ** argv)

{
    if (argc != 4) {
        printf("Usage: livenessTest[a, b, c]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);


    livenessTest(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
}
