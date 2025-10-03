#include "euler-method.h"
#include <iostream>
using namespace std;

int main() {
  double h = 0.01;

  int num_pts = 5;
  double *y = new double[num_pts + 1];
  y[0] = 2;

  euler_method(h, num_pts, y);

  for (int i = 0; i <= num_pts; i++) {
    std::cout << "y(" << i << ") = " << y[i] << std::endl;
  }

  delete[] y;

  return 0;
}
