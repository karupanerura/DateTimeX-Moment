use strict;
use warnings;

use Test::More;

use DateTime::Moment;
use DateTime::Moment::Duration;

{
    my $dt = DateTime::Moment->new( year => 2008, month => 2, day => 28 );
    my $du = DateTime::Moment::Duration->new( years => 1 );

    my $p;

    $p = $dt->set( year => 1882 );
    is( DateTime::Moment->compare( $p, $dt ), 0, "set() returns self" );

    $p = $dt->set_time_zone('Australia/Sydney');
    is( DateTime::Moment->compare( $p, $dt ), 0, "set_time_zone() returns self" );

    $p = $dt->add_duration($du);
    is( DateTime::Moment->compare( $p, $dt ), 0, "add_duration() returns self" );

    $p = $dt->add( years => 2 );
    is( DateTime::Moment->compare( $p, $dt ), 0, "add() returns self" );

    $p = $dt->subtract_duration($du);
    is( DateTime::Moment->compare( $p, $dt ), 0, "subtract_duration() returns self" );

    $p = $dt->subtract( years => 3 );
    is( DateTime::Moment->compare( $p, $dt ), 0, "subtract() returns self" );

    $p = $dt->truncate( to => 'day' );
    is( DateTime::Moment->compare( $p, $dt ), 0, "truncate() returns self" );

}

done_testing();
