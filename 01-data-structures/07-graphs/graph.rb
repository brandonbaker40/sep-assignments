class Graph
  attr_accessor :nodes
  attr_accessor :films

  def initialize
    @nodes = [ ]
    @films = [ ]
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  def add_film(from, to, title)
    films << Film.new(from, to, title)
  end
end
