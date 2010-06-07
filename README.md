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

## Authors

* Cyril ROHR <cyril.rohr@irisa.fr>

## License
?
