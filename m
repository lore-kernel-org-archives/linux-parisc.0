Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 147B4482B
	for <parisc-linux@parisc-linux.org>; Sat, 12 May 2001 19:15:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14ykTi-0001qQ-00
	for parisc-linux@parisc-linux.org; Sun, 13 May 2001 02:15:22 +0100
Date: Sun, 13 May 2001 02:15:22 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] broken toolchain?
List-ID: <linux-parisc.vger.kernel.org>

as some of you know, i'm busy up here in canada building packages.
it seems to me that i'm getting a lot more unaligned data references from
things that I build than I was last week.  Also I'm getting unaligned
data references from glibc 2.2.3 that i'm building on gsyprf11 which i
never had on jagu.  I did an apt-get update on gsyprf11 and I remember
binutils getting updated, so I'm tempted to blame that.  can anyone else
confirm/deny problems?

-- 
Revolutions do not require corporate support.
