require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if (@tail == nil || @head == nil) # if tail or head are unassigned, then the linked list must be blank
      @tail = node # assign node to tail
      @head = node # assign node to head also because it is the only node in the linked list
    else # so if the linked list is not blank, point to the next position in the linked list (next) and assign the tail to the node passed in. The head will not change.
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head != @tail # if head is not equal to tail (meaning the linked list is not blank)
      temp_node = @head # create a variable called temp_node and assign it to the head
      while temp_node.next != @tail # run a while loop. As long as the node after the temp_node (temp_node.next) is not the tail....
        temp_node = temp_node.next #   ...reassign the temp_node to the node after the temp_node (temp_node.next).
      end # The loops breaks when temp_node = @tail
      @tail = temp_node # ...then assign the tail to the tempnode
    else # the list is blank and therefore there is no tail to remove
      initialize # because a linked list without nodes is blank
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = @head # assign the head to a temp_node to set up for the loop
    while temp_node != nil # run the while loop as long as the temp_node is not nil. A nil value would be one node after the last node, which doesn't exist.
      puts temp_node.data # prints the data from the node on every iteration of the loop to the console
      temp_node = temp_node.next # assign the temp_node to the node after it
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail # if the node is the tail
      remove_tail # call the remove_tail method
    elsif node == @head # if the node is the head
      remove_front # call the remove_front method
    else # node != (@head || @tail)
      temp_node = @head # assign the head to a temp_node
      while temp_node.next != node # run a while loop as longs as the node after the temp node is not the node we want to delete...
        temp_node = temp_node.next # ... move on to the next node
      end
        temp_node.next = node.next # when you find the node, assign the node after it to the node after the temp_node
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if (@tail == nil || @head == nil) # if tail or head are unassigned, then the linked list must be blank
      @tail = node # assign node to tail
      @head = node # assign node to head also because it is the only node in the linked list
    else
      node.next = @head # if the node is not the only node.... assign the current head to the next node in the list, then...
      @head = node # ... assign the argument node to the head
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head != @tail # head won't be assigned to tail as long as there is more than 1 node
      @head = @head.next # assign the node after the current head node to the head, effectively forgetting about the old head
    else # because the linked lists is without nodes
      initialize # because a linked list without nodes is blank
    end
  end
end
