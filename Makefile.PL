use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
#   the contents of the Makefile that is written.
WriteMakefile(
  'NAME'         => 'Time::DayOfWeek',
  'VERSION'      => '1.4.75R5ulZ',
  'ABSTRACT'     => 'calculate which Day-of-Week a date is',
  'AUTHOR'       => 'Pip Stuart <Pip@CPAN.Org>',
  'EXE_FILES'    => [ 
                      'bin/dow',
                    ],
  'PREREQ_PM'    => {
    'Test'                           => 0,
    'Test::Pod'                      => 0,
    'Test::Pod::Coverage'            => 0,
  }, # Module::Name => 1.1,
  'dist'         => { 'COMPRESS' => 'gzip', 'SUFFIX' => 'tgz' },
);