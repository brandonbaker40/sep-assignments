include RSpec

RSpec.describe KevinBacon, type: Class do
  let(:graph ) { KevinBacon.new }

  let(:bacon) { Node.new("Kevin Bacon") }
  let(:jonah) { Node.new("Jonah Hill") }
  let(:jim) { Node.new("John Kraskinki") }
  let(:tyrese) { Node.new("Tyrese Gibson") }
  let(:gadget) { Node.new("Matthew Broderick") }
  let(:ferrell) { Node.new("Will Ferrell") }
  let(:leo) { Node.new("Leonardo DiCaprio") }
  let(:wolverine) { Node.new("Hugh Jackman") }
  let(:shaq) { Node.new("Shaquille O'Neal") }
  let(:diesel) { Node.new("Vin Diesel") }

  before(:each) do
    bacon.film_actor_hash["Best Movie Ever"] = [diesel]


    diesel.film_actor_hash["Best Movie Ever"] = [bacon]
    diesel.film_actor_hash["Jeff Loves Tea"] = [leo]


    leo.film_actor_hash["Jeff Loves Tea"] = [diesel]
    leo.film_actor_hash["Oval Circus"] = [wolverine]
    leo.film_actor_hash["Butter Toast"] = [shaq]
    leo.film_actor_hash["Seatown UK"] = [jonah]
    leo.film_actor_hash["Taj Mahal 3"] = [gadget]

    wolverine.film_actor_hash["Oval Circus"] = [leo]
    wolverine.film_actor_hash["Bag of Chips"] = [shaq]

    shaq.film_actor_hash["Bag of Chips"] = [jonah]
    shaq.film_actor_hash["Butter Toast"] = [leo]

    jonah.film_actor_hash["Seatown UK"] = [leo]
    jonah.film_actor_hash["Banks Open"] = [ferrell]
    jonah.film_actor_hash["Zinc Deposit"] = [ferrell]

    gadget.film_actor_hash["Taj Mahal 3"] = [leo]
    gadget.film_actor_hash["Martial Arts"] = [ferrell, tyrese]

    tyrese.film_actor_hash["Martial Arts"] = [gadget, ferrell]
    tyrese.film_actor_hash["Same Team"] = [jim]

    ferrell.film_actor_hash["Martial Arts"] = [gadget, tyrese]
    ferrell.film_actor_hash["Zinc Deposit"] = [jonah]
    ferrell.film_actor_hash["Banks Open"] = [jonah]

    jim.film_actor_hash["Same Team"] = [tyrese]


      # butter_toast = Film.new("Butter Toast", [shaq, leo])
      # same_team = Film.new("Same Team", [jim, tyrese])
      # martial_arts = Film.new("Martial Arts", [ferrell, gadget, tyrese])
      # taj_mahal_3 = Film.new("Taj Mahal 3", [gadget, leo])
      # banks_open = Film.new("Banks Open", [ferrell, jonah])
      # zinc_deposit = Film.new("Zinc Deposit", [ferrell, jonah])
      # seatown_uk = Film.new("Seatown UK", [ferrell, jonah])
      # oval_circus = Film.new("Oval Circus", [leo, wolverine])
      # jeff_loves_tea = Film.new("Jeff Loves Tea", [leo, diesel])
      # best_movie_ever = Film.new("Best Movie Ever", [bacon, diesel])
      # bag_of_chips = Film.new("Bag of Chips", [shaq, wolverine])
  end

    describe "#find_kevin_bacon(node)" do

      it "should return an empty array when starting node is Kevin Bacon" do
        expect(graph.find_kevin_bacon(bacon)).to eq "This is Kevin Bacon."
      end

      it "should return an array with one film when starting node is one film away from Kevin Bacon" do
        expect(graph.find_kevin_bacon(diesel)).to eq ["Best Movie Ever"]
      end

      it "should return an array with two films when starting nodes is two films away from Kevin Bacon" do
        expect(graph.find_kevin_bacon(leo)).to eq ["Jeff Loves Tea", "Best Movie Ever"]
      end
      #
      # it "should return an array with three films when starting nodes is three films away from Kevin Bacon" do
      #   expect(graph.find_kevin_bacon(wolverine)).to eq ["Oval Circus", "Jeff Loves Tea", "Best Movie Ever"]
      # end
      #
      # it "should return an array with four films when starting nodes is four films away from Kevin Bacon" do
      #   expect(graph.find_kevin_bacon(ferrell)).to eq ["Martial Arts", "Taj Mahal 3", "Jeff Loves Tea", "Best Movie Ever"]
      #   expect(graph.find_kevin_bacon(ferrell)).to eq ["Banks Open", "Seatown UK", "Jeff Loves Tea", "Best Movie Ever"]
      #   expect(graph.find_kevin_bacon(ferrell)).to eq ["Zinc Deposit", "Seatown UK", "Jeff Loves Tea", "Best Movie Ever"]
      # end
      #
      # it "should return an array with five films when starting nodes is five films away from Kevin Bacon" do
      #   expect(graph.find_kevin_bacon(jim)).to eq ["Same Team", "Martial Arts", "Taj Mahal 3", "Jeff Loves Tea", "Best Movie Ever"]
      # end

      # it "should test methods in SomeRubyClass.rb" do
      #   expect(KevinBacon.find_kevin_bacon(start)).to eq "success"
      # end
    end
end
