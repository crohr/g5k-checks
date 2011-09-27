# g5k-checks

## Installation

Install the required libs with:

    $ bundle install

## Usage

In the g5k-checks directory, run:

    $ rake test

Or, from any directory:

    $ rake -f path/to/g5k-checks/Rakefile test

You may need to use bundler to load the specific dependencies required for
this project:

    $ bundle exec rake test

Errors will be logged by default to the LOCAL0 facility, and an HTML report
will be generated at reports/tests.html. The facility may be overwritten by
setting the `GRID5000_CHECKS_FACILITY` (e.g. `LOG_DAEMON`, `LOG_USER`,
`LOG_SYSLOG`, `LOG_LOCAL2`, etc.)

It would be extremely easy to add another formatter to suit any need you may
have.

To add more tests, just add test cases in the existing test files, or create a
new directory in `tests/` then a new spec file containing any number of test
cases.

If you need to launch tests separately, you may define new tasks in the
Rakefile that set a different `t.spec_files = FileList['tests/**/*_spec.rb']`
line.

## Example

Output generated in the syslog for the default tests in `tests/`:

    07/06/2010 17:56:06	g5k-checks[5859]	OK	Ethernet link should be enabled
    07/06/2010 17:56:06	g5k-checks[5859]	PENDING	Ethernet link should work (maybe we need to really test the link ?)
    07/06/2010 17:56:06	g5k-checks[5859]	ERROR	Errno::ENOENT in 'Processor should have the correct frequency': No such file or directory - /proc/cpuinfo
    07/06/2010 17:56:06	g5k-checks[5859]	ERROR	Errno::ENOENT in 'Processor should be of the correct model': No such file or directory - /proc/cpuinfo

## Authors

* Cyril ROHR <cyril.rohr@inria.fr>

## License

?
