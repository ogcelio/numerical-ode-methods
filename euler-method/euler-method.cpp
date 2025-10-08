#include "euler-method.h"

void euler_metod(double h, int num_pts, double* y) {
    double ode_func;
    double t = h;

    for (int i = 0; i < num_pts; i++) {
        ode_func = -2 * y[i] + 1;
        y[i + 1] = y[i] + h * ode_func;

        t = t + h;
    }
}

int main() {
    double h = 0.1;

    int num_pts = 5;
    double* y = new double[num_pts + 1];
    y[0] = 2;

    euler_metod(h, num_pts, y);

    for (int i = 0; i <= num_pts; i++) {
        std::cout << "y(" << i << ") = " << y[i] << std::endl;
    }

    delete[] y;

    return 0;
}
