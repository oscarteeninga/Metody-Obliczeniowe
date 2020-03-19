using Plots

tab = Float64[]
num = 1.0:1.0:1000.0
for i in num
    p = nextfloat(i)
    push!(tab, p-i)
end

plot(1:1:1000, tab)
