from json import dump

ode_func = lambda t, y: -2 * y + 1


def euler_method(h: float, num_pts: int, y0: float):
    t = [(h * i) for i in range(num_pts)]

    y = [y0] + [0 for i in range(num_pts - 1)]

    for i in range(1, num_pts):
        y[i] = (y[i - 1] + h * ode_func(t[i - 1], y[i - 1])).__round__(5)

    return t, y


if __name__ == "__main__":
    h = 0.1

    num_pts = 6

    y0 = 2

    t, y = euler_method(h, num_pts, y0)

    with open("data-euler.json", "w+", encoding="utf8") as file:
        data = {"y": y, "t": t}
        dump(data, file, indent=2)
