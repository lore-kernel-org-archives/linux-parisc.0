Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id D90AC482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 22:54:16 -0600 (MDT)
Date: Wed, 17 Oct 2001 00:55:49 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new glibc dpatch
Message-ID: <20011017005549.C11826@megatonmonkey.net>
References: <20011017004218.K15532@parcelfarce.linux.theplanet.co.uk> <20011017001453.A11826@megatonmonkey.net> <20011017053549.A22885@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017053549.A22885@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Oct 17, 2001 at 05:35:49AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > 
> > =====
> > --- glibc22-hppa.dpatch	Tue Oct 16 20:52:02 2001
> > +++ glibc22-hppa.dpatch.mw	Tue Oct 16 21:05:27 2001
> > @@ -1135,7 +1135,7 @@
> >       unsigned int npages;		/* # of pages to allocate */
> >   #ifdef _LIBC_REENTRANT
> >  -    volatile int lock;
> > -+    __atomic_lock_t lock;
> > ++    static __atomic_lock_t lock = __ATOMIC_LOCK_INIT;
> >       sigset_t full_sigset;
> >   #endif
> >       /* the next to members MUST be consecutive! */
> > =====
> 
> I'm not sure what meaning static would have in this context.  It doesn't
> have to be initialised because every arch other than PA defines an
> unlocked lock to be 0.  If it gets initialised, it gets put in .data
> (instead of .bss), even if you're initialising it to 0.  Stupid, I know.
>

My bad. The entire struct is defined as static.
The static identifier was to prevent external modifcation of the value.
However since it's encased in a "static struct local" it's not an issue.

True. Any initialized value needs to be shipped into .data, and we
begin to see some ugly .data bloat (even if the user is just specifying
zero anyway...)


I think I'm going to get some sleep now ... to many "my bad" in one 
day ^__^;;;

c.
