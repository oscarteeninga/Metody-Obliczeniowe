using Roots  
using Plots
using ForwardDiff

f1(x) = x^2
f2(x) = 2x^2 - 3*x - 2

D(f) = x->ForwardDiff.derivative(f, float(x))

println("==========f1==========")
#1 = find_zero(f1, (-1, 1), verbose=true)
#Metoda bisekcji nie działa, gdyz x^2 nie spełnia na przedziale (-1, 1), f(a)*f(b) < 0
println("==========f2==========")
x2 = find_zero((f2, D(f2)), 5, Roots.Newton(), verbose=true)
#Przes kształt funkcji nie mozliwe jest znalezienie za pomoca pochodnej miejsca zerowego
println("==========f3==========")
x3 = find_zero(f2, 5, Order1(), verbose=true)
#To samo co wyzej

