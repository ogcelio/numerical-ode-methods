ode_func(t, y) = -2 * y + 1

function euler_method(h, num_pts, y)
    t = h
    for i in 1:num_pts
        y[i+1] = y[i] + h * ode_func(t, y[i])
        t += h
    end
end

h = 0.1

num_pts = 5
y = Array{Float64}(undef, num_pts + 1)

y[1] = 2

euler_method(h, num_pts, y)

for i in 1:(num_pts+1)
    println("y($i) = $(round(y[i], digits=5))")
end
