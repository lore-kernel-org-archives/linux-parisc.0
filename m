Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBEB548B4
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 11:27:23 -0600 (MDT)
Date: Sat, 29 Sep 2001 13:27:19 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-atomic __set_bit
Message-ID: <20010929132719.A15266@megatonmonkey.net>
References: <20010924021054.I3025@megatonmonkey.net> <20010929020915.A24794@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010929020915.A24794@dogbert.localdomain>; from fullung@ilink.nis.za on Sat, Sep 29, 2001 at 02:09:15AM +0200
List-ID: <linux-parisc.vger.kernel.org>

> Hello,
> 
> Is this going into CVS any time soon? It seems to work fine on my
> 720/50.
> 
> Regards,
> 
> Albert
> 

Albert,

Have you booted a devfs kernel on you box?
Does it seem to function properly?

Adding devfs to my kernel causes some odd stuff to go on after
trying to enter INIT. Though I haven't had time to sort it out.
The kernel boots fine, but probably one of the startup scripts
is doing something decidedly wrong.

Since you are using init=/bin/sh, and unless you tell devfs
to explicitly mount at boot, you won't _really_ be using 
devfs :)

Sure, it compiles... and it looks like it should work.
But theory and practice are so different it's not funny.

<Carlos looks back at the RF Amplifier design he has on the
whiteboard and chuckles>

c.

> 
> > parisc,
> > 
> > Walking the source for devfs and thinking about Alberts problem.
> > 
> > Would the non-working devfs be fixed by adding:
> > 
> > Non-atomic versions of set_bit e.g. __set_bit 
> > and test_and_set_bit e.g. __test_and_set_bit
> > to linux/include/asm-parisc/bitops.h?
> > 
> > I have the latest CVS linux module.
> > I've patched against that. It compiles now ;)
> > (god bless make -j8)
> > 
> > I'm currently sleepy, but I'll post the patch, and test
> > it tommorow on a 712/60 and 715/50.
> > 
> > c.
> 
> <patch snipped>
