Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7353482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Jul 2001 00:20:51 -0600 (MDT)
Message-Id: <200107140620.AAA28577@puffin.external.hp.com>
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] help debuging HMPC 
In-Reply-To: Message from rbrad@beavis.ybsoft.com (Ryan Bradetich)
   of "Fri, 13 Jul 2001 11:01:10 MDT." <20010713110110.A9795@beavis.ybsoft.com>
Date: Sat, 14 Jul 2001 00:20:00 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Hello parisc-linux hackers,
> 
> Now that I am starting to have time to devote on this port again, 
> I started to look into the HPMC crash when doing a cpio from the 
> scsi cdrom drive to a hard drive again.
...

I don't know what the problem is but I can help clarify some
of the issues below.

...
> This is the instruction that causes the HPMC (IAOQ address - 8):
> 	ldwa  r0(r26),r26

Given the IOAQ data below, I'm pretty sure GR26 is garbage.

Anyway, the IO port address is most likely still in GR24
since it's the third arg to dino_inX. The call to gsc_readX
won't (shouldn't) clobber that.


> My (limited) understanding of appropriate values for an address
> being passed to the _gsc_readl function would be an I/O address,
> which is >= 0xf0000000.  If my understanding is correct, then the
> C200+ is properly HPMC'ing because of the invalid I/O address.

That's right.
The arg to gsc_readX should be the address of Dino's PCI_DATA register.
That's what generates the IO Port cycle.

> To my surprise, I am not getting the expected values back even in the
> known indexes when I do the ser mr <addr> 5 in the boot menu after the
> HPMC.

That was a good idea!

> 	I grabbed the address from the system map and in this case:
> 	102db05c D rbrad_debug
> 
> 		Main Menu: Enter command > ser mr 0x102db05c 5

a500 console boot output shows:
| Segment 0 load 00100000 size 2163856 mediaptr 0x1000
| Segment 1 load 00312000 size 472144 mediaptr 0x212000
| Segment 2 load 00388000 size 302608 mediaptr 0x286000
| Segment 3 load 003d4000 size 16384 mediaptr 0x2d0000
| branching to kernel entry point 0x00100000

Not sure how to form the proper address from System.map.
I'd guess subtract 0x00100000?

> 		b. The address present in the IAOQ is not present in
> 		   the stack trace that is dumped.  The IAOQ value is:
> 		
> 			IAOQ: 102200d0 102207e4	

Do these values mean the CPU was branching?
Normally I expect them to be +4 apart.
But it suggests we executed the ldwa insn and trashed GR26
before the HPMC was recorded.

> 		and this is the stack dump range:
> 
> 			Dumping Stack from 10320000 to 10320a40:

The stack is just a temporary storage space for code to save registers.
IOAQ reflects the state of the CPU and has nothing to do with stack.

> 		running the astk command from the build-tools also does
> 		not show the dino_in32 or the _gsc_readl addresses in
> 		the stack trace either.

right - only time you'll see a function address (which was part
of the call chain) is when GR02 gets saved.
gsc_readX is a "leaf" routine and thus doesn't save GR02.
The last thing on the stack should be the caller to dino_inX().

> I have a bunch of files saved off in ~rbrad on p.e.h.c for people to look
> at if they are interested.

I'll take a look and see if anything obvious pops up...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
