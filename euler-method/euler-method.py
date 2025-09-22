from json import dump


def euler_method(h: float, num_pts: int, y0: float):
    t = [(h * i) for i in range(num_pts)]

    y = [y0] + [0 for i in range(num_pts - 1)]

    for i in range(1, num_pts):
        ode_func = -2 * y[i - 1] + 1
        y[i] = (y[i - 1] + h * ode_func).__round__(5)

    return t, y


if __name__ == "__main__":
    h = 0.01

    num_pts = 6

    y0 = 2

    t, y = euler_method(h, num_pts, y0)

    with open("data-euler.json", "w+", encoding="utf8") as file:
        data = {"y": y, "t": t}
        dump(data, file, indent=2)
