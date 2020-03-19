using DataFrames
using Plots
using Statistics

function naive_multiplication(A,B)
    C=zeros(Float64,size(A,1),size(B,2))
      for i=1:size(A,1)
        for j=1:size(B,2)
            for k=1:size(A,2)
                C[i,j]=C[i,j]+A[i,k]*B[k,j]
            end
        end
    end
end

function better_multiplication(A,B)
    C=zeros(Float64,size(A,1),size(B,2))
      for j=1:size(B,2)
        for k=1:size(A,2)
            for i=1:size(A,1)
                C[i,j]=C[i,j]+A[i,k]*B[k,j]
            end
        end
    end
end

function gen_table(S, V)
    max = V*9 + S
    df = DataFrame(Size = [], Time_Naive = [], Time_Better = [], Time_BLAS = [])
    while S <= max
        for i=1:10
            A = rand(S, S)
            B = rand(S, S)
            time1 = @elapsed naive_multiplication(A,B)
            time2 = @elapsed better_multiplication(A,B)
            time3 = @elapsed A*B
            push!(df, (S, time1, time2, time3))
        end
        S += V
    end
    return df
end

df = gen_table(100, 100)

df_naive = by(df, [:Size], Time_avg = :Time_Naive => mean, Time_std = :Time_Naive => std)
df_better = by(df, [:Size], Time_avg = :Time_Better => mean, Time_std = :Time_Better => std)
df_BLAS = by(df, [:Size], Time_avg = :Time_BLAS => mean, Time_std = :Time_BLAS => std)

plot(df_naive[:Size], 
    df_naive[:Time_avg],
    yerr=df_naive[:Time_std],
    colour = [:red], 
    xlabel = "Size", 
    ylabel = "Time [s]", 
    label = "Naive",
    legend=:topleft)
plot!(df_better[:Size], 
    df_better[:Time_avg],
    yerr=df_better[:Time_std],
    colour = [:blue], 
    xlabel = "Size", 
    ylabel = "Time [s]", 
    label = "Better",
    legend=:topleft)
plot!(df_BLAS[:Size], 
    df_BLAS[:Time_avg],
    yerr=df_BLAS[:Time_std],
    colour = [:green], 
    xlabel = "Size", 
    ylabel = "Time [s]", 
    label = "BLAS",
    legend=:topleft)
