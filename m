Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA01183
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 10:25:00 -0600
Received: from user39-39.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.39.39)
  by mailserv2.iuinc.com with SMTP; 23 Aug 2000 16:24:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 86E31B005; Wed, 23 Aug 2000 17:23:20 +0100 (BST)
Date: Wed, 23 Aug 2000 17:23:20 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000823172320.E4060@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87n1i5wabx.fsf@linuxcare.com>; from dhd@linuxcare.com on Tue, Aug 22, 2000 at 12:05:06PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 22, 2000 at 12:05:06PM -0400, David Huggins-Daines wrote:
> Richard Hirst <rhirst@linuxcare.com> writes:
> 
> > We just blindly assume addresses passed to flush_page_range() are
> > kernel virtual addresses, but in this case I guess they are user
> > process virtual addresses.
> 
> Right.  I noticed that the FIC/FICE/FDC/FDCE instructions have a space
> register field.  I wonder if we should be explicitly specifying %sr3,
> since that's what we use (ahem, what we *WOULD* use if <asm/uaccess.h>
> were actually implemented) to access user space.
> 
> Are PA-RISC caches indexed with the space ID as well as the offset?
> Do we need to flush kernel virtual addresses at all?

I should have said flush_cache_range() above, not flush_page_range().

It looks to me like all calls to flush_cache_range() are passed a user
virtual address, except for those calls from arch/parisc/kernel/pci-dma.c
where we pass kernel virtual addresses.

So perhaps flush_cache_range() should generate FIC/FICE/FDC/FDCE
instructions with a space register of %sr3, and pci-dma.c should
use some other method of flushing memory.

I was looking at the difference between FDC and FDCE; it seems FDC
does address translation and FDCE does not, so should we use FDC
really?  flush_cache_range() currently uses FDCE/FICE.

Helge Deller wrote some code in drivers/net/lasi_82596.c that plays
with %sr1 and uses FDC, FIC, PDC, SYNC, and SYNCDMA.

Can someone tell me why include/asm/cache.h has no space register
specified on fdce():

> #define fdce(addr) asm volatile("fdce 0(%0)" : : "r" (addr))
> #define fice(addr) asm volatile("fice 0(%%sr1,%0)" : : "r" (addr))
> 
> #define pdtlbe(addr) asm volatile("pdtlbe 0(%%sr1,%0)" : : "r" (addr))
> #define pitlbe(addr) asm volatile("pitlbe 0(%%sr1,%0)" : : "r" (addr))


Richard

ps. as you can see, I am learning as I go here, so all hints and
clues are gratefully accepted!
