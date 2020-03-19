using QuadGK

fg(x) = exp(-x^2/2)/sqrt(2*pi)
f(x) = x^2 + 2*x + 1

println(quadgk(f, -1, 1, rtol=1e-50)[1])
println(quadgk(fg, -Inf, +Inf, rtol=1e-50)[1])


