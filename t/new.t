use strict;
use warnings;
use Time::Check;
use Test::More;
use Test::Exception;
#0〜23以外の数字もしくは文字列を受けとった際の動作をテストします
plan tests => 6;
dies_ok {Time::Check->new(-1,12)} qr/arguments is incorrect/;
dies_ok {Time::Check->new(1,-12)} qr/arguments is incorrect/;
dies_ok {Time::Check->new("one",12)} qr/arguments is incorrect/;
dies_ok {Time::Check->new(1,"twelve")} qr/arguments is incorrect/;
dies_ok {Time::Check->new(18,25)} qr/arguments is incorrect/;
dies_ok {Time::Check->new(25,6)} qr/arguments is incorrect/;
