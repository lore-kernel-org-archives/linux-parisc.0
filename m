Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA22775
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 12:20:11 -0500
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id JAA17501
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 09:19:59 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id JAA18711 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 09:18:52 -0800 (PST)
Message-Id: <199903251718.JAA18711@milano.cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Qn on PA-RISC Page tables and TLB 
In-reply-to: Your message of "Wed, 24 Mar 1999 23:10:36 PST."
             <Pine.LNX.3.96.990324225944.502B-100000@quark.ix.netcom.com>
Date: Thu, 25 Mar 1999 09:18:51 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kumar wrote:
...
> 	Other interesting point to note is that PA-RISC does not
> 	define how many entries in the table etc. Very much unlike
> 	x86.

The CPU pdir can vary in size. For a HW walker, it must be allocated
in physically configuous memory, this pretty much fixes the size
once it's setup.

The size of the CPU PDIR is determined mostly by memory size, amount
of I/O space required (Legacy PA requires memory mapped I/O), and
some fudge factor. Sizing it to allow a HW walker find all physical
mappings is good for performance. I assume this also helps SW TLB
handlers by reducing hash collisions. However, I'm not the expert
on CPU pdir.

K, C-class, and T600 also have an I/O pdir. This is only useful for
systems with more than 4GB (3.75GB?) of physical memory since PA
(and current PCI devices) can only use 32-bits of addressing.
The I/O pdir size depends on how much I/O one wants to allow mapped
at any given time and it too must be physically contigous.
16/th to 8th of physical memory seems to be a pretty good rule of thumb.

For now, I would say ignore the I/O pdir until hppa-linux has a
login prompt. If the OS doesn't use the I/O pdir, it just implies
the DMA is not coherent with Processor activity - just like on
an x86 box. I haven't studied Linux I/O subsytem enough to know
where/how to integrate support for an I/O pdir. I hope the HP-UX
docs released help explain this - search for keyword "CDIO".

grant
