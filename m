Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.net [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 75AE8482A
	for <parisc-linux@parisc-linux.org>; Fri, 27 Apr 2001 19:42:31 -0600 (MDT)
Date: Fri, 27 Apr 2001 21:42:25 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.BSO.4.33.0104272113170.23478-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] advice? (kernel thread vs other mechs for HIL)
List-ID: <linux-parisc.vger.kernel.org>

So I have to make a decision as to the MLC (core HIL) driver --
it seems kernel threads are being highly spoken of lately, and using
a kernel thread would make things simple as far as locking,
because if I'm right, as opposed to an assortment of tasklets
I can start a kernel thread, have it put itself to sleep waiting on a
semaphore, and then just "press the button" with the semaphore from
an IRQ handler, timer, or I/O request from a usermode HIL device driver.
Questions:

1) How cumbersome are they to the CPU -- is using a kernel thread
for this overkill (the MLC driver does rely heavily on timeouts
and has a complicated state machine, if that's enough to justify it,
but it could conceivably be done in smaller peices.)  For each
MLC controlled by the driver (I'm writing it for more than one,
just for laughs) entries into the driver could be maybe a hundred per
second.

2) As long as truly time sensitive work (of which there is little
for a real MLC because the HIL seems well designed with a FIFO that will
never overflow if you use it right, but if someone were faking an
MLC with a UART for some reason there could be some) is taken care
of by a quicky immediate task, is response time of a kernel thread
good enough for mouse/keyboard use?

I do see they are being used for some pretty heavily accessed stuff,
but I figured since there are quite a few wizard's reading mail here I'd
ask just to be sure.

--
Brian S. Julin
