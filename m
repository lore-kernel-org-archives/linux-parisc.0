Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58A0B482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 20:35:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vruL-0004iC-00
	for parisc-linux@parisc-linux.org; Sat, 05 May 2001 03:34:57 +0100
Date: Sat, 5 May 2001 03:34:57 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] glibc 2.2.3 make check status
List-ID: <linux-parisc.vger.kernel.org>

I'm not sure people actually ran make check against glibc 2.2.1, so I don't
know how this compares.  Maybe 2.2.3 just has more tests than 2.2.1 did...

I'd love some help on this.  Really.  check the merge_GLIBC_CVS_20010424
branch out of CVS, configure it, make, then make check, and you'll start
hitting failures.  I've indicated the ones I've investigated.

 * all the tests in math/ fail.  pb knows what these problems are.

 * stdlib/strtold fails.  This is due to our long double being 64 bit and
   glibc thinks its 128 bit.  Bug #119

 * all the tests in dlfcn/ fail.  I haven't investigated these.

 * grp/testgrp fails.  This is a generic glibc 2.2.3 problem, the fix
   is available from upstream.

 * posix/testchmod fails.  This is due to a kernel bug in strncpy_from_user.
   Bug #118

 * posix/globtest fails.  Haven't investigated.

 * io/test-utime fails.  Looks like a stat problem.

 * misc/tst-efgcvt fails.  (Maybe another long double problem?)

 * gmon/tst-sprofil fails.  Looks like it needs to be ported to Linux/hppa.

 * linuxthreads/ and rt/ all hang.  I'll look at this.

 * elf/resolvfail and elf/constload1 fail.  Not investigated.  Probably other
   tests in elf/ also fail.

-- 
Revolutions do not require corporate support.
