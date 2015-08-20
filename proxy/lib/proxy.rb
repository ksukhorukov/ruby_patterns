require 'forwardable'

class ComputerProxy
  
  extend Forwardable

  def_delegators :@real_object, :add, :execute

  def initialize(real_object)
    @real_object = real_object
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