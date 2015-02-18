package Alien::FFI;

use strict;
use warnings;
use 5.010;

# ABSTRACT: Get libffi compiler and linker flags
# VERSION

=head1 SYNOPSIS

 use Alien::FFI;
 my $cflags = Alien::FFI->cflags;
 my $libs   = Alien::FFI->libs;

=head1 DESCRIPTION

This is an alternate implementation of L<Alien::FFI>.  For the
full documentation, see

L<https://metacpan.org/pod/Alien::FFI>

=cut

sub new
{
  my($class) = @_;
  bless {}, $class;
}

my $pkg_config = 'pkg-config';
if(eval q{ use PkgConfig (); 1 })
{
  $pkg_config = "$^X $INC{'PkgConfig.pm'}";
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
    chomp $cflags;
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
    chomp $libs;
  }
  
  $libs;
}

1;
