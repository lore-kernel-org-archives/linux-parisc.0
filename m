Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4179D4841
	for <parisc-linux@parisc-linux.org>; Sun, 29 Jul 2001 14:16:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Qwyu-0003E7-00
	for parisc-linux@parisc-linux.org; Sun, 29 Jul 2001 21:16:08 +0100
Date: Sun, 29 Jul 2001 21:16:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010729211608.B5493@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] 2.4.7 merge
List-ID: <linux-parisc.vger.kernel.org>

Grant's found a good excuse to move up to 2.4.7, so let's try to do that
this week.  Paul, are you around to do the CVS stuff?  An initial `apply
the 2.4.7 patch to my tree' merge attempt shows 4 fails -- the expected
one in Makefile; arch/parisc/kernel/ptrace.c, drivers/char/serial.c and
drivers/scsi/sym53c8xx_defs.h.  I can see how to fix the ptrace & serial
conflicts; Richard says the sym53c8xx_defs conflict is also trivial,
so I don't anticipate any major problems.

-- 
Revolutions do not require corporate support.
