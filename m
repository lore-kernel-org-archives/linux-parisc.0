Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3070F4A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 11:48:09 -0700 (MST)
Message-Id: <200102211850.KAA17436@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC 
In-reply-to: Your message of "Wed, 21 Feb 2001 11:11:41 PST."
             <20010221111141.H31164@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 21 Feb 2001 10:50:53 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> on PA, we have prefetch for read and prefetch for write.  They're encoded
> as loads to the 0 register.  prefetch read is ldd (load 64-bit quantity)
> and prefetch-write is ldw (load 32-bit quantity).
> 
> Off the top of my head, untested (and someone on the list please correct
> me if I'm wrong):
> 
> #define prefetch_read(addr) __asm__("ldd 0(%%sr0, %0), %%r0" : : "r" (addr))
> #define prefetch_write(addr) __asm__("ldw 0(%%sr0, %0), %%r0" : : "r" (addr))

Will assuming SR0 work for user space?
Will assuming SR0 work for zero-copy patch in the (near?) future?

"addr" has alignment restrictions. Not sure if you want
to encode those as runtime checks or not.

> i think these are only defined for PA 2.0, so we might need to be more
> clever than this.

My reading of the "PA 2.0 Enhancements" in the "PA-RISC 2.0 Architecture"
is pretty clear this is for PA2.0 CPU's only. #ifdef __LP64__ is needed.

I'd like to encourage use prefetching on bcopy/checksum type loops.
It will help perf *alot*.

grant
 
Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
