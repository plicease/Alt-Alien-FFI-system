package Alien::FFI;

use strict;
use warnings;
use 5.008001;
use Carp qw( croak );

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

my $pkg_config;

foreach my $try ($ENV{PKG_CONFIG}, 'pkg-config', 'pkgconf')
{
  next unless defined $try;
  require IPC::Cmd;
  if(IPC::Cmd::can_run($try))
  {
    $pkg_config = $try;
    last;
  }
}

unless($pkg_config)
{
  if(eval q{ use PkgConfig (); 1 })
  {
    $pkg_config = "$^X $INC{'PkgConfig.pm'}";
  }
}

unless($pkg_config)
{
  die "unable to find pkg-config, pkgconf or PkgConfig.pm";
}

sub install_type
{
  'system';
}

my $config;

sub config
{
  my(undef, $key) = @_;

  unless($config)
  {
    my $version = `$pkg_config --modversion libffi`;
    die "package libffi not found" if $?;
    chomp $version;
    $config = {
      version    => $version,
      pkg_config => $pkg_config,
    };
  }
  
  $config->{$key};
}

foreach my $linkage ('share','static')
{
  foreach my $name ('cflags','libs')
  {
    my $value;
    
    my $flags = "--$name";
    my $subname = $name;
    if($linkage eq 'static')
    {
      $flags .= ' --static' if $linkage eq 'static';
      $subname .= '_static' if $linkage 
    }
    
    my $sub = sub {
      unless(defined $value)
      {
        #print "command = $pkg_config $flags libffi\n";
        $value = `$pkg_config $flags libffi`;
        die "package libffi not found" if $?;
        chomp $value;
      }
      $value;
    };

    no strict 'refs';
    *$subname = $sub;
  }
}

sub dist_dir
{
  croak "Failed to find share dir for dist 'Alt-Alien-FFI-System'";
}

sub bin_dir { () }
sub dynamic_libs { () }
sub version { shift->config('version') }

1;
