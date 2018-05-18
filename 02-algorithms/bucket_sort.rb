# Great resource: https://www.youtube.com/watch?v=geVyIsFpxUs
# still don't understand how you would determine how many buckets for the argument

require 'benchmark'

def bucket_sort(collection, num_buckets)
  num_elements = collection.length
  #puts "There are #{num_elements} items in the collection."
  min = collection.min
  max = collection.max
  #puts "#{min} is the smallest, while #{max} is the largest."
  divider = ((max + 1).to_f / num_buckets).ceil
  #puts "There are #{num_buckets} buckets. Each bucket is responsible for collecting a series of #{divider} values."

  #puts ""
  #puts ""
  buckets = Array.new(num_buckets)

  (0..num_buckets - 1).each do |i|
      buckets[i] = []
      #puts "Initializing Bucket ##{i + 1}..."
  end

  collection.each do |x|
    buckets[((x / divider).floor)].push(x)
  end

  collection = [ ]

  buckets.each do |k|
    collection.push(insertion_sort(k))
  end

  return collection.flatten
end

def insertion_sort(collection)
    for item in 1...(collection.length)
        j = item
        while j > 0
            if collection[j - 1] > collection[j]
                temp = collection[j]
                collection[j] = collection[j - 1]
                collection[j - 1] = temp
            else
              break
            end
            j = j - 1
        end
    end
    return collection
end

puts bucket_sort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28], 10)

Benchmark.bm(7) do |x|

  # bucket_sort
  x.report("Bucket sort: ") { bucket_sort([10, 92, 74, 76, 75, 91, 34, 54, 65, 1, 6, 19, 28], 10) }

end

puts ""
