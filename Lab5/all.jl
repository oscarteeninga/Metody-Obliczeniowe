using Plots
using Polynomials

include("newton.jl")
include("polynomials.jl")
include("lagrange.jl")

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xs=1:0.1:10
fxs_lagrange = Lagrange(xs,xval, yval)
fxs_newton = Newton(xs, xval, yval)
fxs_poly = Poly(xs, xval, yval)

plot(xs, fxs_lagrange, title="Interpolations", 
    label="Lagrange", 
    legend = :topleft, 
    xlabel = "x", ylabel = "y")
plot!(xs, fxs_newton, title="Interpolations", 
    label="Newton")
plot!(xs, fxs_poly, title="Interpolations", 
    label="Poly")
scatter!(xval, yval, label="Nodes")

savefig("all.pdf")
