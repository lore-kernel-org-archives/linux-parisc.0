Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22501
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Feb 2000 12:37:38 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id E941155
	for <parisc-linux@thepuffingroup.com>; Wed, 16 Feb 2000 13:38:15 -0500 (EST)
Message-Id: <200002161838.KAA07528@milano.cup.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Virtual mapping of IO cards 
In-reply-to: Your message of "Wed, 16 Feb 2000 08:25:17 PST."
             <200002161525.IAA14558@udlkern.fc.hp.com>
Date: Wed, 16 Feb 2000 10:38:05 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
...
> Virtually mapping the card doesn't help with HPMC's caused by dma buffer
> mismanagement (i.e. the card causes the HPMC while mastering the bus).

But it generally helps one tell the difference.

> 
> Drivers for memory mapped register only cards, i.e. cards without any
> type of onboard memory (i.e. framebuffers, script memory, etc.) are
> not very likely to ever run into a bug of this type, since register
> pointers are usually set up once and never changed.

Agreed. "not very likely" and "never" are not the same. When bringing
up new drivers, it is in fact more likely than for a mostly working
driver. So while I agree with the statement, I don't agree with the
conclusion.


> In my experience, the majority of HPMC's have been caused by VM errors.

That's cuz you work mostly on VM! :^)

For me, it's been mostly device driver bugs (drivers loosing DMA addresses)
and some I/O MMU code bugs.

> Then comes the two cases mentioned above (card not responding, dma
> errors).  In my experience, the majority of driver page faults were caused
> by memory references (i.e. mismanaging memory buffers), not IO space
> references.

Agreed.

> I can't say I've ever seen a driver page fault bug (i.e. one
> that would have HPMC'd in the current Linux implementation) that was
> caused by the driver mismanaging a pointer to its virtually mapped card
> space.  That is my experience.  YMMV.

I have. The driver control structure got corrupted.
I've worked on so many memory corruption problems.
I can't imagine debugging them if an errant driver were
scribbling in real mode to random places in memory.
AFAICT, the whole point of virtual mode is to avoid this.

> What percentage of the bugs that are caused by a driver mismanaging a
> pointer to its card space would be significantly helped by page faulting,
> rather than HPMC'ing? Although an HPMC can be delayed, I've found in
> the majority of the cases it was either right on, or one instruction off.

Very small. But I am still convinced it's worth it.

AFAIK, the processor can only HPMC if a LOAD times out.
What about processor STORE?

I know stores to I/O devices which have "gone fatal" will complete.
I don't know about stores to "unused" I/O space (no device response).
I assume stores to physical memory while in real mode will complete too.
I'd really like to avoid that. Stores from virtual mode are likely
to data page fault (not always) while in real mode I had the impression
they never would. Is this correct?

> 
> I'm not trying to argue against virtually mapping the card (although I
> would be all for avoiding mapping a large graphics frame buffer in the
> kernel address space). I just want to be sure we do it for the right
> reasons.

ok. Fair enough.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
