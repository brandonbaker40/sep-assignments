require 'benchmark'

puts "Version 2: Time Complexity Performance"
GC.start
before = GC.stat(:total_freed_objects)
count = GC.stat(:count)

def time_complexity_performance(*arrays)
  return *arrays.flatten.sort
end

GC.start
after = GC.stat(:total_freed_objects)
puts "Objects Freed: #{after - before}"
puts "Object Count: #{count}"
puts ""
