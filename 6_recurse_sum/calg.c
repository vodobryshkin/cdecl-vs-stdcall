#include <stdio.h>

int sum(int a) {
    if (a == 1) {
        return 1;
    }

    int res = sum(a - 1);

    return res + a;
}


int main() {
    printf("%d\n", sum(4));
    return 0;
}