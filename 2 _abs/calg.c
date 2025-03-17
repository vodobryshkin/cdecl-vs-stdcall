#include <stdio.h>

int abs(int a) {
    int res = a;

    if (a < 0) {
        res = -res;
    }

    return res;
}


int main() {
    printf("%d\n", abs(2324));
    return 0;
}