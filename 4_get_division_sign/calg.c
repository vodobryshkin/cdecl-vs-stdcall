#include <stdio.h>

int get_sign(int a) {
    int sign = 1;

    if (a < 0) {
        sign = -1;
    }

    return sign;
}

int get_divison_sign(int a, int b) {
    int zn = 1;

    int a_sign = get_sign(a);
    int b_sign = get_sign(b);

    if (a_sign != b_sign) {
        zn = -1;
    }

    return zn;
}


int main() {
    printf("%d\n", get_divison_sign(0, 14));
    return 0;
}