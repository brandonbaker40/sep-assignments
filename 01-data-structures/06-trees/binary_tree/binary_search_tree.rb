require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root == nil # if the root is nil, it's the first node in the tree
      root = node # so assign the node to the root
    else
      node.rating > root.rating ? # If the rating of the node is greater than the rating of the root node, execute this below
        # If the right node is open, put the node there. If it's occupied, make a recursive call on it and travel down the right side
        (root.right.nil? ? root.right = node : self.insert(root.right, node)) : # If the rating of the node is less than or equal to the rating of the root ndoe, execute this below
        # If the left node is open, put the node there. If it's occupied, make a recursive call on it and travel down the left side
        (root.left.nil? ? root.left = node : self.insert(root.left, node))
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      return nil # return nil because the tree is empty and you won't find it here!
    else
      root.title == data ? # if the title of root matches the data node
          root :  # return the root!
            (root.left != nil ?  # if no match and the left node exists
              find(root.left, data) : # make a recursive call on root.left, travelling down the left side of the tree
                (root.right != nil ?  # if still no match and right node exists
                  find(root.right, data) :  # make a recursive call on root.right, travelling down the right side of the tree
                    nil)) # if still no match, the item is not in the tree, so return nil
    end
  end

  def delete(root, data)
    # If the root is nil or data is nil
    (root.nil? || data.nil?) ? nil : # return nil because the tree is empty and you won't find the node to delete here!
    # If there is a root in the tree and the data node is not empty, execute this code below
      (
        # call the find method on the arguments and make it the node to be deleted
        target_node = find(root, data)
        # delete the title and rating attributes which comprise the data node
        target_node.title = nil
        target_node.rating = nil
      )
  end

  # Recursive Breadth First Search
  def printf(children=nil) # =nil means the argument is optional
    if children == nil # if no argument is passed
      children = [@root] # assign the root to children
    end
    result = [] # initialize result as an empty array
    children.each do |child| # for each child in the children argument
      puts "#{child.title}: #{child.rating}" # print the title and rating for each child

      child.left ? result.push(child.left) : nil # if the child has a left node, push the child to the result array
      child.right ? result.push(child.right) : nil # if the child has a right node, push the child to the result array

    end
     result.any? ? printf(result) : nil # if the result array contains a value, print it
  end
 end
