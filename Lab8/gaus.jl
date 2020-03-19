using QuadGK
using Polynomials
using Plots

function polyLegendre(n)
    if n == 0 
        return Poly([1])
    elseif n == 1
        return Poly([0, 1])
    end
    a = (2*n-1)/n
    b = (1-n)/n
    pa = Poly([0, a])*polyLegendre(n-1)
    pb = b*polyLegendre(n-2)
    return pa + pb
end

x = -1:1/1000:1
fx0 = polyval(polyLegendre(0), x)
fx1 = polyval(polyLegendre(1), x)
fx2 = polyval(polyLegendre(2), x)
fx3 = polyval(polyLegendre(3), x)
fx4 = polyval(polyLegendre(4), x)
fx5 = polyval(polyLegendre(5), x)

println("2 stopień:")
println(roots(polyLegendre(2)))
(xp,a)=gauss(Float64,2)
println(xp)
println("3 stopień:")
println(roots(polyLegendre(3)))
(xp,a)=gauss(Float64,3)
println(xp)
println("4 stopień:")
println(roots(polyLegendre(4)))
(xp,a)=gauss(Float64,4)
println(xp)

function GaussIntegral(f, k)
    (xp, a) = gauss(k)
    return sum(a .* f.(xp))
end

f1(x) = -4x^4 - 2x^2 + 1
f2(x) = 3x^6 + f1(x)
f3(x) = x^8 + f2(x)
f4(x) = -4*x^10 + f3(x)
f5(x) = 5*x^12 + f4(x)
f6(x) = x^14 - f5(x)

for k = 3:8
    println("=======================================")
    println("Dla k = ",k)
    println("Dla f1:")
    println(GaussIntegral(f1, k) - quadgk(f1, -1, 1, rtol=1e-10)[1])
    println("Dla f2:")
    println(GaussIntegral(f2, k) - quadgk(f2, -1, 1, rtol=1e-10)[1])
    println("Dla f3:")
    println(GaussIntegral(f3, k) - quadgk(f3, -1, 1, rtol=1e-10)[1])
    println("Dla f4:")
    println(GaussIntegral(f4, k) - quadgk(f4, -1, 1, rtol=1e-10)[1])
    println("Dla f5:")
    println(GaussIntegral(f5, k) - quadgk(f5, -1, 1, rtol=1e-10)[1])
    println("Dla f6:")
    println(GaussIntegral(f6, k) - quadgk(f6, -1, 1, rtol=1e-10)[1])
end

# Dokładność to 2k-1
