using Test, WrappedR

X = randn(100,5)
y = 7.0 .+ X[:,1] .+ 2.0 .* X[:,2] .* X[:,3] + 3*randn(100)

@test size(X) == (100, 5)
@test size(y) == (100,)

m  = fitsprintr(X, y)
pr = predictsprintr(m, X)

@test m[:n] == 100
@test m[:p] == 5
#@test m[:a0] #changes. setseed 
#@test m[:compact] #changes. setseed 
#@test m[:fit]
