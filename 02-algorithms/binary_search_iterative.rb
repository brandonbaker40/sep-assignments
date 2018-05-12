require "benchmark"

def iterative_bsearch(collection, target)
  min = 0
  max = collection.length - 1

  while min < max
    mid = (min + max) / 2

    if collection[mid] == target
      return true
    elsif collection[mid] < target
      min = mid + 1
    elsif collection[mid] > target
      max = mid - 1
    else collection[-1] == target
      return true
    end
  end
  return false
end

Benchmark.bm(7) do |x|
  puts "Iterative Search"
  x.report("One: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 1) }
  x.report("Three: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 3) }
  x.report("Five: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 5) }
  x.report("Nine: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 9) }
  x.report("Thirteen: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 13) }
  x.report("Sixteen: ") { iterative_bsearch([1, 3, 5, 9, 13, 16], 16) }
  puts ""

end
