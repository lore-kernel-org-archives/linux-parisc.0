Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA24893
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 10:33:36 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id E9701514
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 09:35:43 -0800 (PST)
Message-Id: <200011201734.JAA18526@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Mon, 20 Nov 2000 11:17:26 PST."
             <20001120111726.C5196@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 20 Nov 2000 09:34:31 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> sounds right.  MMIO should work now though, right?

It would have worked then too.
Changing it to use MMIO space would require disabling I/O Port space
by defining inb/outb locally to use gsc_readb/writeb.
My problem with doing that was the semantics are slightly different.
I/O Port space is non-postable and MMIO space is. I wasn't confident
a driver written to use I/O port space would work right under MMIO
though some certainly do.

...
> it was definitely a 32-bit kernel at the time.  It might be the same bug,
> but I'm not sure.

Can't be. AP (%r29) is a 64-bit only construct.
dhd also just confirmed it was 32-bit kernel.
I'll try it now.

...
> > We need to resolve this in order to merge upstream.
> > Matthew, any advice on how we should proceed?
> > Or would be easier for you pester Alan Cox and just get it fixed?
> 
> Hm.  Alan's not hacking on 2.4, last I heard.  I might pester Linus and
> see if we can change that.  It's a mechanical change so he might not be
> averse to it at this point.  Bear in mind we don't need to do a complete
> merge at this point -- most architectures have a separate patch to apply
> on top of Linus' tree.

Ok. What's the first step to getting arch/parisc* and include/asm-parisc*
into Linus's tree?

I had dinner with Bdale Garbee last night and one of two things he made
clear was we need to unfork from debian and linus's tree in order to move
forward. All our CVS branches need to become obsolete or "local sandboxes"
of the respective upstream partners. Feeding kernel bits upstream will
bring a new level of visibility (and *HELP*) to the parisc-linux port.

I totally agree with Bdale. I understand alot of work still needs to
happen in our tree (eg though sba_iommu.c works, it's current form sucks)
But pushing bits upstream to linus will not preclude us from doing that work.

I also find it odd that glibc is merged upstream *before* the kernel is.

For the record, the second issue bdale made clear was we need "boot
floppies" debian package working. We don't need more ISO images (no
offense to pjlahaie for his good work). "Boot floppies" is a pre-requisite
to becoming part of the next debian release. Given I still don't have
a clue how to build a debian package and I can still contribute alot
in other areas, it doesn't make sense for me to do it myself.


> > I'd be happy to fix this by clobbering the current version with what's in
> > linux-2.4.0-test10. But what is the "right" way to revert changes we've made
> > so this doesn't show up in next merge?
> 
> I don't know that there's an official way to do this.  I always changed
> the file to its previous state and then committed it.  There are a number of
> ways of doing it; perhaps the cleanest is:
> 
> cvs diff -r1.4 -r1.5 fs/nfs/read.c >../read.c.diff
> (then check the read.c.diff file)
> patch -p1 <../read.c.diff
> rm ../read.c.diff
> 
> or you can just delete the lines yourself.  Use diff to make sure there
> aren't any silly cosmetic changes (eg whitespace).

The part you described above is the easy part - np.
I'm worried about labels and tracking how we "name" the releases.
Mang or other CVS ninja's care to comment?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
