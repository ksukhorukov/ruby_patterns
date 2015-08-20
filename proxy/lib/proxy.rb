require 'forwardable'

class Hero

  attr_accessor :keywords

  def initialize
    @keywords = []
  end
  
end

class ComputerProxy
  
  extend Forwardable

  def_delegators :@real_object, :add
  def initialize(real_object, hero)
    @real_object = real_object
    @hero = hero
  end 

  #solution 1
  # def add(command)
  #   @real_object.add(command)
  # end

  # def execute
  #   @real_object.execute
  # end

  #solution 2
  # def method_missing(name, *args) 
  #   @real_object.send(name, *args)
  # end

  def execute
    check_access
    @real_object.execute
  end

  def check_access
    raise 'You have no access' unless @hero.keywords.include?(:computer)
  end

end

class Computer
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n"}
  end
end