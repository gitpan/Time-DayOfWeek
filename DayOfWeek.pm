# 3C7Exdx - Time::DayOfWeek.pm created by Pip@CPAN.org to 
#   simply tell what day of the week a specific date is.

=head1 NAME

  Time::DayOfWeek - calculate which Day-of-Week a date is

=head1 VERSION

  This documention refers to version 1.0.3CB7PxT of 
    Time::DayOfWeek, which was released on Thu Dec 11 07:25:59:29 2003.

=head1 SYNOPSIS

    use Time::DayOfWeek;
    
    my $year  = 2003;
    my $month =   12;
    my $day   =    7;
    print 'The Day-of-Week of $month/$day/$year is: ', 
      DayOfWeek($year, $month, $day), "\n";
    print 'The 3-letter abbreviation of the Dow is: ', 
      Dow($year, $month, $day), "\n";
    print 'The 0-based index of the DoW is: ', 
      DoW($year, $month, $day), "\n";

=head1 DESCRIPTION

  This module just calculates the Day-of-the-Week for any particular
    date.  It was inspired by the clean Time::DaysInMonth module
    written by David Muir Sharnoff <muir@idiom.com>.

=head1 2DO

        What else does DayOfWeek need?

=head1 WHY?

  The reason I created DayOfWeek was to support other Time modules
    which would like to have a Day-of-Week calculated.

=head1 USAGE

  DoW(<Year>, <Month>, <Day>) - Time::DayOfWeek's core function 
    which does the calculation && returns the weekday index
    answer in 0..6.  If no Year is supplied, 2000 C.E. is 
    assumed.  If no Month or Day is supplied, they are set 
    to 1.  Months are 1-based in 1..12.

    DoW() is the only function that is exported from a normal 
      'use Time::DayOfWeek;' command.  Other functions can be imported
      to local namespaces explicitly or with the following tags:
        :all - every function described here
        :dow - only DoW(), Dow(), && DayOfWeek()
        :nam - only DayNames() && MonthNames()
        :day - everything but MonthNames()

  Dow(<Year>, <Month>, <Day>) - same as above but returns
    3-letter day abbreviations in 'Sun'..'Sat'.

  DayOfWeek(<Year>, <Month>, <Day>) - same as above but returns
    full day names in 'Sunday'..'Saturday'.

  DayNames(<@NewDayNames>) - can override default day names
    with the strings in @NewDayNames.  The current list of day 
    names is returned so call DayNames() with no parameters
    to obtain a list of the default day names.

    An example call is:
      DayNames('Domingo', 'Lunes',  'Martes',  'Miercoles',
                             'Jueves', 'Viernes', 'Sabado');

  MonthNames(<@NewMonthNames>) - has also been included to 
    provide a centralized name set.  Just like DayNames(), 
    this function returns the current list of month names
    so call MonthNames() with no parameters to obtain a list
    of the default month names.

=head1 NOTES

  I hope you find Time::DayOfWeek useful.  Please feel free to e-mail me 
    any suggestions || coding tips || notes of appreciation 
    ("app-ree-see-ay-shun").  Thank you.  TTFN.

=head1 CHANGES

  Revision history for Perl extension Time::DayOfWeek:

=over 4

=item - 1.0.3CB7PxT  Thu Dec 11 07:25:59:29 2003

  * added month name data && tidied up for release

=item - 1.0.3C7IOam  Sun Dec  7 18:24:36:48 2003

  * wrote pod && made tests

=item - 1.0.3C7Exdx  Sun Dec  7 14:59:39:59 2003

  * original version

=back

=head1 INSTALL

  Please run:
        `perl -MCPAN -e "install Time::DayOfWeek"`
    or uncompress the package && run the standard:
        `perl Makefile.PL; make; make test; make install`

=head1 FILES

  Time::DayOfWeek requires:
    Carp                to allow errors to croak() from calling sub

=head1 LICENSE

  Most source code should be Free!
    Code I have lawful authority over is && shall be!
  Copyright: (c) 2003, Pip Stuart.  All rights reserved.
  Copyleft :  I license this software under the GNU General Public
    License (version 2).  Please consult the Free Software Foundation
    (http://www.fsf.org) for important information about your freedom.

=head1 AUTHOR

  Pip Stuart <Pip@CPAN.org>

=cut

package Time::DayOfWeek;
require Exporter;
use strict;
use base qw( Exporter );
use Carp;
our $VERSION     = '1.0.3CB7PxT'; # major . minor . PipTimeStamp
our $PTVR        = $VERSION; $PTVR =~ s/^\d+\.\d+\.//; # strip major && minor
# See http://Ax9.org/pt?$PTVR && `perldoc Time::PT`
# only export cnv() for 'use Time::DayOfWeek;' && all other stuff optionally
our @EXPORT      =              qw( DoW                                   );
our @EXPORT_OK   =              qw(     Dow DayOfWeek DayNames MonthNames );
our %EXPORT_TAGS = ( 'all' => [ qw( DoW Dow DayOfWeek DayNames MonthNames ) ],
                     'dow' => [ qw( DoW Dow DayOfWeek                     ) ],
                     'nam' => [ qw(                   DayNames MonthNames ) ],
                     'day' => [ qw( DoW Dow DayOfWeek DayNames            ) ]);

my @Days = qw( Sunday Monday Tuesday Wednesday Thursday Friday Saturday );
my @Day  = (); push(@Day, substr($_, 0, 3)) foreach(@Days);
my @Months = ( qw( January February March     April   May      June 
                   July    August   September October November December ) );

sub DoW { # calculate the day-of-the-week from the Year, Month, && Day
  my $year = shift; $year = 2000 unless(defined $year);
  my $mont = shift; $mont =    1 unless(defined $mont); # 1..12
  my $daay = shift; $daay =    1 unless(defined $daay); # 1..31
  my $mndx = int((14 - $mont) / 12); 
  my $yshf = $year - $mndx; my $ys4h = $yshf / 400; 
  $daay += $yshf + int($ys4h) - int($ys4h * 4) + int($ys4h * 100);
  return(($daay + (31 * int((12 * $mndx) + $mont - 2)) / 12) % 7);
}
sub Dow       { return($Day[ DoW(@_)]); } # return 3-letter abbrev.
sub DayOfWeek { return($Days[DoW(@_)]); } # return full day name
sub DayNames { # assign a new day names list
  @Days = @_ if(@_ >= @Days);  # don't assign too few day names
  @Day  = (); 
  foreach(@Days) { # redo abbrevs
    (length($_) > 3) ? push(@Day, substr($_, 0, 3)) : push(@Day, $_);
  }
  return( @Days );
}
sub MonthNames { # assign a new month names list
  @Months = @_ if(@_ >= @Months);  # don't assign too few month names
  return( @Months );
}

127;
