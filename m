Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30846
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 May 2000 10:41:36 -0600
Received: from [129.250.38.64] (helo=dfw-mmp4.email.verio.net)
	by dfw-smtpout1.email.verio.net with esmtp (Exim 3.12 #7)
	id 12w68U-00076l-00
	for parisc-linux@thepuffingroup.com; Sun, 28 May 2000 16:41:58 +0000
Received: from users.qual.net ([209.57.253.2])
	by dfw-mmp4.email.verio.net with esmtp (Exim 3.12 #7)
	id 12w68U-0001By-00
	for parisc-linux@thepuffingroup.com; Sun, 28 May 2000 16:41:58 +0000
Received: from localhost (sammy@localhost)
	by users.qual.net (8.9.3/8.9.3) with SMTP id MAA22280
	for <parisc-linux@thepuffingroup.com>; Sun, 28 May 2000 12:41:57 -0400 (EDT)
Date: Sun, 28 May 2000 12:41:57 -0400 (EDT)
From: Sam Creasey <sammy@oh.verio.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.GSO.3.96.1000528115357.22599F-100000@users.qual.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] impending CVS commit
List-ID: <linux-parisc.vger.kernel.org>


It looks like I've gone a little overboard this weekend....  enough so
that I feel my commit requires more than just a CVS log, anyway....

1) I managed to fix the HPMC that's been plaguing me for months...  it
turns out that if an interrupt fires while the kernel stack is being setup
to handle a syscall, bad things happen....   Easy fix, interrupts are now
disabled during syscall entry and exit (doesn't seem to be any problem
once the stack's proper....)

2) I was forced to add save/restore for the FP registers..  Doing so
cleaned up much of the abarrant behavior I'd been seeing in userspace
from the kernel trashing fp regs.
On the downside, it adds 30-some instructions to each of the
syscall/interrrupt entry and exit points.  

The kernel won't come close to compiling with -mdisable-fpregs, so we
can't take the easy route of just storing them during a full context
switch.  There's likely room for some improvement that doesn't involve 32
64-bit stores all the time.  nonetheless, it at least provides an
astonishingly reliable userspace... 


Well, unfortunately that got me far enough to compile lmbench onto the
thing, which led to....

3) Writing the cache/tlb flush code..  It's "a little" zippier now...  And
seems to be equally as stable (tends to avoid randomly halting...  I've
not seen an HPMC in hours, as opposed to every 5 minutes).   pagefault
times improved by 1-2 orders of magnitude...   our context switch latency
is still what I would consider crappy, but I'm not sure what those times
are really supposed to be like on a machine without proper hardware
contexts...  

at any rate, I'll be checking in in a few minutes after I go over the
changes a bit more...  enjoy.


"UN-altered REPRODUCTION and DISSEMINATION of this IMPORTANT
Information is ENCOURAGED, ESPECIALLY to COMPUTER BULLETIN BOARDS."
	-- Robert E. McElwaine
