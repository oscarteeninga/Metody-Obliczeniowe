using DataFrames
using CSV
using Plots
using Statistics
using Polynomials

normal = "times_normal.csv"
df_n = CSV.read(normal)
df_n_N = by(df_n, [:Size], Time_avg = :Naive => mean, Time_dev = :Naive => std)
df_n_Be = by(df_n, [:Size], Time_avg = :Better => mean, Time_dev = :Better => std)
df_n_Bl = by(df_n, [:Size], Time_avg = :BLAS => mean, Time_dev = :BLAS => std)

plot(df_n_N[:Size], 
    df_n_N[:Time_avg], 
    colour = [:blue], 
    yerr=df_n_N[:Time_dev], 
    title = "NORMAL", 
    label = "Naive",
    legend = :topleft,
    xlabel = "Size", ylabel = "Time [s]")

plot!(df_n_Be[:Size], 
    df_n_Be[:Time_avg], 
    colour = [:red], 
    yerr=df_n_Be[:Time_dev], 
    label = "Better")

plot!(df_n_Bl[:Size], 
    df_n_Bl[:Time_avg], 
    colour = [:green], 
    yerr=df_n_Bl[:Time_dev],
    label = "BLAS")

xs = 100:50:500;
fit_n = polyfit(xs, df_n_N[:Time_avg], 3)
fit_be = polyfit(xs, df_n_Be[:Time_avg], 3) 
fit_bl = polyfit(xs, df_n_Bl[:Time_avg], 3)

plot!(xs, polyval(fit_n,xs),
    colour = [:darkblue],
    label = "A_Native")
    
plot!(xs, polyval(fit_be,xs),
    colour = [:darkred],
    label = "A_Better")

plot!(xs, polyval(fit_bl,xs),
    colour = [:darkgreen],
    label = "A_BLAS")