Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BD484A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 20:54:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14OXJC-000306-00
	for parisc-linux@lists.parisc-linux.org; Fri, 02 Feb 2001 03:54:50 +0000
Date: Fri, 2 Feb 2001 03:54:50 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010202035450.D32691@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] 2.4.1 demerged
List-ID: <linux-parisc.vger.kernel.org>

i've demerged 2.4.1 from the tree.  i've tagged this as LINUS_241_DEMERGE.
this was created by:

cvs up -D"2001-01-30 12:00"
cvs tag LINUS_241_PREMERGE
cvs up -A
cvs up -jLINUX_241_DEVEL -jLINUS_241_PREMERGE
	(no conflicts)
(build it, check it works, etc)
cvs ci
cvs tag LINUS_241_DEMERGE

from now on, i'm merging all linus' versions onto a branch first and
giving it a ?week? before merging them onto the trunk.  of course, for
this to work, you'll all have to promise to at least try it.

-- 
Revolutions do not require corporate support.
