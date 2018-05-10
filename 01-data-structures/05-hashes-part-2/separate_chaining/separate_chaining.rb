require_relative 'linked_list'
require_relative 'node'


class SeparateChaining
  attr_reader :max_load_factor, :nodes, :node_count

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
    current_node = @nodes[node_index].head
      while current_node
        if current_node.key == key
          return current_node.value
        end
        current_node = current_node.next
      end
    return
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.to_s.sum % size # perform the ruby sum function on key and modulo the result by the number of items in the array
  end

  # Calculate the current load factor
  def load_factor
    @node_count / size.to_f # number of total items divded by the number of linked_lists
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.size # calculate the length of the array of items
  end

  def resize
    # make a copy of the old array
    old_nodes = @nodes
    # establish the new_size
    new_size = old_nodes.length * 2
    # makes an empty array of twice the number of buckets as the old hash
    new_hash = SeparateChaining.new(new_size)
    # compacts them first so we dont loop over empty lists
    old_nodes.compact.each do |linked_list|
      # start the current_node at the head and work down the list
      current_node = linked_list.head
      # while you have a current_node to perform on
      while current_node
        # re-insert the key, value pairs into the new hash
        new_hash[current_node.key] = current_node.value

        current_node = current_node.next
      end
    end
    @nodes = new_hash.nodes
  end

end
