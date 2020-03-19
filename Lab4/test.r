#Oscar Teeninga
#MOWNiT Lab4
############################################################

#Ładowanie plik i biblioteki
file = "times_optimal.csv"
table = read.csv(file)
library("ggplot2")

#Połaczenie dwóch tabel 
result = table[,c("Size", "Naive", "Better", "BLAS")]
result

#Obliczenie średniej
table_naive = aggregate(Naive ~ Size, data = result, FUN = mean)
table_better = aggregate(Better ~ Size, data = result, FUN = mean)
table_blas = aggregate(BLAS ~ Size, data = result, FUN = mean)

#Obliczenie odchylenia standardowego
table_naive$sd = aggregate(Naive ~ Size, data = result, FUN = sd)$Naive
table_better$sd = aggregate(Better ~ Size, data = result, FUN = sd)$Better
table_blas$sd = aggregate(BLAS~ Size, data = result, FUN = sd)$BLAS

############################################################
#Wykres dla pomiarów Naive
x = table_naive[[1]]
y = table_naive[[2]]

#Aproksymacja
fun = data.frame(x,y)
fit = lm(y ~ poly(x, 2, raw=TRUE), data=fun)
new_fun = data.frame(x = seq(100, 500, length.out=500))
new_fun$y = predict(fit,new_fun)

#Rysowanie wykresu
ggplot(table_naive, aes(x = Size, y = Naive)) + 
    geom_errorbar(aes(ymin = Naive-sd, ymax = Naive+sd, width=.1), colour = "darkred") +
    geom_point(colour = "darkred") +
    geom_line(data = new_fun, aes(x,y), colour = "red") +
    ggtitle("Normal algorithm") +
    xlab("Size") +
    ylab("Time[s]")

############################################################
#Wykres dla pomiarów Better
x = table_better[[1]]
y = table_better[[2]]

#Aproksymacja
fun = data.frame(x,y)
fit = lm(y ~ poly(x, 2, raw=TRUE), data=fun)
new_fun = data.frame(x = seq(100, 500, length.out=500))
new_fun$y = predict(fit,new_fun)

#Rysowanie wykresu
ggplot(table_better, aes(x = Size, y = Better)) + 
    geom_errorbar(aes(ymin = Better-sd, ymax = Better+sd, width=.1), colour = "darkblue") +
    geom_point(colour = "darkblue") +
    geom_line(data = new_fun, aes(x,y), colour = "blue") +
    ggtitle("Better algorithm") +
    xlab("Size") +
    ylab("Time[s]")

############################################################
#Wykres dla pomiarów BLAS
x = table_blas[[1]]
y = table_blas[[2]]

#Aproksymacja
fun = data.frame(x,y)
fit = lm(y ~ poly(x, 2, raw=TRUE), data=fun)
new_fun = data.frame(x = seq(100, 500, length.out=500))
new_fun$y = predict(fit,new_fun)

#Rysowanie wykresu
ggplot(table_blas, aes(x = Size, y = BLAS)) + 
    geom_errorbar(aes(ymin = BLAS-sd, ymax = BLAS+sd, width=.1), colour = "darkgreen") +
    geom_point(colour = "darkgreen") +
    geom_line(data = new_fun, aes(x,y), colour = "green") +
    ggtitle("BLAS algorithm") +
    xlab("Size") +
    ylab("Time[s]")