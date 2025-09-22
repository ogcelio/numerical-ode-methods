import json
from platform import system

import matplotlib.pyplot as plt

if system() == "Windows":
    path_euler = "euler-method\\euler-data.json"
    path_runge4 = "runge-kutta-method\\runge-kutta-data.json"
else:
    path_euler = "euler-method/euler-data.json"
    path_runge4 = "runge-kutta-method/runge-kutta-data.json"


def plot_euler():
    with open(path_euler, "r", encoding="utf8") as file:
        data_euler = json.load(file)

    y = data_euler["y"]
    t = [data_euler["h"] * i for i in range(len(y))]

    plt.plot(t, y)
