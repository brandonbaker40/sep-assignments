require "benchmark"

def recursive_bsearch(collection, target, min, max)
  if min > max
    return false
  else
    # set the average of the min and max to the mid index
    mid = (min + max) / 2

    # if the value in the middle is the target
    if collection[mid] == target
      # found it
      return true
      # if value in the middle is less than the target
    elsif collection[mid] < target
      # move the min to 1 greater than the middle
      # call recursive_bsearch recursive call
      recursive_bsearch(collection, target, mid + 1, max)
      # if value in the middle is more than the target
    elsif collection[mid] > target
      # move the max down to 1 less than the middle
      # call recursive_bsearch recursive call
      recursive_bsearch(collection, target, min, mid -1)
      # if it's not greater than, less than, or equal to, then check the last value in the collection
    elsif collection[-1] == target
      # if the last value in the collection is the target, return true
      return true
    else # we've checked the colection
      return false
    end
  end

end


Benchmark.bm(7) do |x|

  puts "Recursive Search"
  x.report("One: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 1, 0, 5) }
  x.report("Three: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 3, 0, 5) }
  x.report("Five: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 5, 0, 5) }
  x.report("Nine: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 9, 0, 5) }
  x.report("Thirteen: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 13, 0, 5) }
  x.report("Sixteen: ") { recursive_bsearch([1, 3, 5, 9, 13, 16], 16, 0, 5) }
  puts ""

end
