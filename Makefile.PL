use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# # the contents of the Makefile that is written.
WriteMakefile(
  'NAME'         => 'Time::DayOfWeek',
  'VERSION_FROM' => 'DayOfWeek.pm', # finds $VERSION
  'ABSTRACT'     => 'calculate which Day-of-Week a date is',
  'dist'         => { 'COMPRESS' => 'gzip', 'SUFFIX' => 'tgz' },
);