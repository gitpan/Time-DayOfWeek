#!/usr/bin/perl
use strict; use warnings;
use Time::DayOfWeek qw(:dow);

my($year, $month, $day)=(2003, 12, 7);

print "The Day-of-Week of $year/$month/$day (YMD) is: ",
  DayOfWeek($year, $month, $day), "\n";
print 'The 3-letter abbreviation       of the Dow is: ',
  Dow(      $year, $month, $day), "\n";
print 'The 0-based  index              of the DoW is: ',
  DoW(      $year, $month, $day), "\n";

