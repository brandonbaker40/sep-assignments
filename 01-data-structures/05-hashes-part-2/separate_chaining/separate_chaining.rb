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
    some_index = index(key, size)
    if @items[some_index] # if there is a linked list at this index
      current_node = @items[some_index].head # assign the head of the linked list to current_node
      while current_node.key != key # while the key of the current_node doesn't match the argument key
        current_node = current_node.next # go to the next node and look for it there
      end # break the loop after you can't call next on current_node
        return current_node.value # return the value of the current_node once you find a match
    else # if there is no linked list at that index, then we have nothing to search
      return "There's nothing here!!!"
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
      key.to_s.sum % size # perform the ruby sum function on key and modulo the result by the number of items in the array
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size.to_f # number of total items divded by the number of buckets
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length # calculate the length of the array of items
  end

  def resize
    new_array = Array.new(@items.length * 2)
    @items.each do |linked_list| # each item in the @items array is a linked_list
      if linked_list # if the linked_list exists at that index
        current_node = linked_list.head # get the head from the list
        re_index = index(current_node.key, new_array.length) # perform re_index function on it, which is just the index function modified for the new length
        while current_node # execute loop for every head node in the array
          linked_list = LinkedList.new # make a new Linked List
          linked_list.add_to_front(current_node)
          new_array[re_index] = linked_list # perform re_index method on hashes inside of the linked_list
          current_node = current_node.next # reassign head to the next node
        end
      end
    end
    @items = new_array
  end
end
