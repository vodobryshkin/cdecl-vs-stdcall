#include <stdio.h>

int abs(int a) {
    int res = a;

    if (a < 0) {
        res = -res;
    }

    return res;
}

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

int multiply(int a, int b) {
    int c = 0;
    int sign = get_divison_sign(a, b);
    int abs_a = abs(a);
    int abs_b = abs(b);

    for (int i = 0; i < abs_b; i++) {
        c = c + abs_a;
    }

    if (sign == -1) {
        c = -c;
    }

    return c;
}


int main() {
    printf("%d\n", multiply(-4, -10));
    return 0;
}