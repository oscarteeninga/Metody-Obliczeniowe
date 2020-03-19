using Interpolations
using Plots

include("polynomials.jl")

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xs = 1:0.1:10

linear = LinearInterpolation(xval, yval)
quad = interpolate(yval, BSpline(Quadratic(Line(OnCell()))))
r_lin = [linear(x) for x in xs]
r_cub_ext = [quad(x) for x in xs]
r_poly = Poly(xs, xval, yval)
plot(xs, r_lin,    
    xlabel = "x", 
    ylabel = "y", 
    label = "Linear",
    title = "Linear interpolation",
    legend=:topleft)
plot!(xs, r_cub_ext, label = "Quad spline")
plot!(xs, r_poly, label = "Polyfit")
scatter!(xval, yval, label = "Nodes")

savefig("linear.pdf")