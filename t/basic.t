use strict;
use warnings;
use 5.008001;
use Test::More tests => 4;
use Alien::FFI;
use ExtUtils::CBuilder;

is(Alien::FFI->install_type, 'system', "install_type=system");

my $b = ExtUtils::CBuilder->new;

my $obj = eval {
  $b->compile(
    source               => "t/basic.c",
    extra_compiler_flags => Alien::FFI->cflags,
  );
};

ok -r $obj, "compile";

my($exe, @rest) = eval {
  $b->link_executable(
    objects            => $obj,
    extra_linker_flags => Alien::FFI->libs,
  );
};

ok -r $exe, "execute";

system $exe, '--test';
my $good = is $?, 0, "execute";

if($good)
{
  note "looks good, removing objects and executables";
  unlink $obj if $obj;
  unlink $exe if $exe;
  unlink $_ for @rest;
}
else
{
  diag "something went wrong, leaving the objects and executables";
}
