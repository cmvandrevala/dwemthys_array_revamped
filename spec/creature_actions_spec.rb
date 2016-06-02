require "creature_actions"

class DummyClass
  include CreatureActions
  attr_accessor :life
  attr_reader :charisma

  def initialize
    @life = 100
    @charisma = 100
  end
end

describe CreatureActions do

  before(:each) do
    @creature = DummyClass.new
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

    it "exists" do
      expect(@creature).to respond_to(:fight)
    end

  end

  describe "#magick_power_up" do

    before(:each) do
      allow(@creature).to receive(:puts).and_return("")
    end

    it "returns 0 if no charisma is given" do
      expect(@creature.magick_power_up).to eq 0
    end

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