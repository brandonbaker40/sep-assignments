class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.unshift(item)
    self.top = item
  end

  def pop
    item = @stack.shift
    self.top = @stack[0]
    return item
  end

  def empty?
    @stack.empty?
  end
end
