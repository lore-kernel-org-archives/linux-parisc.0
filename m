Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A209248AC
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  1 Feb 2004 16:18:33 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AnQhp-0003DX-00 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 01 Feb 2004 18:08:45 -0500
Date: Sun, 1 Feb 2004 18:08:45 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040201230839.GA10328@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Update] glibc 2.3.2 bug free on hppa.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


pa,

As of today the last glibc bug was fixed:

- Statically linked executable SIGSEGV's when calling dlopen. (FIXED)

As far as I'm concerned glibc has zero bugs, not counting the fact that
we don't yet have a long double implementation.

I know the gentoo crowd is always interested in the lastest set of
patches, so here goes:

http://www.parisc-linux.org/~carlos/glibc-hppa-patches-2004-02-01.tar.gz

At the moment you need a patched gcc in order to build a correct
userspace, I'm trying to fix this so you don't have to:

http://www.parisc-linux.org/~carlos/gcc-3.3.2-fptr.diff

Lite-Recipe for running test-suite:
(a) Download gcc 3.3.2 source.
(b) Patch with fptr.diff from above.
(c) Build gcc 3.3.2
(d) Download glibc cvs head.
(e) Patch with glibc patches from above.
(f) Build glibc with the gcc from (c).
(g) Run glibc testsuite "make -k check" using gcc from (c).
(h) Look for errors "grep 'Error' test-result.log"

I'll start focusing most of my time fixing gdb now :)

Background tasks:

- debian-glibc support.
- Send glibc patches upstream.

I'll be looking for a helper if someone wants to look into new
regressions as they arrive? Usually just building upstream with the
above patches, and checking that we didn't regress is good enough.
I imagine I could automate that... or rather someone else could? :)

Foreground tasks:

- atomic kernel ops
- review gettimeofday, and possible speedups.
- review time code in the kernel.
* gdb support upstream <- Highest foreground priority.

Thanks for all the help guys! Randolph for making me read the cffc code
and figure out what I did wrong, that fixed "last_bug-1". Richard had me
thinking about debian-installer and what would happen if you ripped out
the PLT of the executable, this lead me to fix "last_bug." :)

So.... who wants to setup an automated glibc builder? :}

Cheers,
Carlos.
