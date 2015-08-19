require 'spec_helper'
require_relative '../lib/observer'

describe "Observation pattern" do 

  describe Hero do 
    it "is cursed when discovers cursed Tile" do 
      hero = Hero.new
      tile = Tile.new cursed: true
      hero.discovers(tile)

      expect(hero.cursed?).to be_truthy
    end

    it "is not cursed when discovers simple Tile without curse" do 
      hero = Hero.new
      tile = Tile.new 
      hero.discovers(tile)

      expect(hero.cursed?).to be_falsy
    end

  end

  describe Tile do 
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
