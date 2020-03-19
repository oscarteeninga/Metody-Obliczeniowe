using QuadGK
using Polynomials
using Plots

f1(x) = x^2 + x - 1

function ExtendedGaussIntegral(f, a, b, k)
    (xp, ap) = gauss(Float64, k)

    ak = (b-a)/2
    ap = ap .*ak
    xp = xp .*ak
    xp = xp .+((b+a)/2)

    return sum(ap .*f.(xp))
end

println("Extended Gauss dla f1:")
println("Ext gaus: ", ExtendedGaussIntegral(f1, -5, 5, 20))
println("QuadGK: ", quadgk(f1, -5, 5, rtol=1e-3)[1])