class Node
  attr_accessor :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end
end
