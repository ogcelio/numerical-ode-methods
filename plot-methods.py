from numpy import arange, exp
import json

import matplotlib.pyplot as plt

path_data = "data-methods.json"

with open(path_data, "r", encoding="utf8") as file:
    data: dict = json.load(file)


def plot_methods():
    x = arange(0, 5, 0.001)
    y = (200 + 26800 * exp(-2.7 * x)) / 27
    for method_name, method in data.items():
        for step_size, step in method.items():
            fig, ax = plt.subplots(figsize=(10, 5))
            ax.plot(x, y, label="Analítica", color="red", zorder=2)
            plt.grid(True)
            plt.tight_layout()
            plt.xlabel("Tempo (s)")
            plt.ylabel("N (Núcleos)")
            N = step["N"]
            t = step["t"]
            ax.plot(t, N, label=f"{method_name}: h = {step_size}", zorder=0)
            ax.scatter(t, N, s=20)

            plt.legend(loc="best")
            plt.savefig(
                f"pdf_images/fig_{method_name}_{step_size}.pdf", bbox_inches="tight"
            )


if __name__ == "__main__":
    plot_methods()
