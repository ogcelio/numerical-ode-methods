#include "euler-method.h"

void euler_method(double h, int num_pts, double *y) {
  double ode_func;
  double t = h;

  for (int i = 0; i < num_pts; i++) {
    ode_func = -2 * y[i] + 1;
    y[i + 1] = y[i] + h * ode_func;

    t = t + h;
  }
}
