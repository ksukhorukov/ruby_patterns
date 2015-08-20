class Quest
  attr_reader :achivements

  def initialize
    @achivements = []
  end

  def add(elem)
    @achivements << elem 
  end

  def reward
    @achivements.inject(0) { |result, elem| result += elem.reward }
  end
end

class Encounter
  attr_reader :reward

  def initialize
    @reward = 100
  end
end

class Puzzle
  attr_reader :reward

  def initialize
    @reward = 200
  end
end

class Diplomacy
  attr_reader :reward

  def initialize
    @reward = 500
  end
end