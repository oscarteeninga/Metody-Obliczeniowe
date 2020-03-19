#import Pkg
#Pkg.add("Roots")
#Pkg.add("ForwardDiff")

using Roots  
using Plots
using ForwardDiff

f1(x) = sin(x) - x/2
f2(x) = 2*x - exp(-x)
f3(x) = x * exp(-x)
f4(x) = cos(x) - x
f5(x) = (x +3)*(x-1)^2
f6(x) = x^3

println("==========f1==========")
x1 = find_zero(f1, (-10, 10), verbose=true)
println("==========f2==========")
x2 = find_zero(f2, (-10, 10), verbose=true)
println("==========f3==========")
x3 = find_zero(f3, (-10, 10), verbose=true)
println("==========f4==========")
x4 = find_zero(f4, (-10, 10), verbose=true)
println("==========f5==========")
x5 = find_zero(f5, (-10, 10), verbose=true)
println("==========f6==========")
x6 = find_zero(f6, (-10, 10), verbose=true)

println(f1(prevfloat(x1)) * f1(x1) <= 0.0 || f1(x1) * f1(nextfloat(x1)) <= 0.0 &&
f2(prevfloat(x2)) * f2(x2) <= 0.0 || f2(x2) * f2(nextfloat(x2)) <= 0.0 &&
f3(prevfloat(x3)) * f3(x3) <= 0.0 || f3(x3) * f3(nextfloat(x3)) <= 0.0 &&
f4(prevfloat(x4)) * f4(x4) <= 0.0 || f4(x4) * f4(nextfloat(x4)) <= 0.0 &&
f5(prevfloat(x5)) * f5(x5) <= 0.0 || f5(x5) * f5(nextfloat(x5)) <= 0.0 &&
f6(prevfloat(x6)) * f6(x6) <= 0.0 || f6(x6) * f6(nextfloat(x6)) <= 0.0)


