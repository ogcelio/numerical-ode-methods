module ode_euler_method

export method
    function method(ode_func::Function, h::Float64, num_pts::Int, y::Array)
        t = h
        for i in 1:(num_pts-1)
            y[i+1] = y[i] + h * ode_func(t, y[i])
            t += h
        end
    end
end