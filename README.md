# g5k-checks

## Installation
Install the required libs:

* json
* rest-client
* syslogger

## Usage
In the g5k-checks directory, run:

    rake test

Or, from any directory:

    rake -f path/to/g5k-checks/Rakefile test

Errors will be logged by default to the LOCAL0 facility, and an HTML report will be generated at reports/tests.html. The facility may be overwritten by setting the `GRID5000_CHECKS_FACILITY` (e.g. `LOG_DAEMON`, `LOG_USER`, `LOG_SYSLOG`, `LOG_LOCAL2`, etc.)

It would be extremely easy to add another formatter to suit any need you may have.

To add more tests, just add test cases in the existing test files, or create a new directory in `tests/` then a new spec file containing any number of test cases.

If you need to launch tests separately, you may define new tasks in the Rakefile that set a different `t.spec_files = FileList['tests/**/*_spec.rb']` line.

## Example
Output generated in the syslog for the default tests in `tests/`:

    07/06/2010 17:23:10	g5k-checks[5490]	ERROR	Ethernet link should be enabled
    07/06/2010 17:23:10	g5k-checks[5490]	PENDING	Ethernet link should work (maybe we need to really test the link ?)
    07/06/2010 17:23:10	g5k-checks[5490]	ERROR	Processor should have the correct frequency
    07/06/2010 17:23:10	g5k-checks[5490]	ERROR	Processor should be of the correct model

## Authors

* Cyril ROHR <cyril.rohr@irisa.fr>

## License
?
