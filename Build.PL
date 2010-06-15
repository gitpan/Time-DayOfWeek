#!/usr/bin/perl
use Module::Build;
my $mbld = Module::Build->new(
# 'module_name'                   => 'Time::DayOfWeek',
  'dist_name'                     => 'Time-DayOfWeek',
# 'dist_version_from'             => 'DayOfWeek.pm',
  'dist_version'                  => '1.4.A6FCO7V',
  'dist_abstract'                 => 'calculate which Day-of-Week a date is',
  'dist_author'                   => 'Pip Stuart <Pip@CPAN.Org>',
# 'create_readme'                 => '1',
# 'create_makefile_pl'            => '1', # 'traditional',
  'license'                       => 'gpl',
  'script_files'                  => {
    'bin/dow'                       => '1',
  },
  'pm_files'                      => {
    'DayOfWeek.pm'                  => 'lib/Time/DayOfWeek.pm',
  },
  'requires'                      => {
    'Test'                          => '0',
    'Test::Pod'                     => '0',
    'Test::Pod::Coverage'           => '0',
  },
);
$mbld->create_build_script();