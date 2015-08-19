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
    "Amplified Plutonium-Gamma Shield"
  end
end


class TestCompilerdCommand 
  def execute
    "Test Compiler Command"
  end
end

class CalibrateDriverCommand 
  def execute
    "Callibrate Driver Command"
  end
end

class InstallRegulatorCommand 
  def execute
    "Install Regulator Command"
  end
end