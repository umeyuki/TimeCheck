
package Time::Check;

use strict;
use warnings;

sub new {
    my ($self,$start,$end) = @_;
    #正しい時間が入力されているかをチェックする 0〜23
    if (!($start =~ /^\d+$/ && $start >= 0 && $start < 24 && $end =~ /^\d+$/ && $end >= 0 && $end < 24)) {
        die "arguments is incorrect";
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

    #開始時刻と終了時刻が同じ場合は範囲指定に終了時刻を含む
    if($start_hour == $end_hour && $target_hour == $end_hour){
        return 1;
    }elsif($start_hour == $end_hour && $target_hour != $end_hour){
        return 0;
    }
    #開始時刻<終了時刻 の場合
    if ($start_hour < $end_hour) {
        if ($target_hour >= $start_hour && $target_hour < $end_hour) {
            return 1;
        }
    }
    #開始時刻>終了時刻 の場合
    else {
        if ($target_hour >= $start_hour || $target_hour < $end_hour) {
            return 1;
        }
    }
    return 0;
}
1;
