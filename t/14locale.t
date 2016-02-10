use strict;
use warnings;

use Test::More;

use DateTime::Moment;
use DateTime::Locale;

eval { DateTime::Moment->new( year => 100, locale => 'en_US' ) };
is( $@, '', 'make sure constructor accepts locale parameter' );

eval { DateTime::Moment->now( locale => 'en_US' ) };
is( $@, '', 'make sure constructor accepts locale parameter' );

eval { DateTime::Moment->today( locale => 'en_US' ) };
is( $@, '', 'make sure constructor accepts locale parameter' );

eval { DateTime::Moment->from_epoch( epoch => 1, locale => 'en_US' ) };
is( $@, '', 'make sure constructor accepts locale parameter' );

eval {
    DateTime::Moment->last_day_of_month( year => 100, month => 2, locale => 'en_US' );
};
is( $@, '', 'make sure constructor accepts locale parameter' );

{

    package DT::Object;
    sub utc_rd_values { ( 0, 0 ) }
}

eval {
    DateTime::Moment->from_object(
        object => DateTime::Moment->now,
        locale => 'en_US'
    );
};
is( $@, '', 'make sure constructor accepts locale parameter' );

eval {
    DateTime::Moment->new( year => 100, locale => DateTime::Locale->load('en_US') );
};
is( $@, '', 'make sure constructor accepts locale parameter as object' );

SKIP: {
    skip 'DefaultLocale method is unsupported.', 1;
    DateTime::Moment->DefaultLocale('it');
    is( DateTime::Moment->now->locale->id, 'it', 'default locale should now be "it"' );
}

{
    my $dt = DateTime::Moment->new(
        year      => 2013, month => 10, day => 27, hour => 0,
        time_zone => 'UTC'
    );

    my $after_zone = $dt->clone()->set_time_zone('Europe/Rome');

    is(
        $after_zone->offset(),
        '7200',
        'offset is 7200 after set_time_zone()'
    );

    my $after_locale
        = $dt->clone()->set_time_zone('Europe/Rome')->set_locale('en_GB');

    is(
        $after_locale->offset(),
        '7200',
        'offset is 7200 after set_time_zone() and set_locale()'
    );
}

done_testing();
