using QuadGK

function RecIntegral(f, a, b, p)
    x = a:(a+b)/p:b
    integral = 0
    for i = 1:length(x)-1
        dx = x[i+1] - x[i] 
        integral += f(x[i])*dx
    end
    return integral
end

function TrapezeIntegral(f, a, b, p)
    x = a:(a+b)/p:b
    integral = 0
    for i = 1:length(x)-1
        dx = x[i+1] - x[i] 
        integral += (f(x[i+1]) + f(x[i]))*dx/2
    end
    return integral
end

er = Array{Float64}(undef, 10)
et = Array{Float64}(undef, 10)
x = Array{Int64}(undef, 10)
f(x) = x^2

function EpsilonCheck(f, a, b)
    i = 1
    
    while i <= 10
        x[i] = 10^i
        er[i] = abs(RecIntegral(f, a, b, 10^i)-quadgk(f, a, b, rtol=1e-50)[1])
        et[i] = abs(RecIntegral(f, a, b, 10^i)-quadgk(f, a, b, rtol=1e-50)[1])
        #println("Błąd prostokątów dla rozmiaru: ", 10^i, " - ", er[i])
        #println("Błąd trapezów dla rozmiaru: ", 10^i, " - ", et[i])

        i+= 1
    end

end

EpsilonCheck(f, 1, 2)
println(er)
println(et)
println(x)


