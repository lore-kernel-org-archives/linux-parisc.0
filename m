Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id C67F3482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 17:27:36 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA22497;
	Thu, 5 Apr 2001 09:27:32 +1000
Date: Thu, 5 Apr 2001 09:27:32 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010404234654.H9198@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0104050920520.13605-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: 64 bit kernel and module dp values again
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 4 Apr 2001, Richard Hirst wrote:

> On Wed, Apr 04, 2001 at 04:32:40PM +0100, Richard Hirst wrote:
> > Hi Alan,
> >   Code from drivers/block/loop.o, built as a 64 bit module, using
> > xc-20010307.tgz
> > 
> > The stub to call $$divU is called with the kernels dp value as that is
> > what dp is left with follwing the __muldi3 call.

Sorry Richard, I should have picked up on this when I saw you exporting
millicode from the kernel yesterday.  You basically can't do it, and for
the same reason you can't export millicode from shared libs.  As you've
found, dp gets trashed...

> Having pondered on this while walking the dog (in the dry!!),
> I think I need a new stub for calling millicode that doesn't
> use dp.
> 
> 	ldil L'sym,%r1
> 	ldo  R'sym(%r1),%r1
> 	bve (r1)
> 	nop
> 
> where sym is the address of the millicode fn in the kernel.
> 
> Sound reasonable to you?

Yes.  That's the sort of thing ld would have to do too if we want to
export millicode from shared libs.

Incidentally, this problem isn't limited to 64 bit.  32 bit modules will
have the same problem, with r19 being trashed when calling kernel
millicode.

Alan "modules are evil" Modra
-- 
Linuxcare
