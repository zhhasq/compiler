#include <stdlib.h>

#include <stdio.h>

extern long int quadratic(long int *vars);

long int vars[16];
int main (int argc, char ** argv)

{
    if (argc != 17) {
        printf("Usage: quadratic[a, b, c, denominator, discriminant, guess, last_guess, n, numerator1, numerator2, quotient, r1, r2, remainder, roots, sqrt_discriminant]\n");
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
    vars[12] = atoi(argv[ 13]);
    vars[13] = atoi(argv[ 14]);
    vars[14] = atoi(argv[ 15]);
    vars[15] = atoi(argv[ 16]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("denominator is %ld\n",vars[3]);
    printf("discriminant is %ld\n",vars[4]);
    printf("guess is %ld\n",vars[5]);
    printf("last_guess is %ld\n",vars[6]);
    printf("n is %ld\n",vars[7]);
    printf("numerator1 is %ld\n",vars[8]);
    printf("numerator2 is %ld\n",vars[9]);
    printf("quotient is %ld\n",vars[10]);
    printf("r1 is %ld\n",vars[11]);
    printf("r2 is %ld\n",vars[12]);
    printf("remainder is %ld\n",vars[13]);
    printf("roots is %ld\n",vars[14]);
    printf("sqrt_discriminant is %ld\n",vars[15]);


    quadratic(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("b is %ld\n",vars[1]);
    printf("c is %ld\n",vars[2]);
    printf("denominator is %ld\n",vars[3]);
    printf("discriminant is %ld\n",vars[4]);
    printf("guess is %ld\n",vars[5]);
    printf("last_guess is %ld\n",vars[6]);
    printf("n is %ld\n",vars[7]);
    printf("numerator1 is %ld\n",vars[8]);
    printf("numerator2 is %ld\n",vars[9]);
    printf("quotient is %ld\n",vars[10]);
    printf("r1 is %ld\n",vars[11]);
    printf("r2 is %ld\n",vars[12]);
    printf("remainder is %ld\n",vars[13]);
    printf("roots is %ld\n",vars[14]);
    printf("sqrt_discriminant is %ld\n",vars[15]);
}
