require_relative 'node.rb'
require_relative 'film.rb'
require_relative "priority_queue"

class Kevin_Bacon
  def initialize(graph, kevin_bacon)
    @graph = graph
    @kevin_bacon = kevin_bacon
    @path = { }
    @path_length = { }
    @pq = PriorityQueue.new

    find_kevin_bacon
  end

  def find_shortest_path(node)
    path = [ ]
    while node != @kevin_bacon
      path.unshift(node)
      node = @path[node]
    end
    path.unshift(@kevin_bacon)
  end

  private
  # This method will compute the shortest path from the source node to all the
  # other nodes in the graph.
  def find_kevin_bacon
    update_distance_of_all_films_to(Float::INFINITY)

    @path_length[@kevin_bacon] = 0

    # The prioriy queue holds a node and its distance from the source node.
    @pq.insert(@kevin_bacon, 0)
    while @pq.any?
      node = @pq.remove_min
      node.appearances.each do |adj_film|
        relax(adj_film)
      end
    end
  end

  def update_distance_of_all_films_to(distance)
    @graph.nodes.each do |node|
      @path_length[node] = distance
    end
  end

  # Film relaxation basically means that we are checking if the shortest known
  # path to a given node is still valid (i.e. we didn't find an even
  # shorter path).
  def relax(film)
    return if @path_length[film.to] <= @path_length[film.from]

    @path_length[film.to] = @path_length[film.from]

    @path[film.to] = film.from

    # If the node is already in this priority queue, the only that happens is
    # that its distance is decreased.
    @pq.insert(film.to, @path_length[film.to])
  end
end
