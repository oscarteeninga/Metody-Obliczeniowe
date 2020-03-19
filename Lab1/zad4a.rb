# Ax + By = a1
# Cx + Dy = a2

#podajemy wartości a1 i a2
a1 = gets()
a1 = a1.to_f
a2 = gets()
a2 = a2.to_f

#podajemy wartości A, B, C, D (współczynników)
A = 0.50
B = 1.0
C = 1.0
d = 1.999999

#Aby polepszyć stabilność naley zmienić d (bądź dowolny inny współczynnik)

#Niestabilny (źle uwarunkowany)
W1 = A*d - B*C
Wx1 = a1*d - a2*B
Wy1 = a2*A - a1*C 

if W1 != 0
    x = Wx1/W1
    y = Wy1/W1

    puts "x = #{x}"
    puts "y = #{y}"
end


#Poprawiony
d = 1.9

W2 = A*d - B*C
Wx2 = a1*d - a2*B
Wy2 = a2*A - a1*C 

if W2 != 0
    x = Wx2/W2
    y = Wy2/W2

    puts "x = #{x}"
    puts "y = #{y}"
end

#podając odpowiednio (a1,a2) = (1, 1.999) dostajemy w przypadku:
#poprawnego: niewielką rozbieność
#niestabilnego: olbrzymią rozbieność rzędu 1e5

#Działa źle poniewaz współczynnik W1 jest bliski zera
#co przy dzieleniu przez ten współczynnik daje wysokie
#wartości x i y
