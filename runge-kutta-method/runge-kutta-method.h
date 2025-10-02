#ifndef __RUNGE_KUTTA_METHOD_H__
#define __RUNGE_KUTTA_METHOD_H__

double ode_func(double t, double y);

void runge_kutta(double h, int num_pts, double* y);

#endif  // __RUNGE_KUTTA_METHOD_H__
