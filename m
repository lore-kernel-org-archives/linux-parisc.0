Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BDDF4A19
	for <parisc-linux@parisc-linux.org>; Sat, 24 Feb 2001 22:04:21 -0700 (MST)
Message-Id: <200102250507.VAA22545@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc64 vs kernel64 
In-reply-to: Your message of "Sat, 24 Feb 2001 20:42:37 PST."
             <20010224204237.A22753@parcelfarce.linux.theplanet.co.uk>
Date: Sat, 24 Feb 2001 21:07:17 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> Ralf had two teams of people pulling at him -- one was the embedded
> MIPS people who wanted to keep everything simple and small, and the other
> was SGI who wanted 64-bit, SMP, scalability.  So MIPS vs MIPS64 is also a
> tradeoff between make-it-small and make-it-fast.

Ok. Internally, HPUX had a similar conflict along different lines:
	workstation vs server


> The changes between PA-RISC and PA-RISC64 really aren't as major.

That's true. We depend alot on the compiler to do most of the work so far.
Future work is to identify locations where the compiler isn't doing
a good enough job for a particular arch.

> There aren't many places we could remove cruft by guaranteeing
> we're omitting certain types of processor.

Agreed.

> It would almost certainly make sense to have a `parisc1.0' architecture
> if someone were crazy enough to do that :-)

or V-class. But a "parisc/kernelSPP" directory might be sufficient.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
