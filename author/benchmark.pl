use strict;
use warnings;
use utf8;
use feature qw/say/;

use Benchmark qw/cmpthese timethese/;

use DateTime;
use DateTime::Moment;

sub hr { say '-' x 40 }

say 'new()';
cmpthese timethese 100000 => {
    datetime => sub { DateTime->new(year => 2016) },
    moment   => sub { DateTime::Moment->new(year => 2016) },
};
hr();

say 'now()';
cmpthese timethese 100000 => {
    datetime => sub { DateTime->now },
    moment   => sub { DateTime::Moment->now },
};
hr();

say 'from_epoch()';
cmpthese timethese 100000 => {
    datetime => sub { DateTime->from_epoch(epoch => time) },
    moment   => sub { DateTime::Moment->from_epoch(epoch => time) },
};
hr();

say 'calculate()';
cmpthese timethese 100000 => {
    datetime => sub { DateTime->now->add(years => 1) },
    moment   => sub { DateTime::Moment->now->add(years => 1) },
};
hr();

__END__
new()
Benchmark: timing 100000 iterations of datetime, moment...
  datetime:  4 wallclock secs ( 4.08 usr +  0.01 sys =  4.09 CPU) @ 24449.88/s (n=100000)
    moment:  3 wallclock secs ( 2.70 usr +  0.00 sys =  2.70 CPU) @ 37037.04/s (n=100000)
            Rate datetime   moment
datetime 24450/s       --     -34%
moment   37037/s      51%       --
----------------------------------------
now()
Benchmark: timing 100000 iterations of datetime, moment...
  datetime:  5 wallclock secs ( 4.43 usr +  0.01 sys =  4.44 CPU) @ 22522.52/s (n=100000)
    moment:  2 wallclock secs ( 2.49 usr +  0.01 sys =  2.50 CPU) @ 40000.00/s (n=100000)
            Rate datetime   moment
datetime 22523/s       --     -44%
moment   40000/s      78%       --
----------------------------------------
from_epoch()
Benchmark: timing 100000 iterations of datetime, moment...
  datetime:  5 wallclock secs ( 4.38 usr +  0.01 sys =  4.39 CPU) @ 22779.04/s (n=100000)
    moment:  2 wallclock secs ( 2.28 usr +  0.01 sys =  2.29 CPU) @ 43668.12/s (n=100000)
            Rate datetime   moment
datetime 22779/s       --     -48%
moment   43668/s      92%       --
----------------------------------------
calculate()
Benchmark: timing 100000 iterations of datetime, moment...
  datetime: 21 wallclock secs (21.05 usr +  0.05 sys = 21.10 CPU) @ 4739.34/s (n=100000)
    moment:  4 wallclock secs ( 3.96 usr +  0.00 sys =  3.96 CPU) @ 25252.53/s (n=100000)
            Rate datetime   moment
datetime  4739/s       --     -81%
moment   25253/s     433%       --
----------------------------------------
