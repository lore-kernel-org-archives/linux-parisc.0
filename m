Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A99914A19
	for <parisc-linux@parisc-linux.org>; Sun, 18 Mar 2001 13:42:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14ek0M-0008GW-00; Sun, 18 Mar 2001 20:42:22 +0000
Date: Sun, 18 Mar 2001 20:42:22 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] semaphore problem
Message-ID: <20010318204222.B24811@parcelfarce.linux.theplanet.co.uk>
References: <20010316062549.H22875@parcelfarce.linux.theplanet.co.uk> <20010317023431.F21079@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010317023431.F21079@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sat, Mar 17, 2001 at 02:34:31AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 17, 2001 at 02:34:31AM +0000, Matthew Wilcox wrote:
> On Fri, Mar 16, 2001 at 06:25:49AM +0000, Matthew Wilcox wrote:
> > 
> > as i suspected, the pipe problem was a semaphore problem.  here's how
> > it works:
> 
> OK, I've redesigned the semaphore code on the whiteboard.  Here's how it
> works.

The theoretical design doesn't seem to be buggy, but the implementation
was, alas.  Fortunately, the bug would only show up with semaphores that
allowed multiple accesses simultaneously.  Here was the situation:

sema_init(2);
P1 down()  2 ->  1
P2 down()  1 ->  0
P3 down()  0 -> -1
P1 up()   -1 -> -2
P2 up()   -2 -> -3
P3 wakes up and sets -3 -> 0
P3 up()    0 ->  1

and we've lost one of the slots.

the rewrite makes P3 set -3 to 1 when it wakes up, so we don't lose a slot.

> This allows us to implement wakeup stealing if we want.  Unsure about

i noticed it now will steal wakeups.  Ah well.  We probably want to do
that anyway.

-- 
Revolutions do not require corporate support.
