require 'benchmark'
require_relative './quicksort.rb'
require_relative './heap_sort.rb'
require_relative './bucket_sort.rb'

# Using Ruby's benchmark module, measure the time it takes for all of the sorting algorithms
# discussed in this checkpoint to sort a collection of fifty items.

random_set = 50.times.map{ Random.rand(100) }

Benchmark.bm(7) do |x|

  # compare
  x.report("Quick sort: ") { quicksort(random_set, 0, 12) }
  x.report("Heap sort: ") { heap_sort(random_set) }
  x.report("Bucket sort: ") { bucket_sort(random_set, 10) }

end

# Use your output to create a bar chart.

# user     system      total        real
# Quick sort:   0.000000   0.000000   0.000000 (  0.000094)
# Heap sort:   0.000000   0.000000   0.000000 (  0.000085)
# Bucket sort:   0.000000   0.000000   0.000000 (  0.000119)

# The output of my algorithm is not consistent, making it practically irrelevant to make a bar chart.

# Looking at the bar chart, speculate on why you think some sort
# algorithms are faster than others and provide
# rationale as to your thought process.


# The speed at which a sort algorithm runs is determined in part
# by the arrangement of items in the array before the sorting happens.
# For example, if the partition you create in quicksort results in two sorted arrays,
# the need to make recursive calls on the algorithm is eliminated, therefore reducing the time it
# takes to run the algorithm. A similar phenomenon happens in heap sort, where an unsorted array
# with values in a max heap-like pattern run the sift_down method fewer times, resulting in a faster
# execution of the sort. But while arrangement of array elements is a determining factor in
# speed, it is not the sole factor.

# I further speculate that certain algorithms will run faster than others based on the amount of
# memory required for an algorithm to run. For example, sorting an array in place may yield faster
# results than an algorithm requiring the use of a temporary array in memory. The bucket sort algorithm is
# a good example. It makes use of a temporary array of buckets before placing sorted items back into the original array.
# But heap sort sorts array elements by swapping elements based on the arrangement of the max heap.
