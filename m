Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bender.bawue.de (bender.bawue.de [193.197.13.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15458482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Apr 2001 07:20:56 -0600 (MDT)
Received: from gate (pC19F1D1E.dip.t-dialin.net [193.159.29.30])
	by bender.bawue.de (Postfix) with ESMTP id 8DD5C4828C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Apr 2001 15:20:31 +0200 (CEST)
Received: from localhost (andreas@localhost)
	by gate (8.9.3/8.9.3) with ESMTP id PAA30834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Apr 2001 15:22:08 +0200
Date: Thu, 19 Apr 2001 15:22:08 +0200 (CEST)
From: Andreas Thienemann <andreas@thienemann.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.10.10104191518560.30090-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Clock skew problems
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I finally got my HP9000D to work with yesterdays CVS snapshot.

But now I'm havving problems with the clock.
I'm using the basplus-20010404.tar.gz as my NFS root and set
/etc/localtime /etc/timezone to point to
/usr/share/timezone/Europe/Berlin.

So far so good.

Then I set the clock to my current date, and run a 'hwlock --systohc
--utc'.

Just as usual.

But now, when I try do compile some software I'm having problems.

I'm getting the following message from make:

make: *** Warning: File `libdb.a' has modification time in the future
(2001-04-19 15:15:33 > 2001-04-19 15:15:04)

And I have absolutely no Idea why this is happening.

Thanks for any advice,
 andreas
