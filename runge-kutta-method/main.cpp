#include <iostream>

#include "runge-kutta-method.h"
using namespace std;

int main() {
    double h = 0.1;

    int num_pts = 5;
    double* y = new double[num_pts + 1];
    y[0] = 2;

    runge_kutta(h, num_pts, y);

    for (int i = 0; i <= num_pts; i++) {
        cout << "y(" << i << ") = " << y[i] << endl;
    }

    delete[] y;

    return 0;
}
