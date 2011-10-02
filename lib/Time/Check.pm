package Time::Check;

use strict;
use warnings;

sub new {

    my ($self,$start,$end) = @_;
    if (!($start =~ /^\d+$/ && $start < 24 && $end =~ /^\d+$/ && $end < 24)) {
        die "argument is incorrect";
    }

    my $hash = {
        start => $start,
        end   => $end,
    };
    return bless $hash,$self;
}

sub check {
    my ($self,$target_hour,$same_flag) = @_;
    my $start_hour = $self->{start};
    my $end_hour   = $self->{end};

    if($start_hour == $end_hour && $target_hour == $end_hour){
        return 1;
    }elsif($start_hour == $end_hour && $target_hour != $end_hour){
        return 0;
    }

    if ($start_hour < $end_hour) {
        if ($target_hour >= $start_hour && $target_hour < $end_hour) {
            return 1;
        }
    } else {
        if ($target_hour >= $start_hour || $target_hour < $end_hour) {
            return 1;
        }
    }
    return 0;
}

package Main;

my $start_hour  = $ARGV[0];
my $end_hour    = $ARGV[1];
my $target_our = $ARGV[2];

unless (defined($start_hour) && defined($end_hour) && defined($target_our)){
    die "you need three arguments. perl app.pl start_hour end_hour target_hour";
}

my $time = Time::Check->new($start_hour,$end_hour);
if ($time->check($target_our)) {
    print "good!\n";
} else {
    print "bad!\n";
}
