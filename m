Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78DA44A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 15:09:38 -0700 (MST)
Message-Id: <200102232212.OAA21472@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] parisc64 vs kernel64 
In-reply-to: Your message of "Fri, 23 Feb 2001 08:58:15 PST."
             <20010223085815.B16261@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 23 Feb 2001 14:12:22 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> I wonder if we're doing this right, having parisc and parisc64 as
> different architectures.

How much is driven by how gcc/binutils/config.guess type stuff works?

> They're fundamentally similar than sparc/sparc64
> or mips/mips64 are.  We have very few files in parisc64 (the rest are
> made visible to the build system by creating symlinks to their equivalent
> in parisc).

We've made an effort to keep them the same. That's why most of the
files are common. The fact that PA2.0 cpus can run PA1.1 kernel bits
makes it easy for us. I'm *know* the R4000 MIPs processor had
good backwards compatibility between 32/64-bit - don't know about
later ones or Sparc/Sparc64.

> them with something like:
> 
> make config
> [...]
> *
> * Processor type and features
> *
> Processor family (PA1.1, PA2.0, PA2.0Wide) [PA1.1] 

The Processor family selection is a good idea regardless of
how arch/parisc* source is organized.

> i think it might make maintenance easier,

The difference here is negligible. The main issues are from people
not (able to?) testing both 32 and 64-bit kernels before committing.


> i think this current situation is the worst of both worlds
> in that it's quite easy to forget about parisc64 when fiddling with
> something in the parisc directory.

I disagree.
That particular issue is the same for all three directory layouts.
Perhaps you have trouble with the current model as I might with a
different one.

I think the do_links model is a good compromise and we should
stick with it a bit longer. We know more now than when the do_links
model was created. In the future, I'm inclined to support a move
to a parisc/kernel64 layout if we are confident things like 64-bit
userspace, ccNuma (eg SuperDome), CPU Hotswap, Memory Hotswap, New
CPU models, etc (just a few things I've seen on customer wish lists)
are supportable within that framework.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
