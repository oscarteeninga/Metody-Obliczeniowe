using Plots
using Polynomials

function Poly(xs, xval, yval)
    fit=polyfit(xval,yval)
    fxs=[fit(x) for x in xs]
    return fxs
end

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xs=1:0.1:10
fxs = Poly(xs,xval, yval)
plot(xs, fxs, title="Polyfit interpolation", 
    label="Polynomial", 
    legend = :topleft, 
    xlabel = "x", ylabel = "y")
scatter!(xval, yval, label = "Nodes")

savefig("poly.pdf")