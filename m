Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 644B0482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Oct 2001 13:23:24 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id cmmdiaaa for parisc-linux@parisc-linux.org; Wed, 17 Oct 2001 12:18:44 -0700
Date: Wed, 17 Oct 2001 12:23:13 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011017122313.C4123@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc update
List-ID: <linux-parisc.vger.kernel.org>

glibc 2.2.4-3 has been uploaded to Debian's incoming direction and
should be installed in today's archive run.

it was lightly tested by lamont and myself before upload... please do
report any problems you find.

note that after i sent out my email yesterday about glibc, we ran into
some other obstacles... 

1. the glibc i uploaded is actually built with a fairly old binutils
(version 2.11.90.0.7-2.0.1). There could well be many binutils bug fixes 
since then, but at least for this case it lets us build glibc without 
the segfaults we see with the newer binutils

2. the newest binutils (2.11.92.0.5-3), also in incoming, doesn't appear
to address the glibc build issue as i originally thought. we still get
ld.so segfaults as Carlos has observed earlier. Perhaps someone (Carlos,
Alan, Rob?) can look at the binutils changes since then can see what
broke?

3. with the glibc build (using old binutils) some of the linuxthreads
tests are failing. in particular there's one case where it seems to get
into a deadlock. i left it running overnight and it's still stuck ... 
i don't know if this has always been broken though.

Build logs for #3 and #2 above can be found at:

#3: http://people.debian.org/~tausq/glibc.build.log2
#2: http://people.debian.org/~tausq/glibc.build.log5

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
