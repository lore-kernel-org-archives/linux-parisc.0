From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Mon, 11 Aug 2008 18:51:58 +0300
Message-ID: <20080811155158.GA21292@cs181140183.pp.htv.fi>
References: <20080811104643.GA3338@cs181140183.pp.htv.fi> <20080811145652.100E74E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: grundler@parisc-linux.org, kyle@mcmartin.ca, matthew@wil.cx,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, bdale@hp.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080811145652.100E74E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 11, 2008 at 10:56:51AM -0400, John David Anglin wrote:
> > On Sun, Aug 10, 2008 at 06:10:15PM -0600, Grant Grundler wrote:
> > > On Sun, Aug 10, 2008 at 05:11:59PM +0300, Adrian Bunk wrote:
> > > > On Sat, Aug 09, 2008 at 06:55:11PM -0600, Grant Grundler wrote:
> > > ...
> > > > > Someone from HP needs to ACK this patch since I believe HP funded the code
> > > > > changes made during the parisc-linux port. This should be a no-brainer
> > > > > and I expect Bdale Garbee can quickly take care of this.
> > > > 
> > > > Either the file is available since the beginning under the terms of the 
> > > > GPLv2 (or a compatible license that can be reduced to GPLv2) or it's 
> > > > addition to the kernel was a huge mistake.
> > > 
> > > As a former HP employee who was one of the several parisc-linux developers,
> > > I'm certain the intent was to release this as GPL. That's why I said
> > > "this should be a no-brainer".
> > > 
> > > However, it's still HP's (and not my) right to assert that.
> > 
> > If it wasn't already 100% clear that the file was released under
> > the terms of the GPLv2 (or a compatible license that can be reduced
> > to GPLv2) at the day when it was included into the kernel something
> > went horribly wrong back then.
> > 
> > Otherwise HP would have the situation SCO was desperately searching for...
> 
> This file was included before the SCO situation arose.  The copyright
> notice is similar to most.  Checking 2.6.22.19, I see that more than
> half the .c files lack MODULE_LICENSE("GPL") lines.

MODULE_LICENSE() has nothing to do with the SCO case.

As the name already indicates it is only for modules (it doesn't make 
sense in built-in code) for showing that a module has a licence that is 
compatible with the GPL (all other modules are legally somewhere between 
fishy and illegal).

>...
> The whole licensing issue for the linux program and modules,
> particularly for individual files, appears to be a mess.  The
> COPYING file is vague on the licensing for files.   The recommended
> wording suggested by the FSF isn't used.  I can't see that adding
> MODULE_LICENSE("GPL") lines is going to help much.
> 
> There are several GPL licenses and versions.  The line isn't
> going to mean much to a lawyer.  I really think each file should
> be specific about its licensing in words that can be clearly
> understood.

The toplevel COPYING file of the kernel sources contains the exact 
licence text for all files (including binfmt_som.c) in the kernel.

Even if the wording suggested by the FSF is not used in all files it's 
clear that the kernel is under the GPLv2, and there isn't any serious 
doubt that if a file like binfmt_som.c was not under a GPLv2 compatible 
licence but built into a GPLv2'ed kernel the resulting image couldn't be 
legally distributed.

Does anyone involved with code going from HP to the Linux kernel 
seriously think that there is code for which it isn't 100% certain
that it was made available under the GPLv2?

> Dave

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

