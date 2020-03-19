using Plots

function Lagrange(x, xval, yval)
    if (length(xval) != length(yval))
        return Nothing
    end
    size = length(xval)
    range = length(x)
    result = zeros(range)
    for k = 1:range
        value = 0
        for i = 1:size
            a = 1
            for j = 1:size
                if (j != i) 
                    a *= (x[k] - xval[j])/(xval[i] - xval[j])
                end
            end
            value += a*yval[i]
        end
        result[k] = value
    end
    return result
end

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xs=1:0.1:10
fxs = Lagrange(xs,xval, yval)
plot(xs, fxs, title="Lagrange interpolation", 
    label="Polynomial", 
    legend = :topleft, 
    xlabel = "x", ylabel = "y")
scatter!(xval, yval, label="Nodes")

savefig("lagrange.pdf")


