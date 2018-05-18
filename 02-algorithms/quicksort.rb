require 'benchmark'

# Lomuto partition scheme for quicksort
# Wikipedia https://en.wikipedia.org/wiki/Quicksort


# algorithm quicksort(A, lo, hi) is
#     if lo < hi then
#         p := partition(A, lo, hi)
#         quicksort(A, lo, p - 1 )
#         quicksort(A, p + 1, hi)
#
# algorithm partition(A, lo, hi) is
#     pivot := A[hi]
#     i := lo - 1
#     for j := lo to hi - 1 do
#         if A[j] < pivot then
#             i := i + 1
#             swap A[i] with A[j]
#     swap A[i + 1] with A[hi]
#     return i + 1

def quicksort(collection, min, max)
   if min < max
     # k is the result of a recusive call on quicksort that takes the collection and two indices,
     # splitting the collection in two and sorting
     # until the min equals or is greater than the max
      k = partition(collection, min, max)
      quicksort(collection, min, k - 1)
      quicksort(collection, k + 1, max)
   end
   return collection
end

def partition(collection, min, max)
  # assign a random number to pivot
   pivot_index = rand(min..max)

   # swap the value in the last position in the collection with the value at the pivot_index
   collection[max], collection[pivot_index] = collection[pivot_index], collection[max]

   # assign the value at the last position in the collection to the pivot_value
   pivot_value = collection[max]

   # assign 1 less than the minimum index to variable i
   i = min - 1
   # loop through the collection from the min index to 1 less than the max index and iterate over item x
   min.upto(max-1) { |x|
      # if the value being loop over is less than the pivot_value
      if collection[x] < pivot_value
        # increase variable i by 1
         i += 1
         # swap the values so that the value being looped over is closer to the right position
          collection[i], collection[x] = collection[x], collection[i]
      end
   }

   collection[i + 1], collection[max] = collection[max], collection[i + 1]
   return i + 1
end


puts quicksort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28],0,12)

Benchmark.bm(7) do |x|

  # quicksort
  x.report("Quicksort: ") { quicksort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28],0,12) }

end

puts ""
