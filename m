Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA16199
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 00:43:37 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id AAC97639
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 23:45:49 -0800 (PST)
Message-Id: <200011200744.XAA18214@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Sat, 18 Nov 2000 07:24:54 PST."
             <20001118072454.C30151@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 19 Nov 2000 23:44:42 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Tue, Nov 14, 2000 at 09:35:01AM -0700, Paul Bame wrote:
> ok, here's my memories.

Thanks Matthew!

hehe...sounds like someone's getting older. :^)

...
> >      * drivers/net/eepro100.c: no clue about this one
> 
> we were trying to get it to work for the Jan NYLWE show.

I think I did that. IIRC, it's a one-line change to use I/O port
space since MMIO wasn't usable without more invasive changes.

> i doubt we have any changes of note.  does anyone have an eepro in an hp?

I have picked nearly 30 i82557/i82558 PCI cards from scrap yard.
And maybe a few i82559 even. Did you need one (or two)? :^)

FWIW, this is the card/driver which I think was causing misaligned
data reference traps. I never had a chance to followup with this though.
At the time, I thought it would be *really* fun to show this working
to HP's marketing team...

> >      * fs/nfs/read.c: probably unnecessary hack for broken parisc64 gcc
> 
> we certainly don't want to send it upstream, but we don't want to take it
> out until the bug is fixed.  is fixing that bug on the webshite todo list?

I don't think so. It's possible it's already fixed.

Relevant CVS log entry:
| revision 1.5
| date: 2000/07/18 03:15:25;  author: dhd;  state: Exp;  lines: +5 -0
| ARGH!  When I put in an assertion, NFS stops breaking randomly.  I
| suspect this is a compiler or binutils problem but I can't see any
| clear differences in the generated code.  I'll debug it later...

This sounds like the hppa64 bug we saw with %r29 getting trashed.
But I don't think David was working on hppa64 kernel at the time.
I can test 32-bit NFS Root tomorrow w/o assertion if no one else
beats me to it.

> >      * include/linux/init.h: we use different section names -- why????,
> >        probably some unnecessary other differences too
> 
> because we use -ffunction-sections.  text.init clashes with a function
> called init, and the linker just merges it into the text segment.  we
> need it to be separate, so it became init.text.  there's patches around
> to do this for other architectures too.  just bad naming choices initially.

We need to resolve this in order to merge upstream.
Matthew, any advice on how we should proceed?
Or would be easier for you pester Alan Cox and just get it fixed?

> >      * include/linux/wait.h: parisc debugging -- should be removed
> 
> yeah, that can die now.

I'd be happy to fix this by clobbering the current version with what's in
linux-2.4.0-test10. But what is the "right" way to revert changes we've made
so this doesn't show up in next merge?

I'll need to know this in order to revert the fs/nfs/read.c change as well.

thanks,
grant


Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
