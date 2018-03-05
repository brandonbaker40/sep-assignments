require_relative 'node.rb'
require_relative 'film.rb'

class KevinBacon

  def find_kevin_bacon(node)
    @path = [ ]

    return "This is Kevin Bacon." if node.name == "Kevin Bacon"

    # call the film actor hash method on each actor
    node.film_actor_hash.each do |film, actors|
      actors.each do |actor|
        # if Kevin Bacon is in the movie, add the film to the array because we've got one degree of separation now
        if actor.name == "Kevin Bacon"
          @path << film
          # remove any duplicate films in the hash
          return @path.uniq
        else
          @path << film
          find_kevin_bacon(actor)
        end
        puts @path.uniq
        @path.uniq
      end

      if @path.length > 5
        return "#{node.name} fails six degrees of separation."
      else
        return @path.uniq
      end
    end
  end
end
