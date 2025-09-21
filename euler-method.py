def euler_method(h: float, num_pts: int, y: list):
    t = h

    for i in range(num_pts):
        ode_func = -2 * y[i] + 1
        yn = y[i] + h * ode_func
        y.append(yn)

        t += h


if __name__ == "__main__":
    h = 0.01

    num_pts = 5

    y = []

    y.append(2)

    euler_method(h, num_pts, y)

    for i, value in enumerate(y):
        print(f"y({i}) = {value:.5f}")
