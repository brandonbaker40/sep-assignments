
require_relative 'kevin_bacon.rb'
require_relative 'film'

class Node
  attr_accessor :name, :film_actor_hash, :visited, :path_to_bacon

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new()
    @visited = false
    @path_to_bacon = [ ]
  end
end
