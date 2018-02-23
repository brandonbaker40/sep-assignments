require_relative 'linked_list'
require_relative 'node'


class SeparateChaining
  attr_reader :max_load_factor, :nodes

  def initialize(size)
    @max_load_factor = 0.7
    @nodes = Array.new(size)
    @node_count = 0
  end

  def []=(key, value)
    node_index = index(key, size) # perform the index function and store it in a variable node_index
    node = Node.new(key, value) # create a node containing a key, value pair and store it in a variable node

    if @nodes[node_index] == nil # if the index at the node_index is empty
      @nodes[node_index] = LinkedList.new  # make a separate chain using a linked list
    end

    @nodes[node_index].add_to_front(node) # take node and add it to the front of the linked list, moving hashes in that list deeper into the list
    @node_count += 1 # increase the count of items, which is used in the load factor calculation

    if load_factor.to_f > @max_load_factor # if the load factor exceeds the max load factor
      self.resize # resize the array containing items
    end
  end

  def [](key)
    node_index = index(key, size)
    if @nodes[node_index] # if there is a linked list at this index
      current_node = @nodes[node_index].head # assign the head of the linked list to current_node
      while current_node.key != key && current_node.next # while the key of the current_node doesn't match the argument key
        current_node = current_node.next # go to the next node and look for it there
      end # break the loop after you can't call next on current_node
      current_node.value # return the value of the current_node once you find a match
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
    @node_count / size.to_f # number of total items divded by the number of buckets
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.size # calculate the length of the array of items
  end

  def resize
    new_hash = SeparateChaining.new(@nodes.length * 2)
    @nodes.each do |linked_list|
      if linked_list
        current_head = linked_list.head

        while current_head do
          # new_hash.[]=(current_head.key, current_head.value)
          new_hash[current_head.key] = current_head.value
          current_head = current_head.next
        end
      end
    end
      @nodes = new_hash.nodes
    end
end
