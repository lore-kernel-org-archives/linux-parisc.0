Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33B2A4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 11:01:32 -0700 (MST)
Message-Id: <200102201803.KAA16465@milano.cup.hp.com>
To: dkennedy <dkennedy@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?) 
In-reply-to: Your message of "Mon, 19 Feb 2001 11:49:48 PST."
             <Pine.LNX.4.21.0102191120150.28002-100000@localhost.localdomain>
Date: Tue, 20 Feb 2001 10:03:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

dkennedy wrote:
> In the X86 architecture the IO space and the memory space are logically 
> separate.  They are both accessed physically on the same bus but to
> access IO space you have to execute an IO instruction.

Same thing is true for PCI. The CPU instructions to generate I/O port
or MMIO space transactions differ in the details.

> So, why have two separate spaces?  Some of the reasons are:
> - to be different from Motorola
> - to provide a mechanism to add delays for IO while still keeping
>   memory fast (relatively speaking).

- have more address space for RAM
  (ie not used for I/O space; think 16-bit)

> Why do we care about ISA?  Well, EISA was designed to support both ISA
> and EISA cards (in the same slot) so theoretically someone could want
> to put an ISA card into a PA-RISC box.

I'm not sure we can support ISA devices on parisc.
I thought HPUX does not. Anyone know?

> Does any of the above ramblings actually help?

I've learned a few things I didn't know before.
Not sure it helped with the current discussion.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
