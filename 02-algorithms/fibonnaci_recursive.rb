require 'benchmark'


def fib_recursive(n)
  if (n == 0)
    # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
    # #3
    return fib_recursive(n-1) + fib_recursive(n-2)
  end
end


def fib_iterative(n)

  fib_0 = 0
  fib_1 = 1

  n.times do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end

  return fib_0

end

Benchmark.bm(7) do |x|

  # iterative fibonacci
  x.report("Iterative: ") { fib_iterative(20) }

  # recursive fibonacci
  x.report("Recursive: ") { fib_recursive(20) }

end
