Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77DA34A19
	for <parisc-linux@parisc-linux.org>; Fri, 16 Mar 2001 19:34:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14e6Y3-000678-00; Sat, 17 Mar 2001 02:34:31 +0000
Date: Sat, 17 Mar 2001 02:34:31 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] semaphore problem
Message-ID: <20010317023431.F21079@parcelfarce.linux.theplanet.co.uk>
References: <20010316062549.H22875@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010316062549.H22875@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Fri, Mar 16, 2001 at 06:25:49AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 16, 2001 at 06:25:49AM +0000, Matthew Wilcox wrote:
> 
> as i suspected, the pipe problem was a semaphore problem.  here's how
> it works:

OK, I've redesigned the semaphore code on the whiteboard.  Here's how it
works.

The `count' variable is initialised to N for N simultaneous accesses.
A value of 0 indicates there are no processes waiting.  A value of -1
indicates there are processes waiting.  Each up() increments the count by
1 if non-negative.  if negative, it _decrements the count.  So we can
distinguish between the following cases:

 N : N more processes allowed in
 0 : no new processes allowed in, none waiting
-1 : processes waiting, no wakeups in flight
-N : N - 1 wakeups in flight

This allows us to implement wakeup stealing if we want.  Unsure about
starvation issues in that case.  Think about two processes; process A
down down() up() down() up() very frequently.  process B does a down().
do we want to switch to B the next time A does an up()?  or do we want
A to steal B's wakeup?

i shan't implement it now, but it's something to consider.

-- 
Revolutions do not require corporate support.
