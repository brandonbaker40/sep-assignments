require "pp"
require_relative "graph"
require_relative "node"
require_relative "film"
require_relative "kevin_bacon"

graph = Graph.new

graph.add_node(kevin_bacon = Node.new("Kevin Bacon"))
graph.add_node(mark_wahlberg = Node.new("Mark Wahlberg"))
graph.add_node(kurt_russell = Node.new("Kurt Russell"))
graph.add_node(omar_epps = Node.new("Omar Epps"))
graph.add_node(luke_wilson = Node.new("Luke Wilson"))
graph.add_node(robert_downey = Node.new("Robert Downey, Jr."))
graph.add_node(charlie_sheen = Node.new("Charlie Sheen"))
graph.add_node(tom_hanks = Node.new("Tom Hanks"))
graph.add_node(colin_kaepernick = Node.new("Colin Kaepernick"))
graph.add_node(tom_brady = Node.new("Tom Brady"))


graph.add_film(kevin_bacon, mark_wahlberg, "Patriots Day")
graph.add_film(kevin_bacon, luke_wilson, "My Dog Skip")
graph.add_film(kevin_bacon, tom_hanks, "Apollo 13")
graph.add_film(mark_wahlberg, kurt_russell, "Deepwater Horizon")
graph.add_film(mark_wahlberg, omar_epps, "Shooter")
graph.add_film(mark_wahlberg, tom_hanks, "A Made Up Film")
graph.add_film(kurt_russell, omar_epps, "Fake Film 1")
graph.add_film(kurt_russell, charlie_sheen, "Not Real At All")
graph.add_film(omar_epps, charlie_sheen, "Major League II")
graph.add_film(luke_wilson, robert_downey, "Unfilmed Movie")
graph.add_film(luke_wilson, charlie_sheen, "Pretend Documentary")
graph.add_film(luke_wilson, tom_hanks, "Super Made Up Movie")
graph.add_film(robert_downey, kurt_russell, "Exaggerated Plot")
graph.add_film(robert_downey, charlie_sheen, "Due Date")
graph.add_film(tom_hanks, robert_downey, "Kinda Sorta Lie")
graph.add_film(tom_hanks, kurt_russell, "Definitely Not Real")
graph.add_film(robert_downey, colin_kaepernick, "Not The Superbowl")
graph.add_film(colin_kaepernick, tom_brady, "Superbowl DXVI")

# <><> Change chosen_actor variable on next line, then run ruby test.rb from the command line
chosen_actor = tom_brady
shortest_path = Kevin_Bacon.new(graph, kevin_bacon).find_shortest_path(chosen_actor)
shortest_path.each_with_index do |actor, counter|

  # Before pruning branches from searched nodes
  first_actor_appearances = actor.appearances
  next_actor_appearances = shortest_path[counter].appearances

  # After pruning branches from searched nodes
  filtered_first_actor_appearances = [ ]
  filtered_next_actor_appearances = [ ]

   first_actor_appearances.each_with_index do |x, i|
     if x.to == shortest_path[counter + 1]
       filtered_first_actor_appearances.push(x)
     end
   end

  next_actor_appearances.each_with_index do |x, i|
    if x.from == shortest_path[counter]
      filtered_next_actor_appearances.push(x)
    end
  end

  # find what they are costarring in minus the extras we removed
  costarring_in = (filtered_first_actor_appearances & filtered_next_actor_appearances)

  # if they are costarring_in any movie
  if costarring_in.any?
    puts costarring_in # output to the console here is the answer
  end
end

# REFERENCE CODE

# puts shortest_path # => ["Kevin Bacon", "Mark Wahlberg", "Kurt Russell"]
# puts shortest_path.first  # => "Kevin Bacon"
# puts shortest_path.first.appearances # => ["Patriots Day"]
# puts shortest_path.first.appearances.first # => "Patriots Day"
# puts shortest_path.first.appearances.first.to # => "Mark Wahlberg"
# puts shortest_path.first.appearances.first.from # => "Kevin Bacon"
# puts shortest_path.first.appearances.first.title # => "Patriots Day"
