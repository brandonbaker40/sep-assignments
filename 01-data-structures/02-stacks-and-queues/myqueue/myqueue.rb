class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def enqueue(element)
    @queue.push(element)
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def dequeue
    @queue.pop
    @head = @queue[0]
    @tail = @queue[@queue.length - 1]
  end

  def empty?
    @queue.empty?
  end
end
