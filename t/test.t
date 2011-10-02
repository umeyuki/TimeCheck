use strict;
use warnings;
use Time::Check;
use Test::More tests => 3;
use_ok('Time::Check');                  #test 1
my $time = new Time::Check(1,5);
can_ok('Time::Check', 'check');        #test 2
is($time->check(3),1);          #tset3

undef $time;
