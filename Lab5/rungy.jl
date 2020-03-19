using Plots
using DataFrames
using Statistics
using Plots

include("polynomials.jl")

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xval_ext = [1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10]
yval_ext = [10,5,1,5,9,5,2,5,8,5,3,5,7,5,4,5,6,5,5]
xs=1:0.1:10

fxs = Poly(xs,xval, yval)
fxs_ext = Poly(xs, xval_ext, yval_ext)

plot(xs, fxs, title="Rungy effect", 
    label="Normal", 
    legend = :bottom, 
    xlabel = "x", ylabel = "y")
plot!(xs, fxs_ext, 
    label="Extended")
scatter!(xval_ext, yval_ext, label = "Extended nodes")
scatter!(xval, yval, label = "Nodes")

savefig("rungy.pdf")