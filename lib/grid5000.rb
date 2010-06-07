require 'syslogger'
require 'grid5000/node'

module Grid5000

  def self.configuration=(config={})
    @configuration = config
  end
  def self.configuration
    @configuration ||= {}
  end
  
  def self.logger=(logger)
    @logger = logger
  end
  def self.logger
    @logger ||= Logger.new(STDERR)
  end
  
end
