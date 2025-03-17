#include <stdio.h>

int multiply(int a, int b) {
    int c = 0;

    for (int i = 0; i < b; i++) {
        c = c + a;
    }

    return c;
}


int main() {
    printf("%d\n", multiply(4, 1));
    return 0;
}