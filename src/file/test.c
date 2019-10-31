long int main (long int x) {
    long int k = 10 - x;
    while(k > 0) {
        k  = 2 + k;
        while (k > 4) {
            x = 1;
        }
        x = 2;
    }
    return x;
}