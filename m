Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D34BF482A
	for <parisc-linux@parisc-linux.org>; Thu, 16 Aug 2001 18:30:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15XXWg-0000f4-00
	for parisc-linux@parisc-linux.org; Fri, 17 Aug 2001 01:30:14 +0100
Date: Fri, 17 Aug 2001 01:30:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20010817013014.H25133@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] 2.4.9 merge
List-ID: <linux-parisc.vger.kernel.org>

A few conflicts:

Documentation/parisc/mm got deleted -- we already did this.
Makefile -- obvious conflict
arch/parisc/hpux/fs.c -- off_t changes to loff_t; we added an extra param, which is why upstream's patch doesn't apply.
drivers/char/tty_io.c -- part of our tree got applied
drivers/net/lasi_82596.c -- looks like changes from our tree, someone should check this properly.
drivers/sound/Makefile -- probably trivial haven't looked properly
drivers/video/fbcon-sti.c -- hunk #2 has already been done.
drivers/video/sticon-bmode.c -- now irrelevant
drivers/video/sticore.c -- ditto

that's it.

-- 
Revolutions do not require corporate support.
