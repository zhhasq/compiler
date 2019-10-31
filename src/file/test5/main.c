#include <stdlib.h>
#include <stdio.h>

extern long int test5 (long int *vars);

long int vars[3];
int main (int argc, char ** argv)
{
        int i;
        if (argc != 4) {
            printf("Usage: test3 a b c\n");
            exit(1);
        }
        vars[0] = atoi(argv[1]); //a
        vars[1] = atoi(argv[2]); //a
        vars[2] = atoi(argv[3]); //a


        printf("Initial state: \n");
        printf("a is %ld\n", vars[0]);
        printf("b is %ld\n", vars[1]);
        printf("c is %ld\n", vars[2]);


        test5(vars);

        printf("Final state: \n");
        printf("a is %ld\n", vars[0]);
        printf("b is %ld\n", vars[1]);
        printf("c is %ld\n", vars[2]);
}