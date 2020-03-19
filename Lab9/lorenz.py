# RK 2 rzędu
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import tkinter as tk
import time



def x_lorenz(x, y, z):
    return A*(y-x)

def y_lorenz(x, y, z):
    return R*x - y - x*z

def z_lorenz(x, y, z):
    return x*y - B*z

def plot_lorenz():
   # Inizjalizacja tablic wartości (z punktem startowym)
    xs = np.empty((STEP + 1,))
    ys = np.empty((STEP + 1,))
    zs = np.empty((STEP + 1,))

    # Wyswietlenie parametrów
    print("Parametry: ", A, R, B, H, STEP)

    # Inicjalizacja puntu startowego
    xs[0], ys[0], zs[0] = (0.0, 1.0, 1.0)

    print("Obliczanie...")
    # Przechodzenie po czasie
    for i in range(STEP):

        # Obliczenie współrzędnej X
        x_n = x_lorenz(xs[i], ys[i], zs[i])
        x_n = x_lorenz(xs[i] + H*x_n/2, ys[i] + H/2, zs[i] + H/2)
        xs[i + 1] = xs[i] + H*x_n

        # Obliczenie współrzędnej Y
        y_n = y_lorenz(xs[i], ys[i], zs[i])
        y_n = y_lorenz(xs[i] + H/2, ys[i] + H*y_n/2, zs[i] + H/2)
        ys[i + 1] = ys[i] + H*y_n
        
        # Obliczenie współrzędnej Z
        z_n = z_lorenz(xs[i], ys[i], zs[i])
        z_n = z_lorenz(xs[i] + H/2, ys[i] + H/2, zs[i] + H*z_n/2)
        zs[i + 1] = zs[i] + H*z_n

    # Plotowanie

    print("Rysowanie...")
    fig = plt.figure()
    ax = fig.gca(projection='3d')

    ax.plot(xs, ys, zs, lw=0.5)
    ax.set_xlabel("X Axis")
    ax.set_ylabel("Y Axis")
    ax.set_zlabel("Z Axis")
    ax.set_title("Lorenz Attractor")

    plt.show()


slider = tk.Tk()

def update():
    print("Odświeanie...")
    global A, R, B, H, STEP
    A = a_s.get()
    R = r_s.get()
    B = b_s.get()
    H = h_s.get()
    STEP = step_s.get()
    plot_lorenz()

a_s = tk.Scale(slider, from_= 1, to=25, orient=tk.HORIZONTAL, label="a", resolution=0.5, length=300)
a_s.set(10)
a_s.pack()

r_s = tk.Scale(slider, from_= 1, to=200, orient=tk.HORIZONTAL, label="r", length=300)
r_s.set(28)
r_s.pack()

b_s = tk.Scale(slider, from_= 0.0, to=10, orient=tk.HORIZONTAL, label="b", resolution=0.1, length=300)
b_s.set(2.7)
b_s.pack()

h_s = tk.Scale(slider, from_= 0.001, to=0.025, orient=tk.HORIZONTAL, label="h", resolution=0.001, length=300)
h_s.set(0.01)
h_s.pack()

step_s = tk.Scale(slider, from_= 1000, to=100000, label="steps", orient=tk.HORIZONTAL, resolution=1000, length=300)
step_s.set(10000)
step_s.pack()

tk.Button(slider, text="Plot", command=update).pack()
tk.mainloop()