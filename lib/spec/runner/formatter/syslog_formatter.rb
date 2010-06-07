require 'spec/runner/formatter/base_text_formatter'

# Code is based on standard SpecdocFormatter, but will log to Syslog.
#
# To use it, add the following to your spec/spec.opts:
#  --require
#  lib/spec/runner/formatter/syslog_formatter.rb
#  --format
#  Spec::Runner::Formatter::SyslogFormatter

require 'syslogger'

module Spec
  module Runner
    module Formatter
      class SyslogFormatter < BaseTextFormatter

        def logger
          if @logger.nil?
            @logger = Syslogger.new(
              "g5k-checks", 
              Syslog::LOG_PID, 
              Syslog.const_get(ENV['G5K_CHECKS_FACILITY'] || "LOG_LOCAL0"))
            @logger.level = Logger::DEBUG
          end
          @logger
        end
      
        def example_failed(example, counter, failure)
          super
          message = if failure.expectation_not_met?
            "FAILED\t#{failure.header}: #{failure.exception.message}"
          else
            "ERROR\t#{failure.header}: #{failure.exception.message}"
          end
          logger.error message
        end
        
        def example_passed(example)
          super
          logger.info "OK\t#{example_group.description} #{example.description}"
        end
        
        def example_pending(example, message)
          super
          logger.warn "PENDING\t#{example_group.description} #{example.description} (#{message})"
        end
      end
    end
  end
end
