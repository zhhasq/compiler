#include <stdlib.h>

#include <stdio.h>

extern long int example33(long int *vars);

long int vars[36];
int main (int argc, char ** argv)

{
    if (argc != 37) {
        printf("Usage: example33[a, a_0_0, a_0_1, a_0_2, a_1_0, a_1_1, a_1_2, a_2_0, a_2_1, a_2_2, b, b_0_0, b_0_1, b_0_2, b_1_0, b_1_1, b_1_2, b_2_0, b_2_1, b_2_2, c, c_0_0, c_0_1, c_0_2, c_1_0, c_1_1, c_1_2, c_2_0, c_2_1, c_2_2, i, j, k, output, s, t]\n");
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
    vars[16] = atoi(argv[ 17]);
    vars[17] = atoi(argv[ 18]);
    vars[18] = atoi(argv[ 19]);
    vars[19] = atoi(argv[ 20]);
    vars[20] = atoi(argv[ 21]);
    vars[21] = atoi(argv[ 22]);
    vars[22] = atoi(argv[ 23]);
    vars[23] = atoi(argv[ 24]);
    vars[24] = atoi(argv[ 25]);
    vars[25] = atoi(argv[ 26]);
    vars[26] = atoi(argv[ 27]);
    vars[27] = atoi(argv[ 28]);
    vars[28] = atoi(argv[ 29]);
    vars[29] = atoi(argv[ 30]);
    vars[30] = atoi(argv[ 31]);
    vars[31] = atoi(argv[ 32]);
    vars[32] = atoi(argv[ 33]);
    vars[33] = atoi(argv[ 34]);
    vars[34] = atoi(argv[ 35]);
    vars[35] = atoi(argv[ 36]);


    printf("Initial state: \n");
    printf("a is %ld\n",vars[0]);
    printf("a_0_0 is %ld\n",vars[1]);
    printf("a_0_1 is %ld\n",vars[2]);
    printf("a_0_2 is %ld\n",vars[3]);
    printf("a_1_0 is %ld\n",vars[4]);
    printf("a_1_1 is %ld\n",vars[5]);
    printf("a_1_2 is %ld\n",vars[6]);
    printf("a_2_0 is %ld\n",vars[7]);
    printf("a_2_1 is %ld\n",vars[8]);
    printf("a_2_2 is %ld\n",vars[9]);
    printf("b is %ld\n",vars[10]);
    printf("b_0_0 is %ld\n",vars[11]);
    printf("b_0_1 is %ld\n",vars[12]);
    printf("b_0_2 is %ld\n",vars[13]);
    printf("b_1_0 is %ld\n",vars[14]);
    printf("b_1_1 is %ld\n",vars[15]);
    printf("b_1_2 is %ld\n",vars[16]);
    printf("b_2_0 is %ld\n",vars[17]);
    printf("b_2_1 is %ld\n",vars[18]);
    printf("b_2_2 is %ld\n",vars[19]);
    printf("c is %ld\n",vars[20]);
    printf("c_0_0 is %ld\n",vars[21]);
    printf("c_0_1 is %ld\n",vars[22]);
    printf("c_0_2 is %ld\n",vars[23]);
    printf("c_1_0 is %ld\n",vars[24]);
    printf("c_1_1 is %ld\n",vars[25]);
    printf("c_1_2 is %ld\n",vars[26]);
    printf("c_2_0 is %ld\n",vars[27]);
    printf("c_2_1 is %ld\n",vars[28]);
    printf("c_2_2 is %ld\n",vars[29]);
    printf("i is %ld\n",vars[30]);
    printf("j is %ld\n",vars[31]);
    printf("k is %ld\n",vars[32]);
    printf("output is %ld\n",vars[33]);
    printf("s is %ld\n",vars[34]);
    printf("t is %ld\n",vars[35]);


    example33(vars);

    printf("\nEnd state: \n");
    printf("a is %ld\n",vars[0]);
    printf("a_0_0 is %ld\n",vars[1]);
    printf("a_0_1 is %ld\n",vars[2]);
    printf("a_0_2 is %ld\n",vars[3]);
    printf("a_1_0 is %ld\n",vars[4]);
    printf("a_1_1 is %ld\n",vars[5]);
    printf("a_1_2 is %ld\n",vars[6]);
    printf("a_2_0 is %ld\n",vars[7]);
    printf("a_2_1 is %ld\n",vars[8]);
    printf("a_2_2 is %ld\n",vars[9]);
    printf("b is %ld\n",vars[10]);
    printf("b_0_0 is %ld\n",vars[11]);
    printf("b_0_1 is %ld\n",vars[12]);
    printf("b_0_2 is %ld\n",vars[13]);
    printf("b_1_0 is %ld\n",vars[14]);
    printf("b_1_1 is %ld\n",vars[15]);
    printf("b_1_2 is %ld\n",vars[16]);
    printf("b_2_0 is %ld\n",vars[17]);
    printf("b_2_1 is %ld\n",vars[18]);
    printf("b_2_2 is %ld\n",vars[19]);
    printf("c is %ld\n",vars[20]);
    printf("c_0_0 is %ld\n",vars[21]);
    printf("c_0_1 is %ld\n",vars[22]);
    printf("c_0_2 is %ld\n",vars[23]);
    printf("c_1_0 is %ld\n",vars[24]);
    printf("c_1_1 is %ld\n",vars[25]);
    printf("c_1_2 is %ld\n",vars[26]);
    printf("c_2_0 is %ld\n",vars[27]);
    printf("c_2_1 is %ld\n",vars[28]);
    printf("c_2_2 is %ld\n",vars[29]);
    printf("i is %ld\n",vars[30]);
    printf("j is %ld\n",vars[31]);
    printf("k is %ld\n",vars[32]);
    printf("output is %ld\n",vars[33]);
    printf("s is %ld\n",vars[34]);
    printf("t is %ld\n",vars[35]);
}
