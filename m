Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87885482A
	for <parisc-linux@parisc-linux.org>; Sat, 19 May 2001 21:15:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 151JgM-0007ef-00; Sun, 20 May 2001 04:15:02 +0100
Date: Sun, 20 May 2001 04:15:02 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
Message-ID: <20010520041502.K23718@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk> <20010508205244.P4917@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010508205244.P4917@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, May 08, 2001 at 08:52:44PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

The list is getting shorter, and I believe we don't have any regressions
versus glibc 2.2.1 at this point.  Don't install the glibc 2.2.3 we have
in CVS, by the way.  It is missing necessary patches which are errata to
glibc 2.2.3.  These patches are not installed in our CVS tree to reduce
the amount of work when generating a new diff for the debian package.

I'd really appreciate some help with either of the problems in the
Misc section.

Floating-point
--------------

 * Some of the math/ tests fail in the same way they did with glibc-2.2.1.
 * stdlib/strtold fails.  This is due to our long double being 64 bit and
   glibc thinks its 128 bit.  Bug #119
 * misc/tst-efgcvt fails.  (Maybe another long double problem?)

Threads
-------

 * linuxthreads/ex15 fails sometimes.  I'm working on it.  (probable
 kernel bug)

Dynamic Loading
---------------

 * dlfcn/default fails.  Not sure whether the test is making an
   unwarranted assumption here or whether we have a bug.
 * The following tests in the elf/ directory fail:
	resolvfail constload1 vismain neededtest neededtest2
	neededtest3 neededtest4 lateglobal
   Not investigated.  Probably most of these are the same bug.

Misc
----

 * posix/globtest fails.  Haven't investigated.
 * gmon/tst-sprofil fails.  Looks like it needs to be ported to Linux/hppa.

-- 
Revolutions do not require corporate support.
