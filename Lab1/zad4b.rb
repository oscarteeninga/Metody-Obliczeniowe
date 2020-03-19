#x0 = 1
#x1 = 1/3
#xn = 13x(n-1)/3 - 4x(n-2)/3    dla n >= 1
#xn = (1/3)^n

x0 = 1.to_f
x1 = 1/3.to_f

#Algorytm niestabilny obliczania (1/3)^n
def rek(n)
    if n == 1
        return 1/3.to_f
    end
    if n == 0
        return 1.to_f
    end
    return 13.0*rek(n-1)/3.0 - 4.0*rek(n-2)/3.0
end

#Algorytm poprawiony
def pow(a, n) 
    if n == 1
        return a
    end
    return a*pow(a, n-1)
end

#wyniki
i = 25
puts rek(i)
puts pow(1/3.to_f, i)