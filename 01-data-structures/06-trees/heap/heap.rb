require_relative 'node'

class Heap

  attr_accessor :nodes

  def initialize
    @nodes = [nil]  # initialize an array with nil at @nodes[0]
  end

  def insert(node)
    @nodes.push(node) # push the node to the nodes array
    bubble_up(@nodes.size - 1) # call the bubble_up method on the node that was just inserted into the array
  end

  def delete_node(node) # cannot assume we are popping off max or min... must
    target_node_index = @nodes.find_index(node) # find the index of the node to be deleted
    exchange(target_node_index, -1) # exchange the position of the node to be deleted and the last node in the array
    @nodes.pop # delete the last node in the heap, which is the new @nodes[-1]
    bubble_down(target_node_index) # call the bubble_down method on the node at the index position where the node was deleted
  end

  def find(node)
    return @nodes[@nodes.find_index(node)] if @nodes.find_index(node)
  end

  def find_left_child(node)
    return nodes[(2 * @nodes.find_index(node))] if (2 * @nodes.find_index(node))
  end

  def find_right_child(node)
    return nodes[(2 * @nodes.find_index(node)) + 1] if ((2 * @nodes.find_index(node)) + 1)
  end

  def print_heap
    @nodes.each do |node|
       puts "#{node.title}: #{node.rating}" if node
    end
  end

  private

  def bubble_up(index)  # bubble_up method is called on the node that was just inserted into the array
     parent_index = (index / 2) # parent of index
     return if index <= 1 # return if the index is less than or equal to 1, which means it's the root node so it's nil
     return if @nodes[parent_index].rating <= @nodes[index].rating # if the the rating at the parent node is less than or equal to the value at the rating of the node passed in, then you don't need to call this method because the node is already in the right place
     # so this method should be called because we've ruled out the scenarios where bubble_up should not be called
     exchange(index, parent_index) # exchange the node at the index with the node at the parent index
     bubble_up(parent_index) # make a recursive call on the parent_index since it might be out of position now that it has been swapped
   end

  def bubble_down(index)
    # left_child_index = (index * 2)
    # right_child_index = (index * 2) + 1
    child_index = (index * 2) # left child of index

    return if child_index > @nodes.size - 1 # can't bubble_down on the last index

    not_the_last_element = child_index < @nodes.size - 1  # boolean check on the last element... can't bubble down on last element
    left_element = @nodes[child_index] # left child element
    right_element = @nodes[child_index + 1] # right child element
    child_index += 1 if not_the_last_element && (right_element.rating < left_element.rating) # child index will be the right index only if

    return if @nodes[child_index].rating >= @nodes[index].rating  # don't call the rest of the method if the rating at index is greater than the rating at the child index

    exchange(index, child_index) # exchange if the conditions are met
    bubble_down(child_index) # make a recursive call on the parent_index since it might be out of position now that it has been swapped
  end

  def exchange(source, target)
    @nodes[source], @nodes[target] = @nodes[target], @nodes[source] # swap positions by reasssignment instead of using a temp variable

    #temp = node
  end



 end
