require 'benchmark'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'heap/heap.rb'

root = Node.new("Bad Movie", 42)
tree = BinarySearchTree.new(root)

heap = Heap.new

min = 1
max = 100000
nth_item = 50000

Benchmark.bm(7) do |x|
  x.report("BST_ Insert") {
    for i in min..max do
      node = Node.new("tree", Random.rand(max))
      tree.insert(root, node)
    end
  }
   x.report("Heap Insert") {
     for i in min..max do
       node = Node.new("heap", Random.rand(max))
       heap.insert(node)
     end
   }
end

target = Node.new("Catch Me If You Can", nth_item)
tree.insert(root, target)
heap.insert(target)

Benchmark.bm(7) do |x|
  x.report("BST_ Find") do
      tree.find(root, nth_item)
  end
   x.report("Heap find") do
     heap.find(nth_item)
   end
end

Benchmark.bm(7) do |x|
  x.report("BST_ Delete") do
      tree.delete(root, nth_item)
  end
   x.report("Heap Delete") do
     heap.delete_node(nth_item)
   end
end
