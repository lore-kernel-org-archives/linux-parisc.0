Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id EAA21951
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 04:18:27 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13xoww-0001ys-00; Mon, 20 Nov 2000 11:17:26 +0000
Date: Mon, 20 Nov 2000 11:17:26 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Message-ID: <20001120111726.C5196@parcelfarce.linux.theplanet.co.uk>
References: <20001118072454.C30151@parcelfarce.linux.theplanet.co.uk> <200011200744.XAA18214@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011200744.XAA18214@milano.cup.hp.com>; from grundler@cup.hp.com on Sun, Nov 19, 2000 at 11:44:42PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Nov 19, 2000 at 11:44:42PM -0800, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > On Tue, Nov 14, 2000 at 09:35:01AM -0700, Paul Bame wrote:
> > ok, here's my memories.
> 
> Thanks Matthew!
> 
> hehe...sounds like someone's getting older. :^)

... when i were a lad, all this were fields!  Our dad used to kill us
every morning, we'd get up half an hour before we went to bed and walk
uphill both to and from school...

> ...
> > >      * drivers/net/eepro100.c: no clue about this one
> > 
> > we were trying to get it to work for the Jan NYLWE show.
> 
> I think I did that. IIRC, it's a one-line change to use I/O port
> space since MMIO wasn't usable without more invasive changes.

sounds right.  MMIO should work now though, right?

> > i doubt we have any changes of note.  does anyone have an eepro in an hp?
> 
> I have picked nearly 30 i82557/i82558 PCI cards from scrap yard.
> And maybe a few i82559 even. Did you need one (or two)? :^)

Heh, I only have a 712 right now :-)

> FWIW, this is the card/driver which I think was causing misaligned
> data reference traps. I never had a chance to followup with this though.
> At the time, I thought it would be *really* fun to show this working
> to HP's marketing team...

Oh yes, I remember that now.  Tulip always does a copy (well, it doesn't _have_
to, but we tell it to, just like the Alpha does).

> > >      * fs/nfs/read.c: probably unnecessary hack for broken parisc64 gcc
> > 
> > we certainly don't want to send it upstream, but we don't want to take it
> > out until the bug is fixed.  is fixing that bug on the webshite todo list?
> 
> I don't think so. It's possible it's already fixed.
> 
> Relevant CVS log entry:
> | revision 1.5
> | date: 2000/07/18 03:15:25;  author: dhd;  state: Exp;  lines: +5 -0
> | ARGH!  When I put in an assertion, NFS stops breaking randomly.  I
> | suspect this is a compiler or binutils problem but I can't see any
> | clear differences in the generated code.  I'll debug it later...
> 
> This sounds like the hppa64 bug we saw with %r29 getting trashed.
> But I don't think David was working on hppa64 kernel at the time.
> I can test 32-bit NFS Root tomorrow w/o assertion if no one else
> beats me to it.

it was definitely a 32-bit kernel at the time.  It might be the same bug,
but I'm not sure.

> > >      * include/linux/init.h: we use different section names -- why????,
> > >        probably some unnecessary other differences too
> > 
> > because we use -ffunction-sections.  text.init clashes with a function
> > called init, and the linker just merges it into the text segment.  we
> > need it to be separate, so it became init.text.  there's patches around
> > to do this for other architectures too.  just bad naming choices initially.
> 
> We need to resolve this in order to merge upstream.
> Matthew, any advice on how we should proceed?
> Or would be easier for you pester Alan Cox and just get it fixed?

Hm.  Alan's not hacking on 2.4, last I heard.  I might pester Linus and
see if we can change that.  It's a mechanical change so he might not be
averse to it at this point.  Bear in mind we don't need to do a complete
merge at this point -- most architectures have a separate patch to apply
on top of Linus' tree.

> > >      * include/linux/wait.h: parisc debugging -- should be removed
> > 
> > yeah, that can die now.
> 
> I'd be happy to fix this by clobbering the current version with what's in
> linux-2.4.0-test10. But what is the "right" way to revert changes we've made
> so this doesn't show up in next merge?

I don't know that there's an official way to do this.  I always changed
the file to its previous state and then committed it.  There are a number of
ways of doing it; perhaps the cleanest is:

cvs diff -r1.4 -r1.5 fs/nfs/read.c >../read.c.diff
(then check the read.c.diff file)
patch -p1 <../read.c.diff
rm ../read.c.diff

or you can just delete the lines yourself.  Use diff to make sure there
aren't any silly cosmetic changes (eg whitespace).

-- 
Revolutions do not require corporate support.
