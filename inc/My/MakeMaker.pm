package inc::My::MakeMaker;

use Moose;

extends 'Dist::Zilla::Plugin::MakeMaker';

around setup_installer => sub {
  my $orig = shift;
  my $self = shift;
  
  $self->$orig(@_);
  
  my($file) = grep { $_->name eq 'Makefile.PL' } @{ $self->zilla->files };
  
  my $content = $file->content;
  
  my $extra = <<'EOF';
my $alt = $ENV{PERL_ALT_INSTALL} || '';
$WriteMakefileArgs{DESTDIR} =
  $alt ? $alt eq 'OVERWRITE' ? '' : $alt : 'no-install-alt';
EOF
  
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
