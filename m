Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA06428
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jul 2000 11:59:07 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Jul 2000 18:00:45 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Jul 2000 13:58:53 -0400
Message-ID: <8766q3uxpe.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PIC code generation in gcc/binutils
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan, other porters,

I'm at the point now (userland mostly works for me as does the 64-bit
toolchain) where I'd like to start working on the implementation of
ELF dynamic linking for hppa-linux.  Obviously the precondition for
this is a working PIC code model in GCC and binutils.

I was hoping to write up a preliminary ABI specification based on the
64-bit ELF implementation on HP/UX, so I've been trying to find
detailed specifications on how the ELF64 ABI actually works but so far
have not come up with much information from HP's documentation.  The
64-bit runtime architecture document has some useful information, but
I suspect I'll have to look at the actual implementation to nail down
the details.

One thing I am sure of is that if we try to follow the HP/UX ELF64
specification for dynamic linking on 32-bit Linux we are going to be
substantially different from other Linux/ELF platforms.  In
particular, the handling of inter-module calls and function pointers,
and the management of the GP, are done in a totally different way from
all the other platforms I've encountered (i386, m68k, alpha).
(i.e. inter-module calls are handled by another set of stubs, and GP
management is done by the caller via the function descriptors, rather
than by the callee with GPDISP and similar relocations)

This will potentially make implementing ld.so more difficult, and thus
I'm not sure how desireable it is to follow the 64-bit example; we
will never have to actually link and load HP/UX ELF binaries with our
native toolchain and dynamic linker, even when we do have support for
64-bit userland.

On the other hand following the ELF64 example *will* allow us to reuse
code (though the ELF64 PIC implementation in BFD appears to be still
somewhat incomplete) in binutils, so it looks like kind of a
binutils/ld.so tradeoff.

Thus I am playing a bit with adapting the ELF64 code to produce a
preliminary PIC-generating toolchain.  I don't, however, want to get
too far into this before knowing (a) what other people are working on,
and (b) what the implementation is going to look like.

Thoughts?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
