import json

import matplotlib.pyplot as plt

path_data = "data-methods.json"

with open(path_data, "r", encoding="utf8") as file:
    data: dict = json.load(file)


def plot_methods():
    for method_name, method in data.items():
        fig, ax = plt.subplots(figsize=(9, 8))
        for step_size, step in method.items():
            N = step["N"]
            t = step["t"]
            ax.plot(t, N, label=f"{method_name}: h = {step_size}")
            ax.scatter(t, N, s=20)

        plt.grid(True)
        plt.legend(loc="best")
        plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    plot_methods()
