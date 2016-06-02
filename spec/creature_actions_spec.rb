require "creature_actions"

class DummyClass
  include CreatureActions
end

describe CreatureActions do

  before(:each) do
    @creature = DummyClass.new
  end

  describe "#hit" do

    it "exists" do
      expect(@creature).to respond_to(:hit)
    end

  end

  describe "#fight" do

    it "exists" do
      expect(@creature).to respond_to(:fight)
    end

  end

end