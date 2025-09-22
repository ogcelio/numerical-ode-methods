import json
from platform import system

import matplotlib.pyplot as plt

if system() == "Windows":
    path_euler = "euler-method\\data-euler.json"
    path_runge4 = "runge-kutta-method\\data-runge-kutta.json"
else:
    path_euler = "euler-method/data-euler.json"
    path_runge4 = "runge-kutta-method/data-runge-kutta.json"


def plot_euler():
    with open(path_euler, "r", encoding="utf8") as file:
        data_euler = json.load(file)

    y = data_euler["y"]
    t = data_euler["t"]

    plt.scatter(t, y)
    plt.show()


if __name__ == "__main__":
    plot_euler()
