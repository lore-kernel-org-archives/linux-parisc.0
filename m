Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA13531
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 13:15:12 -0700
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by palrel3.hp.com (Postfix) with ESMTP id 3B4B8C86
	for <parisc-linux@thepuffingroup.com>; Fri,  3 Mar 2000 11:16:15 -0800 (PST)
Message-Id: <200003031910.LAA19111@lucy.cup.hp.com>
Subject: Re: [parisc-linux] lasi scsi driver
To: gyula_matics@hp.com
Date: Fri, 3 Mar 2000 11:10:58 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <006601bf8487$e057e010$a94abc0f@hungary.hp.com> from Gyula Matics at Mar "2," 2000 "09:42:50" pm
From: Jerry Huck <jerry_huck@hp.com>
Reply-To: huck@cup.hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: huck@cup.hp.com
List-ID: <linux-parisc.vger.kernel.org>

> From: "Gyula Matics" <gyula_matics@hp.com>
> To: <parisc-linux@puffin.external.hp.com>
> Date: Thu, 2 Mar 2000 21:42:50 +0100
> Subject: [parisc-linux] lasi scsi driver

> It's only half working. It can list the devices on the bus, but that's all.
> 
> It is not working because it needs a horrible amount of cache flushing
> and I still didn't get it right. (the committed code only contains enough
> flushing to pass the two debugging tests)
> 
> The scsi card is running code that is in the main memory and the driver
> is heavily patching that. The bigger problem is that the communication
> with the card is done via a mailbox also residing in the main memory
> and the driver is assuming that this mailbox is on a non-cacheable page.
> 
> I know that the architecture supports setting a page non-cacheable.
> My question is if it is possible / good idea to set the mailbox page
> to non-cacheable?
> 
> Gyula

While the PA-RISC processor architecture supports the notion of a
non-cacheable page, most HP memory systems do not - certainly not the
most recent memory systems.  If you set the U-bit on a main memory page
and then reference the page, the processor will emit a sub-cacheline
transaction and the memory system will do something bad (probably
HPMC).  Also, I can't find any architected interface that would let
you test if a memory page could be accessed uncacheable.

Even for IA-64, main memory systems do not have to support uncacheable
references.  A PDC-like mechanism - PAL/SAL/EFI - reports the
available memory ranges and gives the supported attributes.  In the
IA-64 case, the I/O system is coherent so you don't need any of the
cache flushing.  So don't ever get in the situation where you need
uncacheable main memory.

Jerry Huck
