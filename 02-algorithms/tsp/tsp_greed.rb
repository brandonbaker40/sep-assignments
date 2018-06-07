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

# for testing purposes
# galaxy.planets.each_index do |i|
#   puts galaxy.planets[i].name
#   puts calculate_parsecs(galaxy.planets[i], d_qar)
#   puts ""
# end

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
      shortest_route.push(current_neighbor.name)
      galaxy.planets.delete(current_neighbor)
    end
    shortest_route.push(starting_point.name)
    return shortest_route
    puts shortest_route
  end

private

# 1 parsec equals 3.26 light years
def calculate_parsecs(planet_2, planet_1)
  Math.sqrt((planet_2.x - planet_1.x)**2 + (planet_2.y - planet_1.y)**2)
end

puts nearest_possible_neighbor(galaxy, tatooine)
