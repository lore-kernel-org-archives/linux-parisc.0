Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03527
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 09:13:02 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 16 Nov 1999 16:14:28 -0000
Subject: Re: [parisc-linux] depi?
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 16 Nov 1999 17:14:21 +0000 (GMT)
Cc: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
In-Reply-To: <19991116170819.B750@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 16, 99 05:08:19 pm
Content-Type: text
Message-Id: <E11nmBS-0002tz-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Advantages of mapping the kernel at 0xc000 0000 (or 0x8000 0000/0xe000 0000)
> 
>  - consistent with what the other ports do / what hardware does for the other
>    ports (MIPS)

Not consistent with what some other ports do however. That one is a non
valid argument.

>  - clear difference between user pointers and kernel pointers (this matters
>    for debugging, not for a running system)

You can stick your elf binaries at 0x80000000 for debugging

>  - clear difference between physical addresses and kernel pointers.  Think
>    about vmalloc for one reason this is a good thing.  Also I dislike the
>    idea of staring at HPMCs for hours just to find out what really happened
>    is someone forgot to set the D bit and we didn't notice until we happened
>    to hit a vmalloc area.

Phys = Virt can help you. Ultrasparc makes good use of tlb bypass bits for
this.

>  - allows us to catch NULL pointers and use large pages to map the physical
>    memory [1]

Only relevant for debug. Indeed on x86 with 4Mb maps enabled we dont do 
null catches in the same way

>  - is already implemented

True

>  - conflicts with a rather obscure restriction of PA1.1 cache aliases.  As
>    Frank pointed out to me, it is only guaranteed you access the same data
>    using a physical address and a virtual address mapped to the physical if
>    the physical address is equal to the virtual address (or you are flushing
>    the cache lines in question).  I do not believe this to be a real problem
>    with any existing hardware and if it is, the performance hit of the
>    additional cache flushes may be seen as proper punishment for brain-dead
>    hardware.

The goal is to make it work well. X86 is brain dead, thats why we do the 
3gig/1gig game with it. 

Alan
