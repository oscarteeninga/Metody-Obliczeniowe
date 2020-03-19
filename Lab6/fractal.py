from PIL import Image

x_min = -1.2
x_max = 1.2

y_min = -1.2
y_max = 1.2

epsilon = 10e-4
it = 50

colors = [\
(180, 0, 30), (0, 180, 30), (0, 30, 180), \
(0, 190, 180), (180, 0, 175)]

def f(z): return z*z*z*z*z - 1
def df(z): return 5*(z*z*z*z)

def newton_method(f, df, z):
    for i in range(it):
        znext = z - f(z)/df(z)
        if abs(znext - z) < epsilon:
            return z
        z = znext
    return None

def draw(f, df, img, size, img_name):  
    roots = []
    for y in range(size):
        z_y = y * (y_max - y_min)/(size - 1) + y_min
        for x in range(size):
            z_x = x * (x_max - x_min)/(size - 1) + x_min
            root = newton_method(f, df, complex(z_x, z_y))
            if root:
                flag = True
                for t_root in roots:
                    if abs(t_root - root) < 10*epsilon:
                        root = t_root
                        flag = False
                        break
                if flag:
                    roots.append(root)
            if root:
                img.putpixel((x, y), colors[roots.index(root)])
    img.save(img_name, "PNG")

size = 4096
img = Image.new("RGB", (size, size), (255, 255, 255))
draw(lambda z: f(z), lambda z: df(z), img, size, "newtonFr.png")
