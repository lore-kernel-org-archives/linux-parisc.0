Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3962C4842
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 09:10:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mcnc-0006Rl-00
	for parisc-linux@parisc-linux.org; Thu, 27 Sep 2001 16:10:04 +0100
Date: Thu, 27 Sep 2001 16:10:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] what i did on my holidays
List-ID: <linux-parisc.vger.kernel.org>

i've been hacking on various random things; i don't have sufficient time
to commit everything properly (so i'll do it when i get back on monday),
but the curious can look at `all.diff2' in my homedir on pehc.  here's
a rough contents of the diff (in no particular order):

 * changes in support of card-mode dino
 * random spelling mstakes, documentation updates, etc
 * misc cleanups
 * convert ccio-rm-dma to the parisc_device interface.  it was annoying me.
 * change a lot of `void *' to `unsigned long' and remove casts.
 * rationalise function names & user messages

And much much more!

I haven't even tried compiling it since fixing up the cvs merge conflicts
with all the good work done in the last week or so.  Have fun...

-- 
Revolutions do not require corporate support.
