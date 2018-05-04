require_relative 'node'

class OpenAddressing
  def initialize(size)
    @nodes = Array.new(size)
  end

  def []=(key, value)
    node_index = index(key, size) # assign the hashed value to node_index, i.e. 3
    if @nodes[node_index] # if there is a node already at this index (collision)
      node_index = next_open_index(node_index) # reassign node_index to the next availble bucket using next_open_index
      if node_index == -1
        resize
        node_index = next_open_index(index(key, size))
      end
    end
    @nodes[node_index] = Node.new(key, value)
  end

  def [](key)
    if key
      node_index = index(key, size)
      while @nodes[node_index].key != key
        node_index += 1
      end
      @nodes[node_index].value
    else
      puts "No key found!"
      return
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size # hash the key
  end

  # Given an index, find the next open index in @nodes
  def next_open_index(index) # takes an argument, i.e. 3
    (index...@nodes.length).each do |x| # starts at the index (3) and loops to the number of nodes in the chain
      if @nodes[x] == nil # for each bucket, check if it's a nil value, meaniing it's open to be filled
        return x # if it is open, return x which is the NEW index
      end
    end

    # if it wasn't able to do it, then resize the hash and do something else

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
