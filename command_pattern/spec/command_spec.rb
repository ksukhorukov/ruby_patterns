require 'spec_helper'
require_relative '../lib/command'

describe "Command Pattern" do 
  describe "Commands" do 
    describe AmplifyShieldCommand do 
      it "amplifies shield" do 
        command = AmplifyShieldCommand.new
        expect(command.execute).to eq("Amplified Plutonium-Gamma Shield")
      end
    end

    describe TestCompilerdCommand do 
      it "amplifies shield" do 
        command = TestCompilerdCommand.new
        expect(command.execute).to eq("Test Compiler Command")
      end
    end

    describe CalibrateDriverCommand do 
      it "amplifies shield" do 
        command = CalibrateDriverCommand.new
        expect(command.execute).to eq("Callibrate Driver Command")
      end
    end

    describe InstallRegulatorCommand do 
      it "amplifies shield" do 
        command = InstallRegulatorCommand.new
        expect(command.execute).to eq("Install Regulator Command")
      end
    end

  end
end
