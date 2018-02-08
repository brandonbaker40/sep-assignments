require_relative 'linked_list'
require_relative 'node'


class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    some_index = index(key, size) # perform the index function and store it in a variable some_index
    some_item = Node.new(key, value) # create a node containing a key, value pair and store it in a variable some_item

    if @items[some_index] == nil # if the index at the some_index is empty
      @items[some_index] = LinkedList.new  # make a separate chain using a linked list
    end

    @items[some_index].add_to_front(some_item) # take some_item and add it to the front of the linked list, moving hashes in that list deeper into the list
    @item_count += 1 # increase the count of items, which is used in the load factor calculation

    if load_factor.to_f > @max_load_factor # if the load factor exceeds the max load factor
      self.resize # resize the array containing items
    end
  end

  def [](key)
    some_index = index(key, size) # perform the index function and store it in a variable some_index
    this_node = @items[some_index].head # find the head of the linked list found at some_index and assign it to this_node
    while this_node.key != key # while the key of this_node is not the key passed as an argument
      this_node = this_node.next # assign some_item to the next bucket
    end
    return this_node.value # return this once the key of the node matches the key passed as an argument
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size # perform the ruby sum function on key and modulo the result by the number of items in the array
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size.to_f # number of total items divded by the number of buckets
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length # calculate the length of the array of items
  end

  # Resize the hash
  def resize
    new_array = Array.new(@items.length * 2) # redefine the @items array to be an array with double the amount of indexes in the current_array
    @items.each do |i| # for each item in the current_array
      if i  # if i is not nil (which it will always be in the examples)
        new_hash_index = index(i.key, new_array.length) # perform the index function on i and store the result in a variable called new_hash_index
        new_array[new_hash_index] = i # assign i to a new index position in @items
      end
      @items = new_array
    end
  end
end
