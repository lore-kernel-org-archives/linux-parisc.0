Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA01723
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Dec 1999 14:36:50 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id QAA31288
	for parisc-linux@thepuffingroup.com; Fri, 31 Dec 1999 16:39:30 -0500
Date: Fri, 31 Dec 1999 16:39:30 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991231163930.C12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linux version numbers
List-ID: <linux-parisc.vger.kernel.org>


Grant asked me to explain Linux kernel version numbering, so here goes:

Linux version numbers are of the form a.b.c.  a.b is a line of
development; so far we've had 0.99, 1.0, 1.1, 1.2, 2.0, 2.1, 2.2 and 2.3.
The .c indicates a release in that line of development.

When b is odd, it signifies that this is a _development_ kernel.  Major
overhauls are made, sometimes without warning.  Not all development
kernels boot or even compile.  Their purpose is to distribute major
changes to the development community in the fastest way possible.
Some people run development kernels on their machine as a matter of
course.  They either know what they're doing and are actively debugging
it or they are 3l33t k1dd13z who think it's cool to run the kernel with
the highest version number available.

Kernels which have an even `b' are stable kernels.  The rate of change
is much much slower, and the changes which are accepted are those
which do not change the behaviour of the kernel core, or are necessary
to fix bugs.  New drivers and new architectures can be added to stable
kernels, provided they don't impact the stability of the overall kernel.
The emphasis here is on making a product that is usable.

You will also see other kernel versions around.  Linus frequently puts
out prereleases like 2.3.35pre3 which are available for really dedicated
testers and so that people can test the validity of big merges they've
done with him.  For example, the 2.3.35pre1 release was for davem to
check that Linus had done the sparc64 merge right.

Alan has done a series for 2.2 where he adds features which Linus
doesn't want to add.  A typical example number would be 2.2.10-ac3.
Some people have imitated this scheme, but it's discouraged for people
to distribute mega-patches as it makes it hard to merge with Linus.

As far as `who is in charge' questions go, Linus always manages the
development branch.  He maintained 2.2 up to 2.2.10 (or thereabouts),
before he passed responsibility over to Alan.  Alan has a fetish for
stable kernels, and maintained 2.0 from 2.0.36 to 2.0.38 before getting
busy with 2.2 and passing 2.0 over to David Weinehall.  Alan also worked
on 1.2.13 fixes for a while, but this is ancient history now :-)

How is Linux/PA-RISC going to fit in?  The current thinking seems to
be that we _need_ page colouring and some other features that impact
the core kernel code.  It's too late in 2.3 development to have these
changes integrated.  It's _probably_ too big a change to go into 2.4
(though I have been surprised at some of the changes which have gone
into 2.2), so I think we'll be merged with the official kernel during
2.5 development.  We will maintain our own patch-set against 2.4 and 2.5,
just as mips, ppc, sparc, m68k and arm have done with 2.2 and 2.3.

This assumes the next stable kernel will be called 2.4.  It could be 3.0
or 9.6 for all I know :-)
