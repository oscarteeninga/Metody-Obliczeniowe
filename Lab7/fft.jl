using FFTW
using Plots

#Inicjalizacja
Fs = 1024
t = 0:1/(Fs-1):1
x1 = sin.(2*pi*t*200) + 2* sin.(2*pi*t*400)
sticks((abs.(fft(x1))))

#Dodawanie szumu
x2 = cos.(2*pi*t*200)
for i = 1:length(x2)
    x2[i] += x2[i]*rand(-10:10)/100
end
plot(t, x2)

#FFT
y = fft(x2)
sticks((abs.(y)))

#Usuwanie szumu
for i = 1:length(y)
    if (real(y[i]) < 50) 
        y[i] = 0
    end
end
sticks((abs.(y)))

#Odwrócenie sygnału
z = ifft(y)
plot(t, real(z))