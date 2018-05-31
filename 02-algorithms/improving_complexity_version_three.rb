require 'benchmark'

puts "Version 3: Space Complexity Performance"
GC.start
before = GC.stat(:total_freed_objects)
count = GC.stat(:count)

# Heap sort implementation to improve time complexity
# Heap sort borrowed from my implementation in previous checkpoint
def space_complexity_performance(*arrays)
  combined_array = *arrays.flatten

  n = combined_array.length
  sorted_array = [nil] + combined_array
  (n / 2).downto(1) do |item|
    # max heap
    sift_down(sorted_array, item, n)
  end

  while n > 1
    # swap
    sorted_array[1], sorted_array[n] = sorted_array[n], sorted_array[1]
    n -= 1
    sift_down(sorted_array, 1, n)
  end
  # drops the nil value form the new collection
  sorted_array.drop(1)
end

def sift_down(sorted_array, parent, limit)
  root = sorted_array[parent]
  while (child = 2 * parent) <= limit
    if child < limit and sorted_array[child] < sorted_array[child + 1]
      child += 1
    end

    if root >= sorted_array[child]
      break
    end

    sorted_array[parent] = sorted_array[child]
    parent = child
  end
  sorted_array[parent] = root
end

GC.start
after = GC.stat(:total_freed_objects)
puts "Objects Freed: #{after - before}"
puts "Object Count: #{count}"
puts ""
