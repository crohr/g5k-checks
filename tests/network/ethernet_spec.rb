require File.dirname(__FILE__)+"/../spec_helper"

describe "Ethernet link" do
  
  it "should be enabled" do
    @node.description["network_adapters"].select{ |na|
      na["interface"] =~ /ethernet/i
    }.each_with_index{ |na, i| 
      `ethtool eth#{i}`.include?("Speed: #{na["rate"]/1000}Mb/s")
    }
  end
  
  it "should work" do
    pending "maybe we need to really test the link ?"
  end
  
end
