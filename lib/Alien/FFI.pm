package Alien::FFI;

use strict;
use warnings;
use 5.010;

sub new
{
  my($class) = @_;
  bless {}, $class;
}

my $pkg_config = 'pkg-config';
if(eval q{ use PkgConfig (); 1 })
{
  $pkg_config = $INC{'PkgConfig.pm'};
}

sub install_type
{
  'system';
}

sub cflags
{
  state $cflags;
  
  unless(defined $cflags)
  {
    $cflags = `$pkg_config --cflags libffi`;
    $cflags = '' unless $? == 0;
  }
  
  $cflags;
}

sub libs
{
  state $libs;
  
  unless(defined $libs)
  {
    $libs = `$pkg_config --libs libffi`;
    $libs = '-lffi' unless $? == 0;
  }
  
  $libs;
}

1;
