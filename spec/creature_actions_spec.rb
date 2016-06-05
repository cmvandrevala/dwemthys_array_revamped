require "creature_actions"

class DummyCreature
  include CreatureActions
  attr_accessor :life, :strength, :weapon
  attr_reader :charisma

  def initialize
    @life = 100
    @charisma = 73
    @strength = 52
    @weapon = 31
  end
end

describe CreatureActions do

  before(:each) do
    @creature = DummyCreature.new
    allow(@creature).to receive(:puts).and_return("")
  end

  describe "#hit" do

    it "deals no damage if there is no damage and no magick boost" do
      allow(Kernel).to receive(:rand).and_return(0)

      @creature.hit(0)

      expect(@creature.life).to eq 100
    end

    it "deals one damage if there is one damage and no magick boost" do
      allow(Kernel).to receive(:rand).and_return(0)

      @creature.hit(1)

      expect(@creature.life).to eq 99
    end

    it "deals 57 damage if there is 57 damage and no magick boost" do
      allow(Kernel).to receive(:rand).and_return(0)

      @creature.hit(57)

      expect(@creature.life).to eq 43
    end

    it "deals 65 damage if there is 66 damage and a magick boost of 1" do
      allow(Kernel).to receive(:rand).and_return(7)

      @creature.hit(66)

      expect(@creature.life).to eq 35
    end

    it "deals 1000 damage if there is 1000 damage and no magick boost" do
      allow(Kernel).to receive(:rand).and_return(0)

      @creature.hit(1000)

      expect(@creature.life).to eq -900
    end

  end

  describe "#fight" do

    before(:each) do
      @opponent = DummyCreature.new
    end

    it "cannot fight if it is dead" do
      @creature.life = 0

      @creature.fight(@opponent, 100)

      expect(@opponent.life).to eq 100
    end

    it "deals no damage if the attacker has no strength and no weapon power" do
      allow(Kernel).to receive(:rand).and_return(0)
      @creature.strength = 0
      @creature.weapon = 0

      @creature.fight(@opponent, @creature.weapon)

      expect(@opponent.life).to eq 100
    end

    it "deals damage based on the attacker's strength and weapon power" do
      allow(Kernel).to receive(:rand).and_return(10,0)

      @creature.fight(@opponent, @creature.weapon)

      expect(@opponent.life).to eq 90
    end

    it "uses the default weapon attribute if no specific weapon is given" do
      allow(Kernel).to receive(:rand).and_return(67,0)

      @creature.fight(@opponent)

      expect(@opponent.life).to eq 33
    end

  end

  describe "#magick_power_up" do

    it "returns 0 if the randomly generated charisma is 0" do
      allow(Kernel).to receive(:rand).and_return(0)

      expect(@creature.magick_power_up).to eq 0
    end

    it "returns 0 if the randomly generated charisma is 1" do
      allow(Kernel).to receive(:rand).and_return(1)

      expect(@creature.magick_power_up).to eq 0
    end

    it "returns 0 if the randomly generated charisma is 2" do
      allow(Kernel).to receive(:rand).and_return(2)

      expect(@creature.magick_power_up).to eq 0
    end

    it "returns 1 if the randomly generated charisma is 7" do
      allow(Kernel).to receive(:rand).and_return(7)

      expect(@creature.magick_power_up).to eq 1
    end

    it "returns 4 if the randomly generated charisma is 16" do
      allow(Kernel).to receive(:rand).and_return(16)

      expect(@creature.magick_power_up).to eq 4
    end

    it "returns 6 if the randomly generated charisma is 25" do
      allow(Kernel).to receive(:rand).and_return(25)

      expect(@creature.magick_power_up).to eq 6
    end

  end

end