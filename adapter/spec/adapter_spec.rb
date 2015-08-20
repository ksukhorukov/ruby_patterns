require 'spec_helper'
require_relative '../lib/adapter'

describe "Adapter Pattern" do 

  describe "Finishing quest functionality" do 
    it "rewards hero with experience points" do 
      # difficulty * 50 / hero_level (default = 1)
      hero = Hero.new
      quest = Quest.new(5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(250)
    end
  end

end