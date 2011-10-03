use strict;
use warnings;
use lib "lib";
use Time::Check;

my $start_hour  = $ARGV[0];
my $end_hour    = $ARGV[1];
my $target_our  = $ARGV[2];

unless (defined($start_hour) && defined($end_hour) && defined($target_our)){
    die "Usage:perl myapp.pl start_hour end_hour target_hour";
}


my $time = Time::Check->new($start_hour,$end_hour);

#対象時間を含む場合はOK 含まない場合はNG
if ($time->check($target_our)) {
    print "OK!\n";
} else {
    print "NG!\n";
}
