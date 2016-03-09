package Alt::Alien::FFI::System;

use strict;
use warnings;
use 5.008001;

# ABSTRACT: Simplified alternative to Alien::FFI that uses system libffi
# VERSION

=head1 SYNOPSIS

 env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::Alien::FFI::System

=head1 DESCRIPTION

This distribution provides an alternative implementation of
L<Alien::FFI> that is geared toward system integrators when
libffi is provided by the operating system.  It has no non-core
requirements as of Perl 5.10 (it does require 
L<ExtUtils::CBuilder> which was non-core in 5.8).

It will NOT attempt to download or install libffi.  If you
need that, then install the original L<Alien::FFI> instead.

=head1 SEE ALSO

=over 4

=item L<Alt>

=item L<Alien::FFI>

=item L<FFI::Platypus>

=item L<FFI::Raw>

=item L<FFI::CheckLib>

=back

=cut

1;
