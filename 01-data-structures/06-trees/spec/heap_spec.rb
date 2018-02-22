include RSpec

#require_relative 'heap'

RSpec.describe Heap, type: Class do

  let (:heap) { Heap.new() }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly sets the root node by insert it into an initialized heap" do
      heap.insert(pacific_rim)
      expect(heap.nodes).to eq([nil, pacific_rim])
    end

    it "properly arranges the min heap after inserting multiple nodes in no particular order" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(inception)
      heap.insert(hope)
      heap.insert(matrix)
      heap.insert(district)
      heap.insert(shawshank)

      expect(heap.nodes).to eq([nil, pacific_rim, braveheart, jedi, inception, matrix, shawshank, donnie, mad_max_2, hope, martian, district, empire])
    end
  end

  describe "#delete_node(node)" do
    it "removes the node from the heap" do
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.delete_node(pacific_rim)

      expect(heap.nodes).to eq([nil, braveheart])
    end

    it "properly rearranges the min heap after deleting multiple nodes in no particular order" do

      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(inception)
      heap.insert(hope)
      heap.insert(matrix)
      heap.insert(district)
      heap.insert(shawshank)

      heap.delete_node(braveheart)
      heap.delete_node(hope)
      heap.delete_node(inception)


      expect(heap.nodes).to eq([nil, pacific_rim, matrix, jedi, district, martian, shawshank, donnie, mad_max_2, empire])

    end
  end
  #
  describe "#find(node), #find_left_child, #find_right_child" do
    it "properly finds any node" do
      heap.insert(donnie)
      heap.insert(empire)

      expect(heap.find(empire)).to eq empire
      expect(heap.find(empire)).to_not eq donnie
    end

    it "properly finds a title of any node" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)

      expect(heap.find(pacific_rim).title).to eq "Pacific Rim"
    end

    it "properly find a rating of any node" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)

      expect(heap.find(pacific_rim).rating).to eq 72
    end

    it "properly finds a left child node" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)

      expect(heap.find_left_child(pacific_rim)).to eq mad_max_2
    end

    it "properly finds a right child node" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)

      expect(heap.find_right_child(pacific_rim)).to eq donnie
    end

    it "properly finds a collection of right and left child nodes" do
      heap.insert(donnie)
      heap.insert(mad_max_2)
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(inception)
      heap.insert(hope)
      heap.insert(matrix)
      heap.insert(district)
      heap.insert(shawshank)

      # right right
      expect(heap.find_right_child(heap.find_right_child(pacific_rim))).to eq donnie
      # right left
      expect(heap.find_left_child(heap.find_right_child(braveheart))).to eq martian
      # left right
      expect(heap.find_right_child(heap.find_left_child(braveheart))).to eq hope
      # left left
      expect(heap.find_left_child(heap.find_left_child(pacific_rim))).to eq inception
    end
  end

  describe "#print_heap" do
      specify {
        expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nThe Shawshank Redemption: 91\nDonnie Darko: 85\nMad Max 2: The Road Warrior: 98\nStar Wars: A New Hope: 93\nThe Martian: 92\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\n"
          heap.insert(donnie)
          heap.insert(mad_max_2)
          heap.insert(pacific_rim)
          heap.insert(braveheart)
          heap.insert(martian)
          heap.insert(empire)
          heap.insert(jedi)
          heap.insert(inception)
          heap.insert(hope)
          heap.insert(matrix)
          heap.insert(district)
          heap.insert(shawshank)
        expect { heap.print_heap }.to output(expected_output).to_stdout
      }
  end
end
