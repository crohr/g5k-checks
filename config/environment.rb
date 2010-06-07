require 'yaml'
require 'spec'

ENV['ENVIRONMENT'] ||= 'production'

lib_dir = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require "grid5000"

Grid5000.configuration = YAML.load_file(File.dirname(__FILE__)+"/config.yml")[ENV['ENVIRONMENT']]
fail "Cannot properly load the configuration" if Grid5000.configuration.nil? || Grid5000.configuration.empty?

# You may define a specific Grid5000 logger here,
# using either Syslogger or Logger
# Grid5000.logger = Syslogger.new(
#   "appname", Syslog::LOG_PID, Syslog::LOG_LOCAL0)
