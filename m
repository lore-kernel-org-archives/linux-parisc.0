Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9CAAD482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 13:52:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14xDXI-0007wB-00; Tue, 08 May 2001 20:52:44 +0100
Date: Tue, 8 May 2001 20:52:44 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
Message-ID: <20010508205244.P4917@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sat, May 05, 2001 at 03:34:57AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

An updated version of the list.  There's plenty of opportunity for people
to help with this.

Floating-point
--------------

 * Some of the math/ tests fail.  pb is looking into these.
 * stdlib/strtold fails.  This is due to our long double being 64 bit and
   glibc thinks its 128 bit.  Bug #119
 * misc/tst-efgcvt fails.  (Maybe another long double problem?)

Threads
-------

 * linuxthreads/ex10, ex15 & ex17 fail.  I'm working on these.
 * rt/tst-aio4 fails.  I'm working on this one too.

Dynamic Loading
---------------

 * all the tests in dlfcn/ fail.  I haven't investigated these.
 * elf/resolvfail and elf/constload1 fail.  Not investigated.  Probably other
   tests in elf/ also fail.

Misc
----

 * grp/testgrp fails.  This is a generic glibc 2.2.3 problem, the fix
   is available from upstream.
 * posix/globtest fails.  Haven't investigated.
 * gmon/tst-sprofil fails.  Looks like it needs to be ported to Linux/hppa.

-- 
Revolutions do not require corporate support.
