module ode_runge_kutta_method
export method 
    function method(ode_func::Function, h::Float64, num_pts::Int, y::Array)
        t = h

        for i in 1:num_pts
            k1 = ode_func(t, y[i])
            k2 = ode_func(t + h / 2, y[i] + (h / 2) * k1)
            k3 = ode_func(t + h / 2, y[i] + (h / 2) * k2)
            k4 = ode_func(t + h, y[i] + h * k3)

            y[i + 1] = y[i] + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4);

            t += h
        end
    end
end