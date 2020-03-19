using Plots

function Horner(a, xval, x, size)
    fx = a[size]
    k = size-1
    while k > 0
        fx = fx * (x - xval[k]) + a[k]
        k -= 1
    end
    return fx
end 

function Newton(x, xval, yval)
    if (length(xval) != length(yval))
        return Nothing
    end
    size = length(xval)
    range = length(x)
    result = zeros(range)
    a = zeros(size)
    r = zeros(size)
    for i = 1:size
        r[i] = yval[i]
        j = i-1
        while j > 0
            r[j] = (r[j+1]-r[j])/(xval[i]-xval[j])
            j -= 1
        end
        a[i] = r[1]
    end
    for k = 1:range
        result[k] = Horner(a, xval, x[k], size)
    end
    return result
end

xval = [1,2,3,4,5,6,7,8,9,10]
yval = [10,1,9,2,8,3,7,4,6,5]
xs=1:0.1:10
fxs = Newton(xs,xval, yval)

plot(xs, fxs, title="Newton interpolation", 
    label="Polynomial", 
    legend = :topleft, 
    xlabel = "x", ylabel = "y")
scatter!(xval, yval, label="Nodes")

savefig("newton.pdf")