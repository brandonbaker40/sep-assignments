require 'benchmark'
require_relative './improving_complexity_version_zero.rb'
require_relative './improving_complexity_version_one.rb'
require_relative './improving_complexity_version_two.rb'
require_relative './improving_complexity_version_three.rb'

big_array = 100.times.map{ Random.rand(100) }

Benchmark.bm(7) do |x|
  x.report ("Control:                 ") { poorly_written_ruby(big_array) }
  x.report ("Code Optimization:       ") { code_optimizations(big_array) }
  x.report ("Time Complexity:         ") { time_complexity_performance(big_array) }
  x.report ("Space Complexity:        ") { space_complexity_performance(big_array) }
end



sample_size = 1000

Benchmark.bm(7) do |x|
  collection = [ ]
  puts "Control"
  sample_size.times do |y|
    collection.push(y)
    x.report ("Round #{y + 1}: ") { poorly_written_ruby(collection) }
  end
  puts ""
end

Benchmark.bm(7) do |x|
  collection = [ ]
  puts "Code Optimizations"
  sample_size.times do |y|
    collection.push(y)
    x.report ("Round #{y + 1}: ") { code_optimizations(collection) }
  end
  puts ""
end

Benchmark.bm(7) do |x|
  collection = [ ]
  puts "Time Complexity Performance"
  sample_size.times do |y|
    collection.push(y)
    x.report ("Round #{y + 1}: ") { time_complexity_performance(collection) }
  end
  puts ""
end

Benchmark.bm(7) do |x|
  collection = [ ]
  puts "Space Complexity Performance"
  sample_size.times do |y|
    collection.push(y)
    x.report ("Round #{y + 1}: ") { space_complexity_performance(collection) }
  end
  puts ""
end
