# Alt::Alien::FFI::System

Simplified alternative to Alien::FFI that uses system libffi

# SYNOPSIS

    env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::Alien::FFI::System

# DESCRIPTION

This distribution provides an alternative implementation of
[Alien::FFI](https://metacpan.org/pod/Alien::FFI) that is geared toward system integrators when
libffi is provided by the operating system.  It has no non-core
requirements.

It will NOT attempt to download or install libffi.  If you
need that, then install the original [Alien::FFI](https://metacpan.org/pod/Alien::FFI) instead.

# SEE ALSO

- [Alt](https://metacpan.org/pod/Alt)
- [Alien::FFI](https://metacpan.org/pod/Alien::FFI)
- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)
- [FFI::Raw](https://metacpan.org/pod/FFI::Raw)
- [FFI::CheckLib](https://metacpan.org/pod/FFI::CheckLib)

# AUTHOR

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
