use strict;
use warnings;

use Test::More;

use DateTime::Moment;

for my $y ( 0, 400, 2000, 2004 ) {
    ok( DateTime::Moment::_is_leap_year($y), "$y is a leap year" );
}

for my $y ( 1, 100, 1900, 2133 ) {
    ok( !DateTime::Moment::_is_leap_year($y), "$y is not a leap year" );
}

done_testing();
