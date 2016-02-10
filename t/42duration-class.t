use strict;
use warnings;

use Test::More skip_all => 'unsupported';
use DateTime::Moment;

{

    package DateTime::MySubclass;
    use base 'DateTime::Moment';

    sub duration_class {'DateTime::Moment::Duration::MySubclass'}

    package DateTime::Moment::Duration::MySubclass;
    use base 'DateTime::Moment::Duration';

    sub is_my_subclass {1}
}

my $dt    = DateTime::MySubclass->now;
my $delta = $dt - $dt;

isa_ok( $delta,       'DateTime::Moment::Duration::MySubclass' );
isa_ok( $dt + $delta, 'DateTime::MySubclass' );

my $delta_days = $dt->delta_days($dt);
isa_ok( $delta_days, 'DateTime::Moment::Duration::MySubclass' );

done_testing();
