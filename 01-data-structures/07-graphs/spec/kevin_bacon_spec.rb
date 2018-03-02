include RSpec

RSpec.describe KevinBacon, type: Class do
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

    describe "#find_kevin_bacon" do
      before(:each) do
          butter_toast = Film.new("Butter Toast", [shaq, leo])
    			same_team = Film.new("Same Team", [jim, tyrese])
    			martial_arts = Film.new("Martial Arts", [ferrell, gadget, tyrese])
          taj_mahal_3 = Film.new("Taj Mahal 3", [gadget, leo])
          banks_open = Film.new("Banks Open", [ferrell, jonah])
    			zinc_deposit = Film.new("Zinc Deposit", [ferrell, jonah])
    			seatown_uk = Film.new("Seatown UK", [ferrell, jonah])
          oval_circus = Film.new("The Shining", [leo, wolverine])
    			jeff_loves_tea = Film.new("Gran Torino", [leo, diesel])
    			best_movie_ever = Film.new("Best Movie Ever", [bacon, diesel])
          bag_of_chips = Film.new(" Bag of Chips", [shaq, wolverine])
    	end

      it "should return an empty array when starting node is Kevin Bacon" do
        expect(KevinBacon.find_kevin_bacon(bacon)).to eq []
      end

      it "should return an array with one film when starting node is one film away from Kevin Bacon" do
        expect(find_kevin_bacon(diesel)).to eq ["Best Movie Ever"]
      end

      it "should return an array with two films when starting nodes is two films away from Kevin Bacon" do
        expect(find_kevin_bacon(leo)).to eq ["Jeff Loves Tea", "Best Movie Ever"]
      end

      it "should return an array with three films when starting nodes is three films away from Kevin Bacon" do
        expect(find_kevin_bacon(wolverine)).to eq ["Oval Circus", "Jeff Loves Tea", "Best Movie Ever"]
      end

      it "should return an array with four films when starting nodes is four films away from Kevin Bacon" do
        expect(find_kevin_bacon(ferrell)).to eq ["Martial Arts", "Taj Mahal 3", "Jeff Loves Tea", "Best Movie Ever"]
        expect(find_kevin_bacon(ferrell)).to eq ["Banks Open", "Seatown UK", "Jeff Loves Tea", "Best Movie Ever"]
        expect(find_kevin_bacon(ferrell)).to eq ["Zinc Deposit", "Seatown UK", "Jeff Loves Tea", "Best Movie Ever"]
      end

      it "should return an array with five films when starting nodes is five films away from Kevin Bacon" do
        expect(find_kevin_bacon(jim)).to eq ["Same Team", "Martial Arts", "Taj Mahal 3", "Jeff Loves Tea", "Best Movie Ever"]
      end

      # it "should test methods in SomeRubyClass.rb" do
      #   expect(KevinBacon.find_kevin_bacon(start)).to eq "success"
      # end
    end
end
