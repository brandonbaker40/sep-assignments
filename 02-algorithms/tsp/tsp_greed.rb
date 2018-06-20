# Access this link to see the Star Wars Galaxy map that is required to validate the work in this file.
# https://drive.google.com/file/d/1TQHnat0FyxAJ4jQsxLL08h7koLMn9_0O/view?usp=sharing

# Change the starting point in the galaxy by changing the second argument in the method on the last line of this file

# Run this with `ruby tsp_greed.rb`

require_relative 'planet'
require_relative 'galaxy'

naboo = Planet.new("Naboo", 13, 5)
dagobah = Planet.new("Dagobah", 11, 3)
geonosis = Planet.new("Geonosis", 14, 5)
coruscant = Planet.new("Coruscant", 10, 11)
yavin = Planet.new("Yavin", 13, 14)
jakku = Planet.new("Jakku", 5, 9)
tatooine = Planet.new("Tatooine", 15, 5)
d_qar = Planet.new("D'Qar", 13, 4)
kashyyk = Planet.new("Kashyyk", 14, 11)
rakata_prime = Planet.new("Rakata Prime", 3, 8)
hoth = Planet.new("Hoth", 10, 4)
endor = Planet.new("Endor", 3, 5)
dantooine = Planet.new("Dantooine", 10, 15)
felucia = Planet.new("Felucia", 14, 14)
nal_hutta = Planet.new("Nal Hutta", 14, 10)

galaxy = Galaxy.new

galaxy.add_planet(naboo)
galaxy.add_planet(dagobah)
galaxy.add_planet(geonosis)
galaxy.add_planet(coruscant)
galaxy.add_planet(yavin)
galaxy.add_planet(jakku)
galaxy.add_planet(tatooine)
galaxy.add_planet(d_qar)
galaxy.add_planet(kashyyk)
galaxy.add_planet(rakata_prime)
galaxy.add_planet(hoth)
galaxy.add_planet(endor)
galaxy.add_planet(dantooine)
galaxy.add_planet(felucia)
galaxy.add_planet(nal_hutta)

def nearest_possible_neighbor(galaxy, starting_point)
  # initialize an array with the planet you start at
  shortest_route = [starting_point.name]
  # start at the starting_point
  current_planet = starting_point
  # delete the starting_point from your galaxy because you've already visited it
  galaxy.planets.delete(starting_point)

  # while there are planets in the galaxy that are not part of the shortest_route, do this
  while galaxy.planets.any?
    # pre assign front runner to index 0
    current_neighbor = galaxy.planets[0]
    # loop through the galaxy
    galaxy.planets.each_index do |i|
        # if the distance between current_planet and i is less than the distance between current planet and the current current_neighbor, make galaxy i the front runner for
        if calculate_parsecs(galaxy.planets[i], current_planet) < calculate_parsecs(current_neighbor, current_planet)
          current_neighbor = galaxy.planets[i]
        end
      end
      puts "#{current_neighbor.name} is #{calculate_parsecs(current_neighbor, current_planet).round(2)} parsecs away from #{current_planet.name}"
      # push the current_neighbor to the shortest_route
      shortest_route.push(current_neighbor.name)
      # assign current_neighbor to current_planet before you remove it from the universe
      current_planet = current_neighbor
      # delete the current neighbor from the galaxy so that you don't loop over them anymore
      galaxy.planets.delete(current_neighbor)
    end
    # add the starting_point to the end to complete the loop
    shortest_route.push(starting_point.name)

    puts ""
    puts 'SHORTEST ROUTE:'
    return shortest_route
  end

private

# 1 parsec equals 3.26 light years
def calculate_parsecs(planet_2, planet_1)
  Math.sqrt((planet_2.x - planet_1.x)**2 + (planet_2.y - planet_1.y)**2)
end

puts nearest_possible_neighbor(galaxy, felucia)
