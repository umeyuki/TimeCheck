use strict;
use warnings;
use Time::Check;
use Test::More tests => 3;
#Time::Checkが使用できるかをテストします
use_ok('Time::Check');
my $time = new Time::Check(1,5);
can_ok('Time::Check', 'check');
is($time->check(3),1);       


