require_relative 'linked_list'
require_relative 'node'


class SeparateChaining
  attr_reader :max_load_factor, :nodes

  def initialize(size)
    @max_load_factor = 0.7
    @nodes = Array.new(size)
    @node_count = 0
  end

  # DEF INSERT(key, value)
  #     COMPUTE the hash code for key, ASSIGN to index
  #     GET array[index], ASSIGN to oldHead
  #     SET array[index] to a link that contains key and value
  #     IF oldHead exists THEN
  #         SET oldHead as the second link in the chain
  #     END IF
  # END DEF

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
    if @nodes[node_index].head
      while current_node.next
        if current_node.key == key
          return current_node.value
        end
        current_node = current_node.next
      end
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
    @node_count / size.to_f # number of total items divded by the number of buckets
  end

  # Simple method to return the number of items in the hash
  def size
    @nodes.size # calculate the length of the array of items
  end

  # def resize
  #   new_size = @nodes.length * 2
  #
  #   new_array = Array.new(new_size)
  #   #new_hash = SeparateChaining.new(new_size) # this is me creating an entirely new instance, which is bad
  #   @nodes.each do |linked_list|
  #     if @nodes[linked_list]
  #         current_node = @nodes[linked_list].head
  #         until current_node == nil do
  #           new_index = current_node.key.sum % new_array.length
  #           new_array[new_index] = LinkedList.new
  #           new_array[new_index].add_to_front(current_node)
  #           current_node = current_node.next
  #         end
  #         @nodes[linked_list] = nil
  #       end
  #     end
  #   end

  def resize
      old_nodes = @nodes
      new_size = old_nodes.size * 2
      @nodes = Array.new(new_size)

      old_nodes.each do |bucket| # for each item in the old nodes, we need to transfer to the new @nodes
        if bucket #!= nil
          current_node = bucket.head
          while current_node #!= nil
            self.[]=(current_node.key, current_node.value)
            current_node = current_node.next
          end
        end
      end
    end

end
