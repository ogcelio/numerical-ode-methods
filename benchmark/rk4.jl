include("../runge-kutta-method/runge-kutta-method.jl")

import .ode_runge_kutta_method as rk4

ode_func(t, y) = -2.7 * y + 20 # funcao que define a EDO

t = collect(0:0.1:5) # criando array do dominio discreto do tempo

num_pts = length(t) # coletando numero de pontos do dominio 

N = Array{Float64}(undef, num_pts) # criando array de quantidades
N[1] = 1000 # condicao inicial

# METODO
rk4.method(ode_func, 0.1, num_pts, N)