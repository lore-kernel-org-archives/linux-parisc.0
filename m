Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 126C64A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 21:39:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14OuU4-0001GX-00
	for parisc-linux@lists.parisc-linux.org; Sat, 03 Feb 2001 04:39:36 +0000
Date: Sat, 3 Feb 2001 04:39:36 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010203043936.G26452@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] STI broken on head
List-ID: <linux-parisc.vger.kernel.org>

I've got a 712 heer which I'm now bootin in STI console, cos I want to get
rid of the nasty PDC hack.

However, the current CVS head dies when calling

        ret = STI_CALL(sti->init_graph, &default_init_flags, &inptr,
                &outptr, sti->glob_cfg);

sti->init_graph is 0x01f88808 which seems plausible, but it's also the
IAOQ when we die.

of course, when using STI console, you're not using serial console, so i
don't get a log of the break.

why are we calling STI routines in real mode?  i haven't seen anything
to suggest this is required in the docs yet.

-- 
Revolutions do not require corporate support.
