#!/usr/env/bin perl

use strict;
use warnings;

use Test::More;

use lib 'lib/';

use UrlShortner::BaseConverter;

subtest 'convertToBaseSixtyTwo' => sub {

    subtest "should return 'I' when converting '34'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseSixtyTwo(34);

        is( $result, "I" );
    };

    subtest "should return '9' when converting '61'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseSixtyTwo(61);

        is( $result, "9" );
    };

    subtest "should return 'ba' when converting '62'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseSixtyTwo(62);

        is( $result, "ba" );
    };

    subtest "should return 'cvuMLb' when converting '2147483647'" => sub {

        my $result =
          UrlShortner::BaseConverter::convertToBaseSixtyTwo(2147483647);

        is( $result, "cvuMLb" );
    };
};

subtest 'convertToBaseTen' => sub {

    subtest "should return '34' when converting 'I'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseTen("I");

        is( $result, 34 );
    };

    subtest "should return '61' when converting '9'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseTen("9");

        is( $result, 61 );
    };

    subtest "should return '62' when converting 'ba'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseTen("ba");

        is( $result, 62 );
    };

    subtest "should return '2147483647' when converting 'cvuMLb'" => sub {

        my $result = UrlShortner::BaseConverter::convertToBaseTen("cvuMLb");

        is( $result, 2147483647 );
    };
};

done_testing();
