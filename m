Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED307485D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Sep 2001 11:54:39 -0600 (MDT)
Date: Sun, 23 Sep 2001 13:55:50 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nfsroot login problems on 720/50
Message-ID: <20010923135550.B1512@megatonmonkey.net>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net> <20010922015609.A14166@dogbert.localdomain> <20010922125826.C6488@megatonmonkey.net> <20010923160005.A30607@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010923160005.A30607@dogbert.localdomain>; from fullung@ilink.nis.za on Sun, Sep 23, 2001 at 04:00:05PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> 
> What if it is a rw,no_root_squash export? Or does the Debian initscript
> not support remounting the nfsroot rw? Or is it a limitation of the
> Linux kernel?
>  

Think about it ... rw nfsroot... multiple machines booting from that nfsroot.
Guess what happens?

Normally, when setting up a diskless system, each node will have their
own special area to write logs and setup temporary files.

> rcS(13): unaligned access to 0x0007dca3 at ip=0x0005d807
> Unaligned handler failed, ret = -1 INIT: Entering runlevel: 2
> <4>rc(16): unaligned access to 0x0007dca3 at ip=0x0005d807
> Not-handled unaligned insn 0x0cd31200
> Unaligned handler failed, ret = -1 <4>rc(17): unaligned access to
> 0x0007dca9 at 
> ip=0x0005db23
> Not-handled unaligned insn 0x0f131200
> Unaligned handler failed, ret = -1

I'm not sure how you are going to go about updating that root tarball.
(Rebuild it by hand?)

Though, the unaligned problems seem to be a big cause of your problems.
The 712's and 715's don't spew unaligned errors. I'm not sure what
processor the 720 has, and what might be the special cases.

Someone else on the list might better answer this.
Actually... the website has an HCL.

"Currently, most of the unlettered 700-series workstations (eg 712/715/735)"

Doesn't list the 720. Wonder why?

c. 
