Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA24680
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Feb 2000 15:24:21 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id QAA12533
	for parisc-linux@thepuffingroup.com; Sun, 13 Feb 2000 16:22:06 -0500
Date: Sun, 13 Feb 2000 16:22:06 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000213162206.I9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] State Of The Port [2000/02/13]
List-ID: <linux-parisc.vger.kernel.org>


State of the Port

It's been a while since we put one of these out, so here goes:

 * Grant has contributed support for the C3000/J5000 and similar machines
   which have an I/O SAPIC.

 * A cast of thousands hacked on the Tulip (onboard DINO/IOSAPIC based
   machines) driver.  Eventually, Thomas persuaded it to work.

 * Sammy & Helge made LASI ethernet work.

 * Thomas massaged some C IP checksum code until it worked.  NFS now works!

 * Our kernel tree is currently based on Linux 2.3.42.  Michael
   Ang shepherded us through this merge with contributions from
   (alphabetically), Paul, Thomas, Grant, Philipp and Matthew.

   Naturally, Linus put out 2.3.43 within a few hours of the merge
   being completed.

 * Grant has also got some signs of life from the Symbios 896 

 * Martin fixed a console problem that made sash crash when using the
   serial console.

 * John Marvin has been working on Linux syscalls.

 * Sammy has a 32-bit ELF kernel booted [but hasn't committed the code
   yet, to give us enough time to get an ELF toolchain to everyone].

So what does it currently work on?

 * C3000/J5000 (no serial input yet)
 * A180
 * C360
 * 712

These are the machines developers are mainly using right now.
Other machines simply aren't being tested and may work anyway.

The future:

We'll try to stay more current with Linus' codebase.  On the other hand,
we don't want to be merging all the time.  The compromise we've decided to
try is to merge approximately once a month, depending on exactly what's
been changed.  2.3.43 breaks half the network drivers, so we don't want
to merge yet.  On the other hand, it does have the new `coherent DMA'
interface, which we will want to take advantage of.

We need to start thinking about moving the kernel to 64-bit ELF.
There are some places where we've assumed sizeof(long) == sizeof(int),
and some of the assembler needs changing.

We need to start working on making the system self-hosting.  That means
getting a C compiler running, porting glibc, etc.

Apologies to anyone or anything I missed.
