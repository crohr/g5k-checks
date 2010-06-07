ROOT_DIR = File.dirname(__FILE__)

require File.join(ROOT_DIR, 'config/environment')

require 'rake'
require 'spec/rake/spectask'
require 'spec/runner/formatter/syslog_formatter'

desc "Launch all the tests"
Spec::Rake::SpecTask.new('test') do |t|
  Dir.chdir(ROOT_DIR) do |dir|
    t.spec_files = FileList['tests/**/*_spec.rb']
    t.spec_opts = [
      "--require", "lib/spec/runner/formatter/syslog_formatter.rb",
      "--format", "Spec::Runner::Formatter::SyslogFormatter",
      "--format", "html:reports/tests.html"
    ]
  end
  t.fail_on_error = false
end

task :default => :test


