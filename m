Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.net [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id BB684482A
	for <parisc-linux@parisc-linux.org>; Wed,  9 May 2001 07:03:35 -0600 (MDT)
Date: Wed, 9 May 2001 09:03:20 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] framebuffer drivers, sound
In-Reply-To: <20010509010244.S4917@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSO.4.33.0105090859500.29141-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

As long as it gets released eventually -- my guess is X isn't going
to be all that fast on a planar FB where you can only write
one planemask at a time and must use a BIOS call to switch
the planemask. :-)

--
Brian S. Julin

On Wed, 9 May 2001, Matthew Wilcox wrote:

> On Wed, May 09, 2001 at 02:00:12AM +0200, Andi wrote:
> > Yeah, the STI docs.... HP should release the hardware level
> > docs, this is the only way to implement a full featured fbdev
> > driver. A stifb would still be usefull since it is works for
>
> yeah, but right now we're all too busy working on important things
> (eg SMP, glibc, etc) to spend time looking for or sanitising this
> documentation.
>
> --
> Revolutions do not require corporate support.
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
