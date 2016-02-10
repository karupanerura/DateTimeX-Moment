requires 'Class::Accessor::Lite';
requires 'Class::Inspector';
requires 'DateTime::Locale';
requires 'DateTime::TimeZone';
requires 'List::Util';
requires 'Scalar::Util';
requires 'Sub::Args';
requires 'Time::Moment';
requires 'perl', '5.008001';

recommends 'DateTime';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
};

on test => sub {
    requires 'DateTime::LeapSecond';
    requires 'Test::Fatal';
    requires 'Test::More', '0.98';
    requires 'Test::Warnings', '0.005';
    requires 'Try::Tiny';
};
