include("euler-method/euler-method.jl")
include("runge-kutta-method/runge-kutta-method.jl")

import .ode_euler_method as euler
import .ode_runge_kutta_method as rk4

ode_func(t, y) = -2.7 * y + 20 # funcao que define a EDO

data = Dict() # criando dicionario de dados

H = 5 # comprimento do dominio

# executando o metodo de euler
steps_euler = [0.5, 0.1, 0.05] # passos a serem analisados
data_euler = Dict()
for h in steps_euler
    t = collect(0:h:H) # criando array do dominio discreto do tempo

    num_pts = length(t) # coletando numero de pontos do dominio 

    N = Array{Float64}(undef, num_pts) # criando array de quantidades
    N[1] = 1000 # condicao inicial

    # METODO
    euler.method(ode_func, h, num_pts, N)
    data_euler["$h"] = Dict(
        "N" => N,
        "t" => t
    )
end
data["euler"] = data_euler

# executando o metodo de runge kutta
steps_rk4 = [1, 0.5, 0.1]
data_rk4 = Dict()
for h in steps_rk4
    t = collect(0:h:H) # criando array do dominio discreto do tempo

    num_pts = length(t) # coletando numero de pontos do dominio 

    N = Array{Float64}(undef, num_pts) # criando array de quantidades
    N[1] = 1000 # condicao inicial

    # METODO
    rk4.method(ode_func, h, num_pts, N)
    data_rk4["$h"] = Dict(
        "N" => N,
        "t" => t
    )
end
data["rk4"] = data_rk4

# salvando os dados em um arquivo
import JSON: print
open("data-methods.json", "w") do io
    print(io, data, 2)
end