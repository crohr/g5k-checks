require File.dirname(__FILE__)+'/../config/environment'

Spec::Runner.configure do |config|
  config.prepend_before(:all) do
    # The GRID5000_CHECKS_HOSTNAME allows us to setup at runtime 
    # a fake node hostname via an environment variable.
    # Useful for testing.
    # If nil, the hostname will be used.
    @node = Grid5000::Node.new(ENV['GRID5000_CHECKS_HOSTNAME'])
  end
end
