Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67AAA482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Aug 2001 22:01:58 -0600 (MDT)
Received: from localhost (djweis@localhost)
	by oliver.internal.sjdjweis.com (8.9.3/8.9.3) with ESMTP id XAA02383
	for <parisc-linux@lists.parisc-linux.org>; Sun, 5 Aug 2001 23:06:37 -0500
Date: Sun, 5 Aug 2001 23:06:37 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0108052251390.1710-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] more serial console problems on D310
List-ID: <linux-parisc.vger.kernel.org>

I grabbed the 20010704 kernel source and net booted my d310 with it
combined with the ramdisk from the 0.9.2 install image. I start with the
serial console on the serial connector labeled "serial console". Output
only comes through there until the kernel starts, then I have to switch
over to the other serial port on the machine to see the rest of the boot
messages. They come quickly until the root filesystem is mounted. It looks
like I lose interrupts after that because everything is written in blocks
of 16 characters with long (15 second?) pauses in between blocks. After
getting this message:
VFS: Mounted root (ext2 filesystem).
serial console detected.  Disabling virtual terminals.

the cursor just tabs along the screen by itself without printing
anything. 

Any ideas? Why is the first serial port not being detected/used?

dave


-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
