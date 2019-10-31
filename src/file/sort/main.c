#include <stdlib.h>

#include <stdio.h>

extern long int sort(long int *vars);

long int vars[4];
int main (int argc, char ** argv)

{
    if (argc != 5) {
        printf("Usage: sort[input1, input2, input3, tmp]\n");
        exit(1);
    }
    vars[0] = atoi(argv[ 1]);
    vars[1] = atoi(argv[ 2]);
    vars[2] = atoi(argv[ 3]);
    vars[3] = atoi(argv[ 4]);


    printf("Initial state: \n");
    printf("input1 is %ld\n",vars[0]);
    printf("input2 is %ld\n",vars[1]);
    printf("input3 is %ld\n",vars[2]);
    printf("tmp is %ld\n",vars[3]);


    sort(vars);

    printf("\nEnd state: \n");
    printf("input1 is %ld\n",vars[0]);
    printf("input2 is %ld\n",vars[1]);
    printf("input3 is %ld\n",vars[2]);
    printf("tmp is %ld\n",vars[3]);
}
