require File.dirname(__FILE__)+"/../spec_helper"

describe "Processor" do
  before do
    @cpuinfo = File.read('/proc/cpuinfo')
  end
  
  it "should have the correct frequency" do
    expected_cpu_frequency = @node.description["processor"]["clock_speed"]/1_000_000
    cpu_frequency_line = @cpuinfo.detect{ |line|
      line.include?("cpu MHz")
    }
    cpu_frequency_line.should_not be_nil
    cpu_frequency = cpu_frequency_line.split(":")[1].to_i
    cpu_frequency.
      should be_close(expected_cpu_frequency, expected_cpu_frequency/100.0)
  end
  
  it "should be of the correct model" do
    expected_processor_model = @node.description["processor"]["model"]
    cpu_model_line = @cpuinfo.detect{ |line|
      line.include?("model name")
    }
    cpu_model_line.should =~ /#{expected_processor_model}/i
  end
end
