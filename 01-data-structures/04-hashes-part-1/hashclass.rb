class HashClass

  def initialize(size)
    @items = Array.new(size) # this is a blank array where the hash items will be placed. It contains (size) number of spaces for hashed items to be stored.
  end

  # put the key value pair node in an array
  def []=(key, value)
    hash_item = HashItem.new(key, value) # create a new hash item from the list of items (@items)
    hash_index = key.sum % size # index(key, size) # create a hash index from the key by taking the sum of the ascii numbers and taking the modulus of the number of characters in the key

    if @items[hash_index] == nil # if there is no item assigned to that index in the keyspace, it's available for that item to be there
      @items[hash_index] = hash_item # put the hash item in the hash_index because it's available
    elsif @items[hash_index].key == key && @items[hash_index].value == value # if the key and value of a hash item at hash_index is not the key from the argument, then we have a collision
      # If a collision occurs and the value to be inserted matches the existing value, ignore the insertion.
      return "duplicate"
    else @items[hash_index].key != key
      self.resize
      self[key] = value # Syntactic sugar for `self.[]=(key, value)`
    end

  end


  def [](key) # Via syntactic sugar, becomes `hash[key] # => value`
    # lotr_movies["The Lord of the Rings: The Fellowship of the Ring"]
    @items[index(key, size)].value
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
