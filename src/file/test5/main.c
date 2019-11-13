#include <stdlib.h>

#include <stdio.h>

extern long int test5(long int *vars);

long int vars[5];
int main (int argc, char ** argv)

{
    if (argc != 6) {
        printf("Usage: test5[a, b, c, count, d]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);
    vars[4] = atoi(argv[ 5]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("count is %ld\n",vars[3]);
    printf("d is %ld\n",vars[4]);


    test5(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("count is %ld\n",vars[3]);
    printf("d is %ld\n",vars[4]);
}
