Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bender.bawue.de (bender.bawue.de [193.197.13.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E26D482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 13:34:22 -0600 (MDT)
Received: from gate.ixs.com (pC19F803F.dip.t-dialin.net [193.159.128.63])
	by bender.bawue.de (Postfix) with ESMTP id 3FFA448640
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 21:33:54 +0200 (CEST)
Received: from localhost (andreas@localhost)
	by gate.ixs.com (8.9.3/8.9.3) with ESMTP id VAA29790
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 21:33:39 +0200
Date: Mon, 23 Apr 2001 21:33:39 +0200 (CEST)
From: Andreas Thienemann <andreas@thienemann.net>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with glibc
In-Reply-To: <20010422202057.Y18464@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.10.10104232132120.18481-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

On Sun, 22 Apr 2001, Matthew Wilcox wrote:

> Yes, I was getting it too.  After my recent kernel checkin to fix the
> stat64 struct, I was able to build glibc successfully.  My theory is that
> glibc was trying to call the *stat64 syscalls and the kernel was happily
> writing all over user memory.

> I would be grateful if you updated your (running) kernel to head of
> CVS and tried building glibc again.
Jepp. That did it. glibc was just build successful.
But you wouldn't believe how long it took on that system. Just 101MHz..

But thanks for the advice.
Now back to my quest on installing linux from  scratch. ;)

bye,
 andreas
