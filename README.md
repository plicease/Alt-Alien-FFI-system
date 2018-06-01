# Alt::Alien::FFI::System [![Build Status](https://secure.travis-ci.org/plicease/Alt-Alien-FFI-System.png)](http://travis-ci.org/plicease/Alt-Alien-FFI-System)

Simplified alternative to Alien::FFI that uses system libffi

# SYNOPSIS

    env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::Alien::FFI::System

# DESCRIPTION

This distribution provides an alternative implementation of
[Alien::FFI](https://metacpan.org/pod/Alien::FFI) that is geared toward system integrators when
libffi is provided by the operating system.  It has no non-core
requirements for runtime as of Perl 5.8.  It now uses
use [Test::Alien](https://metacpan.org/pod/Test::Alien) for consistency with the original
[Alien::FFI](https://metacpan.org/pod/Alien::FFI).

It will NOT attempt to download or install libffi.  If you
need that, then install the original [Alien::FFI](https://metacpan.org/pod/Alien::FFI) instead.

# CAVEATS

[Test::Alien](https://metacpan.org/pod/Test::Alien) is now part of [Alien::Build](https://metacpan.org/pod/Alien::Build), so if you
need to run the tests, the prereqs aren't that much lighter
than the real [ALien::FFI](https://metacpan.org/pod/ALien::FFI), so you should consider:

- do your own testing
- skip tests
- switch to the real Alien::FFI

# SEE ALSO

- [Alt](https://metacpan.org/pod/Alt)
- [Alien::FFI](https://metacpan.org/pod/Alien::FFI)
- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)
- [FFI::CheckLib](https://metacpan.org/pod/FFI::CheckLib)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
