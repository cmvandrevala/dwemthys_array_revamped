require "creature_actions"
require "creature"

class TestCreature < Creature
  life 1
  strength 2
  charisma 3
  weapon 4
end

describe Creature do

  before(:each) do
    @creature = TestCreature.new
  end

  it "has some number of life points" do
    expect(@creature.life).to eq 1
  end

  it "has some number of strength points" do
    expect(@creature.strength).to eq 2
  end

  it "has some number of charisma points" do
    expect(@creature.charisma).to eq 3
  end

  it "has some number of weapon points" do
    expect(@creature.weapon).to eq 4
  end

end
