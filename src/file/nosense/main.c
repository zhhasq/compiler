#include <stdlib.h>

#include <stdio.h>

extern long int nosense(long int *vars);

long int vars[12];
int main (int argc, char ** argv)

{
    if (argc != 13) {
        printf("Usage: nosense[a, b, c, count1, count2, count3, count4, d, flag, i, positive, tmp]\n");
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
    vars[11] = atoi(argv[ 12]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("count1 is %ld\n",vars[3]);
    printf("count2 is %ld\n",vars[4]);
    printf("count3 is %ld\n",vars[5]);
    printf("count4 is %ld\n",vars[6]);
    printf("d is %ld\n",vars[7]);
    printf("flag is %ld\n",vars[8]);
    printf("i is %ld\n",vars[9]);
    printf("positive is %ld\n",vars[10]);
    printf("tmp is %ld\n",vars[11]);


    nosense(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("count1 is %ld\n",vars[3]);
    printf("count2 is %ld\n",vars[4]);
    printf("count3 is %ld\n",vars[5]);
    printf("count4 is %ld\n",vars[6]);
    printf("d is %ld\n",vars[7]);
    printf("flag is %ld\n",vars[8]);
    printf("i is %ld\n",vars[9]);
    printf("positive is %ld\n",vars[10]);
    printf("tmp is %ld\n",vars[11]);
}
