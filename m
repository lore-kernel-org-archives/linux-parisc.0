Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE82648C3
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 10:29:58 -0700 (MST)
Date: Mon, 5 Jan 2004 12:21:46 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20040105172146.GE23782@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Dear list-members,

A new year is here and it's time to look back and say, hey, we did a
great job, hacked on many things and made parisc a better port!

============
GNU/binutils
============

Maybe someone can comment on this? Randolph was great enough to remove
silly ltp relocations from static binaries. Without the loader running
the ltp is never read from the DT_PLTGOT dynamic entries... so it just
made sense to translate these into dp relative relocations. dlopen from
static binaries still doesn't work, minor problem really.

I know that hppa is not really multi-arch? We have to have two separate
binaries to do 32 and 64-bit work. Someone want a project? :)

======
GNU/cc
======

jda, you're the best person to talk about how gcc is doing. I can build
kernels with 3.3.3, sadly with the anon cvs down it's messed up my usual
workflow when it comes to testing.

jda, you mentioned that the libstdc++ testsuite could be examined in
order to fix some of our failures.

============
GNU/debugger
============

Our gdb has no visibility upstream. I'm taking a hiatus from glibc to
fix gdb. I volunteered for this like 2 years ago, but glibc took a long
time to fix.

===============
ELF64 Userspace
===============

32-bit versus 64-bit signals are fixed. Along with ucontext and siginfo.
A good project might be for someone to implement the set/get/make/swap
context calls in userspace, takers are welcome! I will *not* be working
ELF64 yet, without a working gdb it's quite hard to do *anything*. I
just recently learned how to poke insns into binary files for
debugging... it's not as much fun as you think ;)

I need to do similar signal hacking for ia64 or upstream may never
accept my linux/kernel/* patches. Worst-case has us absorb the changes
into our arch directory and nobody else benefits from the framework :(

============================
Kernel<->Usrspace Atomic ops
============================

Will work on these whilst I hack gdb. Expect a first cut in a month or
so.

========
GNU/libc
========

I'm here to speak on behalf of the userspace work we have done. Glibc is
in *much* better shape than before, a year ago there were so many errors
I didn't know where to begin. Our current list of failures is down to:

make[2]: *** [/glibc-work/build-hppa/math/test-float.out] Error 136
make[2]: *** [/glibc-work/build-hppa/math/test-double.out] Error 1
make[2]: *** [/glibc-work/build-hppa/math/test-ifloat.out] Error 136
make[1]: *** [math/tests] Error 2

These three tests are related to the fact that we don't have long double
supported properly. Waiting on HP to release the code. An alternative is
a long double with only 64-bits, though this would be the *last* thing
on the list of userspace problems to fix (it would cement our long
double ABI at 64-bits).

make[2]: *** [/glibc-work/build-hppa/stdlib/tst-strtod.out] Error 1
make[2]: *** [/glibc-work/build-hppa/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2

Same issue, no long double support, so string to double fails.

make[2]: *** [/glibc-work/build-hppa/dlfcn/tststatic.out] Error 139
make[1]: *** [dlfcn/tests] Error 2

The value of an address is interpreted as a function descriptor and
erroneously loads the wrong stuff during the jump. This will require a
bit more work to track down the particular PLABEL32 or IPLT relocation
causing the problem.

The trickiest bugs to remove were all those symbol visibility bugs,
which weren't related to symbol visibility at all. Infact due to our
erroneous function pointer implementation we were skipping all ld.so.1
COPY relocations. I ported hppa over to use the generic function
descriptor code and was finally able to process all of ld's COPY relocs.
I have no idea if this was ever a problem for symbols other than
_r_debug. Gdb may benefit from this.

Profiling is fixed thanks to Randolph! And I just completed the required
changes to get sprof working for shared libraries. I can finally enable
*other* people to track down elusive performance problems in shared
library code.

Aside from that we are no longer in danger of losing glibc, a few more
patches and upstream will be synchronized! I think Ulrich might be
growing to accept me as the hppa maintainer :)

Cheers,
Carlos.
