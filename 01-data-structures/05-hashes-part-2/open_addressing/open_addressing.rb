require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # COMPUTE the hash code for key, ASSIGN to index
    some_index = index(key, size)
    # WHILE a key and value exist at array[index]
    while @items[some_index].key

      # INCREMENT index by 1
      until some_index == @items.length do
        some_index += 1
      end
      # IF we've checked the entire array THEN
      if @items[-1] != nil
      # CALL RESIZE
      self.resize
      # CALL INSERT(key, value)
      self[key] = value
      # RETURN
      # END IF
      end

      # END WHILE
    end
      self[key] = value
      # SET array[index] to the new key and value
  end

  def [](key)
    @items[index(key, size)].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    (index...@items.length).each do |x|
      if @items[x] == nil
        return x
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_array = Array.new((@items.length * 2)) # redefine the @items array to be an array with double the amount of indexes in the current_array
    @items.each do |i| # for each item in the current_array
      if i  # if i is not nil (which it will always be in the examples)
        new_hash_index = index(i.key, new_array.length) # perform the index function on i and store the result in a variable called new_hash_index
        new_array[new_hash_index] = i # assign i to a new index position in @items
      end
      @items = new_array
    end
  end
end
