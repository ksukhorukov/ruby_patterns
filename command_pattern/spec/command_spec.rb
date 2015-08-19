require 'spec_helper'
require_relative '../lib/command'

describe "Command Pattern" do 

  describe Reactor do 
    it "is fixed if commands are executed im the right order" do 
      computer = Computer.new 
      computer.add(AmplifyShieldCommand.new)
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestCompilerdCommand.new)
      computer.add(InstallRegulatorCommand.new)

      reactor = Reactor.new
      expect(reactor.functional?).to  be_falsy

      reactor.fix(computer.execute)
      expect(reactor.functional?).to be_truthy
    end
  end

  describe Computer do 
    let(:computer) { Computer.new }

    before :each do 
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestCompilerdCommand.new)
    end

    it "can add commands to its queue" do 
      expect(computer.queue.size).to eq(2)
    end

    it "executes all commands in order" do 
      expect(computer.execute).to eq "command2\ncommand3\n"
    end
  end


  describe "Commands" do 
    describe AmplifyShieldCommand do 
      it "amplifies shield" do 
        command = AmplifyShieldCommand.new
        expect(command.execute).to eq("command1")
      end
    end

    describe TestCompilerdCommand do 
      it "amplifies shield" do 
        command = TestCompilerdCommand.new
        expect(command.execute).to eq("command3")
      end
    end

    describe CalibrateDriverCommand do 
      it "amplifies shield" do 
        command = CalibrateDriverCommand.new
        expect(command.execute).to eq("command2")
      end
    end

    describe InstallRegulatorCommand do 
      it "amplifies shield" do 
        command = InstallRegulatorCommand.new
        expect(command.execute).to eq("command4")
      end
    end

  end
end
