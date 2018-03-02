require_relative 'kevin_bacon.rb'
require_relative 'node'

class Film
  attr_accessor :title, :cast

  def initialize(title, cast)
    @title = title
    @cast = cast
    #set_film_actor_hash
  end
end
