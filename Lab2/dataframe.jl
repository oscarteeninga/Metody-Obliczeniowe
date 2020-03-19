# Tworzenie DataFrame
using DataFrames
using CSV
using Plots
using Statistics

input = "times.csv"
mydata = CSV.read(input)
mydata = by(mydata, [:Size, :Type], Time_avg = :Time => mean, Time_dev = :Time => std)

blas1 = filter(row -> row[:Type] == 1, mydata)
scatter(blas1[:Size], blas1[:Time_avg], colour = [:blue], yerr=blas1[:Time_dev], xlabel = "Size", ylabel = "Time [s]", title = "BLAS1");

blas2 = filter(row -> row[:Type] == 2, mydata)
scatter(blas2[:Size], blas2[:Time_avg], colour = [:red], yerr=blas2[:Time_dev], xlabel = "Size", ylabel = "Time [s]", title = "BLAS2")

plot(mydata[:Size], mydata[:Time_avg], plot_title = [:Title], group=mydata[:Type], colour = [:red :blue], yerr=mydata[:Time_dev], layout=2, xlabel = "Size", ylabel = "Time [s]", legend = :topleft)