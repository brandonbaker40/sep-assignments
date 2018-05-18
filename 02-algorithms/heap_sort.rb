require 'benchmark'
# PSEUDOCODE

# function heapSort(new_collection, count) {
#     var int start := count ÷ 2 - 1,
#           end := count - 1
#
#     while start ≥ 0
#         sift(new_collection, start, count)
#         start := start - 1
#
#     while end > 0
#         swap(new_collection[end], new_collection[0])
#         sift(new_collection, 0, end)
#         end := end - 1
# }
#
# function sift(new_collection, start, count) {
#     var int root := start, child
#
#     while root * 2 + 1 < count {
#         child := root * 2 + 1
#         if child < count - 1 and new_collection[child] < new_collection[child + 1]
#             child := child + 1
#         if new_collection[root] < new_collection[child]
#             swap(new_collection[root], new_collection[child])
#             root := child
#         else
#             return
#     }
# }

def heap_sort(collection)
  n = collection.length
  new_collection = [nil] + collection
  (n / 2).downto(1) do |item|
    # max heap
    sift_down(new_collection, item, n)
  end

  while n > 1
    # swap
    new_collection[1], new_collection[n] = new_collection[n], new_collection[1]
    n -= 1
    sift_down(new_collection, 1, n)
  end
  # drops the nil value form the new collection
  new_collection.drop(1)
end

# parent indicates where to start sifting
# limit tells how far down the heap to sift
def sift_down(new_collection, parent, limit)
  root = new_collection[parent]
  while (child = 2 * parent) <= limit
    if child < limit and new_collection[child] < new_collection[child + 1]
      child += 1
    end

    if root >= new_collection[child]
      break
    end

    new_collection[parent] = new_collection[child]
    parent = child
  end
  new_collection[parent] = root
end

puts heap_sort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28])

Benchmark.bm(7) do |x|

  # heap sort
  x.report("Heap sort: ") { heap_sort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28]) }

end

puts ""
