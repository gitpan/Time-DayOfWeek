#!/usr/bin/perl -w
# 3C7G3ht - test.pl created by Pip@CPAN.org to validate Time::DayOfWeek
#     functionality.  
#   Before `make install' is performed this script should be run with
#     `make test'.  After `make install' it should work as `perl test.pl'.

BEGIN { $| = 1; print "0..7\n"; }
END   { print "not ok 1\n" unless($lded); }
use strict;
use Time::DayOfWeek qw(:all);

my $rslt; my $fldz; my $tnum = 0; our $lded = 1;
my @rdat = ();
&rprt(1);

sub rprt { # prints test progress
  my $baad = !shift;
  print "not " x $baad;
  print "ok ", $tnum++, "\n";
  print @_ if $ENV{TEST_VERBOSE} and $baad;
}

$rslt = DoW(2003, 12, 7);
&rprt($rslt == 0, "$rslt\n");

$rslt = Dow(2003, 12, 7);
&rprt($rslt eq 'Sun', "$rslt\n");

$rslt = DayOfWeek(2003, 12, 7);
&rprt($rslt eq 'Sunday', "$rslt\n");

$rslt = DoW(2004, 1, 1);
&rprt($rslt == 4, "$rslt\n");

$rslt = Dow(2004, 1, 1);
&rprt($rslt eq 'Thu', "$rslt\n");

$rslt = DayOfWeek(2004, 1, 1);
&rprt($rslt eq 'Thursday', "$rslt\n");

DayNames('Domingo', 'Lunes',  'Martes',  'Miercoles',
                       'Jueves', 'Viernes', 'Sabado');
$rslt = Dow(2003, 12, 13);
&rprt($rslt eq 'Sab', "$rslt\n");
#my @days = MonthNames(); print "$_\n" foreach(@days);
