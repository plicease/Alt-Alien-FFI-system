use strict;
use warnings;
use Test::More tests => 1;
use Alien::FFI;

diag '';
diag '';
diag '';

diag "install_type = ". Alien::FFI->install_type;
diag "cflags       = ". Alien::FFI->cflags;
diag "libs         = ". Alien::FFI->libs;

diag '';
diag '';

pass "good";
