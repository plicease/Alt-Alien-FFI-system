package inc::My::MakeMaker;

use Moose;
use 5.008001;

extends 'Dist::Zilla::Plugin::MakeMaker';

my $extra;

around setup_installer => sub {
  my $orig = shift;
  my $self = shift;
  
  $self->$orig(@_);
  
  my($file) = grep { $_->name eq 'Makefile.PL' } @{ $self->zilla->files };
  
  my $content = $file->content;
  
  $extra = do { local $/; <DATA> } unless $extra;
  
  if($content =~ s{^WriteMakefile}{${extra}WriteMakefile}m)
  {
    $file->content($content);
    return;
  }
  else
  {
    die "unable to make the sub!";
  }
};

1;


__DATA__
do {

  # we do a compile/link test
  # but not a run test
  # that is reserved for for t/basic.t

  use lib 'lib';
  require ExtUtils::CBuilder;
  require Alien::FFI;

  my $b = ExtUtils::CBuilder->new;
  
  my $obj = eval {
    $b->compile(
      source               => "t/basic.c",
      extra_compiler_flags => Alien::FFI->cflags,
    );
  };
  
  if($@) {
    print STDERR "unable to compile with cflags=", Alien::FFI->cflags, "\n";
    exit;
  }

  my($exe, @rest) = eval {
    $b->link_executable(
      objects            => $obj,
      extra_linker_flags => Alien::FFI->libs,
    );
  };
  
  if($@) {
    print STDERR "unable to compile with libs=", Alien::FFI->libs, "\n";
    exit;
  }

  unlink $obj if $obj;
  unlink $exe if $exe;
  unlink $_ for @rest;

};


my $alt = $ENV{PERL_ALT_INSTALL} || '';
$WriteMakefileArgs{DESTDIR} =
  $alt ? $alt eq 'OVERWRITE' ? '' : $alt : 'no-install-alt';
