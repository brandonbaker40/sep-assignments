class Galaxy
  attr_accessor :planets

  def initialize
    @planets = [ ]
  end

  def add_planet(planet)
    planets << planet
  end
end
