class Reactor
  def initialize
    @functional = false
    @right_command = "command1\ncommand2\ncommand3\ncommand4\n"
  end

  def functional?
    @functional
  end

  def fix(result)
    @functional = result == @right_command 
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
    queue.inject("") { |result, command| result += command.execute + "\n" }
  end

end

class  AmplifyShieldCommand
  def execute
    "command1"
  end
end

class CalibrateDriverCommand 
  def execute
    "command2"
  end
end

class TestCompilerdCommand 
  def execute
    "command3"
  end
end

class InstallRegulatorCommand 
  def execute
    "command4"
  end
end