#include <stdio.h>

int get_sign(int a) {
    int sign = 1;

    if (a < 0) {
        sign = -1;
    }

    return sign;
}


int main() {
    printf("%d\n", get_sign(-11));
    return 0;
}