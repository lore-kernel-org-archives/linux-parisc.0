Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA5D6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:09:58 -0600 (MDT)
Date: Fri, 21 Sep 2001 12:10:56 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] testandset
Message-ID: <20010921121056.D25803@megatonmonkey.net>
References: <20010921113700.A25803@megatonmonkey.net> <20010921164239.C27323@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921164239.C27323@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Sep 21, 2001 at 04:42:39PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > I'm sitting scratching my head becaues the ./sysdeps/hppa/dl-fptr.c
> > is peppered with testandset, which used to be in pt-machine.h,
> > but is now called try_lock within pt-machine.h
> 
> um, the hppa.dpatch definitely does patch this.  perhaps you were
> overzealous with trimming the ia64 part of the patch?
>

Hrm. Maybe. I remember cutting out only the ia64 part.
I'll zip through the patch again.

<carlos goes to check>

Hrm. Time to start vaping source trees.
The only diff from the patches is the ia64 stuff. Which I've
fixed to use try_lock, so it's not necc anymore.

I am now sure that I've been using the dpkg tools incorrectly.
I will follow the steps you've outlined and do some more reading.

Thanks for the help M.

Cheers,
c. 
