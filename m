Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id F27274837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 19:52:56 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f8R1qtY22889
	for parisc-linux@lists.parisc-linux.org; Thu, 27 Sep 2001 01:52:55 GMT
Date: Thu, 27 Sep 2001 01:52:55 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010927015255.A22878@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] More on my C360
List-ID: <linux-parisc.vger.kernel.org>

I was getting trace/breakpoint traps from my new 2.4.9-pa24 kernel
and it was suggested that I recompile the kernel for PA7100 (not 8000
as I had done before.)    I was unable to compile the kernel again
while running 2.4.9 so I had to boot the 2.4.0 kernel that was included
on the 0.92 CD.   When that kernel was running I was able to recompile
the 2.4.9 kernel again and it's now working much better.  Im now able
to compile things with out any (unusual) errors.

However, I again had a rather massive filesystem corruption on my root
filesystem after I had been running 2.4.0.  I had to manually run fsck
and answer "y" to 50 - 60 "fix?" questions.


-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
