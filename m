Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA04874
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 21:29:49 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id 8153E441
	for <parisc-linux@thepuffingroup.com>; Sat,  2 Sep 2000 21:30:05 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id VAA17641 for parisc-linux@thepuffingroup.com; Sat, 2 Sep 2000 21:29:57 -0600 (MDT)
Date: Sat, 2 Sep 2000 21:29:57 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200009030329.VAA17641@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Boot error on C200+
List-ID: <linux-parisc.vger.kernel.org>

Bob Pflederer wrote:

> I see this on C180.  It goes away if you modify entry.S to use
> PA2.0-style tlb inserts instead of the PA1.1-style tlb inserts.
> Try the attached patch.  It modifies the tlb miss handlers at startup to
> use PA2.0 tlb inserts if you have a PA2.0 cpu.  PA-8000 docs claim
> that PA1.1 tlb inserts are not supported, so I suspect we're hitting
> a case that doesn't work.
>
> Would someone who has CVS write access be willing to commit this
> patch?  It's the last thing I need to make C180 work.

Please don't anyone do this.  I've got another fix in progress.  Bob is
correct that we shouldn't be using the PA1.1 inserts.  But he was fooled
by redundant code in trap_init(), thinking that we haven't gone virtual
yet.  Code in trap_init() sets the iva, but it should be removed (which I
will do).  We actually set the iva (and install a small set of mappings)
very early in real/head.S and go virtual before calling start_parisc().
We never run any C code in real mode.  Bob's patch means that we would
still run 1.1 inserts for a while, and then it would be patching the tlb
miss handlers WHILE THEY ARE POTENTIALLY BEING USED!

My fix will do a simple 3-4 assembly instruction test for PA2.0 in
head.S, and then install the appropriate iva. This wastes 2K of memory
having two iva's, but is a lot simpler to do in assembly very early
in the boot process. I'll try to get this done by Tuesday morning
(I work throughout the night Monday).

John Marvin
jsm@fc.hp.com
