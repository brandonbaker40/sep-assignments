# Create a version of the code above that has code optimizations.

require 'benchmark'

puts "Version 1: Code Optimization"
GC.start
before = GC.stat(:total_freed_objects)
count = GC.stat(:count)

# This method takes n arrays as input and combine them in sorted ascending  order
def code_optimizations(*arrays)

  combined_array = *arrays.flatten
  sorted_array = [combined_array[-1]]

  combined_array.each do |val|
    i = 0
    while i < sorted_array.length
      if val < sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array.push(val)
        break
      end
      i += 1
    end
  end

  sorted_array
  #puts sorted_array
end

GC.start
after = GC.stat(:total_freed_objects)
puts "Objects Freed: #{after - before}"
puts "Object Count: #{count}"
puts ""
