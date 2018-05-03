require_relative 'kevin_bacon.rb'
require_relative 'film'

class Node
  attr_accessor :name, :graph

  def initialize(name)
    @name = name
  end

  def appearances
    graph.films.select{|e| e.from == self}
  end

  def to_s
    @name
  end
end
