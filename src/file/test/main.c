#include <stdlib.h>

#include <stdio.h>

extern long int test(long int *vars);

long int vars[3];
int main (int argc, char ** argv)

{
    if (argc != 4) {
        printf("Usage: test[count1, count3, count4]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);


    printf("Initial state: \n");
    printf("count1 is %ld\n",vars[0]);
    printf("count3 is %ld\n",vars[1]);
    printf("count4 is %ld\n",vars[2]);


    test(vars);

    printf("\nEnd state: \n");
    printf("count1 is %ld\n",vars[0]);
    printf("count3 is %ld\n",vars[1]);
    printf("count4 is %ld\n",vars[2]);
}
