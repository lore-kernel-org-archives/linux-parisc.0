Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09026
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 16:27:48 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 29 Aug 2000 22:27:51 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 29 Aug 2000 22:27:50 -0000
Date: Tue, 29 Aug 2000 17:23:08 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000829172308.A1032@vodka.thepuffingroup.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000823172320.E4060@linuxcare.com>; from Richard Hirst on Wed, Aug 23, 2000 at 05:23:20PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 23, 2000 at 05:23:20PM +0100, Richard Hirst wrote:
> It looks to me like all calls to flush_cache_range() are passed a user
> virtual address, except for those calls from arch/parisc/kernel/pci-dma.c
> where we pass kernel virtual addresses.

agreed.

> So perhaps flush_cache_range() should generate FIC/FICE/FDC/FDCE
> instructions with a space register of %sr3, and pci-dma.c should
> use some other method of flushing memory.
> 
> I was looking at the difference between FDC and FDCE; it seems FDC
> does address translation and FDCE does not, so should we use FDC
> really?  flush_cache_range() currently uses FDCE/FICE.

we should stop using FICE/FDCE/PDTLBE/PITLBE except in the `flush
entire cache' routines.  the definitions should be moved from cache.h
to cache.c.  No-one else should be given the opportunaity to use them.
They are too undefined.

> Helge Deller wrote some code in drivers/net/lasi_82596.c that plays
> with %sr1 and uses FDC, FIC, PDC, SYNC, and SYNCDMA.
> 
> Can someone tell me why include/asm/cache.h has no space register
> specified on fdce():
> 
> > #define fdce(addr) asm volatile("fdce 0(%0)" : : "r" (addr))
> > #define fice(addr) asm volatile("fice 0(%%sr1,%0)" : : "r" (addr))
> > 
> > #define pdtlbe(addr) asm volatile("pdtlbe 0(%%sr1,%0)" : : "r" (addr))
> > #define pitlbe(addr) asm volatile("pitlbe 0(%%sr1,%0)" : : "r" (addr))

My attempt at fixing this in a sane manner led me to create:

#define user_fdc(addr) asm volatile("fdc 0(%%sr3,%0)" : : "r" (addr))
(...)

and

#define kernel_fdc(addr) asm volatile("fdc 0(%%sr0,%0)" : : "r" (addr))
(...)

however, the resulting kernel wouldn't boot.  So let's take this a
step at a time and see how far we can go towards eliminating the *E
variants.  I've written a little rant on this suject which you can find
in linux-2.3/Documentation/parisc/mm.  feel free to ignore it if you want.

> ps. as you can see, I am learning as I go here, so all hints and
> clues are gratefully accepted!

Likewise!  BTW, I hear davem wrote a doc about this which is in
-test8-pre1 which may help somewhat.

-- 
Revolutions do not require corporate support.
