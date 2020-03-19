decode32(x::Float32) = (b = bitstring(x); (b[1],b[2:9], b[10:32]))
decode64(x::Float64) = (b = bitstring(x); (b[1], b[2:12], b[13:64]))
println(decode32(Float32(1/3)))
println(decode64(Float64(1/3)))
println(decode64(Float64(Float32(1/3))))
#Konkluzja: rzutując otrzymujemy mniej precyzyjny wynik
#           czego nalezało się spodziewać