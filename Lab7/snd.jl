using WAV
using PlotlyJS
using FFTW

snd, sampFreq = wavread("sound.wav")

#Odtworzenie
println("Sound playing...")
wavplay(snd, sampFreq)
println("Sound done.")

#FFT
s = snd[:,1]
n = length(s)
p = fft(s)

#Wycięcie częstotliwości
for i = 1:length(p)
    if i < length(p)/10 || i > length(p)
        p[i] = 0+0i
    else
        p[i] = 2*p[i]
    end
end

#Odwrócone FFT
z = ifft(p)
snd[:,1] = abs.(z)

#Odtworzenie przetworzonego
println("Changed sound playing...")
wavplay(snd, sampFreq)
println("Changed sound done...")
