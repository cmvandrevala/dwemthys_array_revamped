require "rabbit"

describe Rabbit do

  before(:each) do
    @rabbit = Rabbit.new
    allow(@rabbit).to receive(:puts) { "" }
  end

  context "a new rabbit" do

    it "has ten life" do
      expect(@rabbit.life).to eq 10
    end

    it "has two strength" do
      expect(@rabbit.strength).to eq 2
    end

    it "has 44 charisma" do
      expect(@rabbit.charisma).to eq 44
    end

    it "has 4 weapon" do
      expect(@rabbit.weapon).to eq 4
    end

    it "is initially equipped with three bombs" do
      expect(@rabbit.bombs).to eq 3
    end

  end

  context "special attacks" do

    before(:each) do
      @opponent = Rabbit.new
    end

    it "can throw a boomerang at the enemey" do
      allow(Kernel).to receive(:rand).and_return(3,0)

      @rabbit^@opponent

      expect(@opponent.life).to eq 7
    end

    it "can slash an enemy with a mighty sword" do
      allow(Kernel).to receive(:rand).and_return(3,2,0)

      @rabbit/@opponent

      expect(@opponent.life).to eq 8
    end

    it "can eat a bunch of lettuce to gain life" do
      allow(Kernel).to receive(:rand).and_return(25,1,0)

      @rabbit % @opponent

      expect(@rabbit.life).to eq 35
    end

    it "can do a minor amount of damage with lettuce" do
      allow(Kernel).to receive(:rand).and_return(25,1,0)

      @rabbit % @opponent

      expect(@opponent.life).to eq 9
    end

    it "can bomb an enemy for massive damage" do
      allow(Kernel).to receive(:rand).and_return(57,0)

      @rabbit * @opponent

      expect(@opponent.life).to eq -47
    end

    it "can only throw a given number of bombs" do
      allow(Kernel).to receive(:rand).and_return(20,0,20,0,20,0,20,0,20,0)

      5.times { @rabbit * @opponent }

      expect(@opponent.life).to eq -50
    end

  end

end