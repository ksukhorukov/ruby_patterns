require 'spec_helper'
require_relative '../lib/observer'

describe "Observation pattern" do 

  describe Hero do 
    let(:hero) { Hero.new }

    it "is cursed when discovers cursed Tile" do 
      tile = Tile.new cursed: true
      hero.discovers(tile)

      expect(hero.cursed?).to be_truthy
    end

    it "is not cursed when discovers simple Tile without curse" do 
      tile = Tile.new 
      hero.discovers(tile)

      expect(hero.cursed?).to be_falsy
    end

    it "has default health equal to 10" do 
      expect(hero.health).to eq(10)
    end

    it "can be damaged" do 
      hero.damage(6)
      expect(hero.health).to eq(4)
    end



  end

  describe Tile do 

    it "activates curse" do 
      hero = Hero.new
      tile = Tile.new cursed: true  
      hero.discovers(tile)
    end

    it "activates curse on several heroes" do 
      hero1 = Hero.new
      hero2 = Hero.new
      tile = Tile.new cursed: true
      hero1.discovers(tile)
      hero2.discovers(tile)
      tile.activate_curse
      expect(hero1.health).to eq(6)
      expect(hero2.health).to eq(6)
    end

    it "is not cursed by default" do
      tile = Tile.new
      expect(tile.cursed?).to be_falsy
    end
    it "can be created as cursed" do 
      tile = Tile.new cursed: true 
      expect(tile.cursed?).to be_truthy  
    end
  end 
end
