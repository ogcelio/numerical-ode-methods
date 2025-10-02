#include "runge-kutta-method.h"

double ode_func(double t, double y) { return (-2 * y + 1); }

void runge_kutta(double h, int num_pts, double* y) {
    double k1, k2, k3, k4;
    double t = h;

    for (int i = 0; i < num_pts; i++) {
        k1 = ode_func(t, y[i]);
        k2 = ode_func(t + h / 2, y[i] + (h / 2) * k1);
        k3 = ode_func(t + h / 2, y[i] + (h / 2) * k2);
        k4 = ode_func(t + h, y[i] + h * k3);

        y[i + 1] = y[i] + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);

        t = t + h;
    }
}
