function ode_func(t, y)
  return (-2 * y + 1)
end

function euler_method(h, num_pts, y0)
  t = {}
  for i = 0, num_pts - 1, 1 do
    t[i + 1] = h * i
  end

  y = { y0 }
  for i = 2, num_pts, 1 do
    y[i] = y[i - 1] + h * ode_func(t[i - 1], y[i - 1])
  end

  return t, y
end

t, y = euler_method(0.1, 6, 2)

for i = 1, #t, 1 do
  print(t[i], y[i])
end
