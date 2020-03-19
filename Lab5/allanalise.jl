using CSV
using DataFrames
using Statistics
using Plots

df = CSV.read("times_interpolation.csv")
df_lagrange = by(df, [:Size], Time_avg = :Time_lagrange => mean, Time_std = :Time_lagrange => std)
df_newton = by(df, [:Size], Time_avg = :Time_newton => mean, Time_std = :Time_newton => std)
df_poly = by(df, [:Size], Time_avg = :Time_poly => mean, Time_std = :Time_poly => std)

plot(df_lagrange[:Size], 
    df_lagrange[:Time_avg],
    yerr=df_lagrange[:Time_std],
    colour = [:red], 
    xlabel = "Size", 
    ylabel = "Time [s]", 
    label = "Lagrange",
    title = "Interpolations speedtest",
    legend=:topleft)
plot!(df_newton[:Size], 
    df_newton[:Time_avg],
    yerr=df_newton[:Time_std],
    colour = [:orange], 
    label = "Newton")
plot!(df_poly[:Size], 
    df_poly[:Time_avg],
    yerr=df_poly[:Time_std],
    colour = [:blue], 
    label = "Polyfit")

savefig("allanalise.pdf")

