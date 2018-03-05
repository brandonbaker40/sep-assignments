require_relative 'kevin_bacon.rb'
require_relative 'node'

class Film
  attr_accessor :title, :cast

  def initialize(title, cast)
    @title = title
    @cast = cast
    set_film_actor_hash
  end

  def set_film_actor_hash
    @cast.each do |actor|
      # lists costars of the cast only
      others_in_cast = @cast.reject{ |x| actor == x }
      actor.film_actor_hash[@title] = others_in_cast
    end
  end
end
