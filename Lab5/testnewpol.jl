using Plots
using Polynomials
using DataFrames
using CSV

include("newton.jl")
include("polynomials.jl")

function gen_table(S, V)
    max = 9*V + S
    df = DataFrame(Size = [], Time_lagrange = [], Time_newton = [], Time_poly = [])
    while S <= max
        xs = 1:S
        x = 1:0.001:S
        fxs = [rand() for x in xs]
        for i = 1:10
            time1 = 0
            time2 = @elapsed Newton(x, xs, fxs)
            time3 = @elapsed Poly(x, xs, fxs)
            push!(df, (S, time1, time2, time3))
        end
        S += V
    end
    return df
end

df = gen_table(100, 100)
CSV.write("times_newpol.csv", df)
print(df)