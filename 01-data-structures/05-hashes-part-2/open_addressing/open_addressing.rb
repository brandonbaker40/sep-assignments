require_relative 'node'

class OpenAddressing
  def initialize(size)
    @nodes = Array.new(size)
  end

  def []=(key, value)
    node_index = index(key, size)
    if @nodes[node_index]
      node_index = next_open_index(index(key, size))
      if node_index == -1
        resize
        node_index = next_open_index(index(key, size))
      end
    end
    @nodes[node_index] = Node.new(key, value)
  end

  def [](key)
    node_index = index(key, size)
    while @nodes[node_index].key != key
      node_index += 1
    end
    @nodes[node_index].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @nodes
  def next_open_index(index)
    (index...@nodes.length).each do |x|
      if @nodes[x] == nil
        return x
      end
    end
    return -1
  end

  # Simple method to return the number of nodes in the hash
  def size
    @nodes.length
  end

  # Resize the hash
  def resize
    new_array = Array.new((@nodes.length * 2)) # redefine the @nodes array to be an array with double the amount of indexes in the current_array
    @nodes.each do |i| # for each item in the current_array
      if i  # if i is not nil (which it will always be in the examples)
        new_hash_index = index(i.key, new_array.length) # perform the index function on i and store the result in a variable called new_hash_index
        new_array[new_hash_index] = i # assign i to a new index position in @nodes
      end
      @nodes = new_array
    end
  end
end
