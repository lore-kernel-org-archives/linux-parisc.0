Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA28193
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Aug 2000 16:26:26 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Aug 2000 22:26:10 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 17 Aug 2000 18:25:37 -0400
Message-ID: <87ya1v1q5a.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Incompatibility of PIC and non-PIC
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Shared libraries work well, but we've got a bigger problem now.  Our
PIC and non-PIC code models are mutually incompatible in a big way
(due to the use of %r19 And, it seems, while it's fine if non-PIC
can't be used in shared libraries, it's not all right if PIC can't be
linked statically.

The reason this comes up is that libgcc.a has to be built with -fPIC
since it gets linked into libc.so.  However libgcc.a is also getting
statically linked with the binary itself (the symbols are not exported
by libc.so, though I'm not sure if this is the correct behaviour or
not), and of course it has to get linked in for statically linked
things anyway.

The result is of course that anything which uses 'long long', like,
say, GCC, will crash.

How do other architectures solve this issue? (or do they just have
ABIs that let you mix PIC and non-PIC...)

For that matter how does 32-bit HP/UX solve this issue?

One potential solution is to use %dp as the data pointer across the
board (which would solve the problem of mixing PIC and non-PIC in
static binaries), and generate export stubs for shared library calls
which restore the old %dp value (which would solve the problem of
maintaining the non-PIC %dp, useless though it may be).

<thinking wishful="wishful">
  Another one is to ditch our ... ahem ... unique ABI, use function
  prologues instead, have a single global pointer and a single link
  register, and have PIC, function pointers and dynamic linking work
  the way $DEITY intended :-)
</thinking>

Of course that's a lot more work and would probably involve breaking
the published ELF standard for HPPA, such as it is, as well as
foregoing a lot of code sharing with the rest of the PA-RISC stuff in
gcc and binutils :-(

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
