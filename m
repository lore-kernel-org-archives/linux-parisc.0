Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA05564
	for <parisc-linux@puffin.external.hp.com>; Sun, 28 Jan 2001 21:11:27 -0700
Message-Id: <200101290417.UAA25622@milano.cup.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] The new kernel 
In-reply-to: Your message of "Sat, 27 Jan 2001 03:48:52 PST."
             <3A723714.F271D06C@esiee.fr>
Date: Sun, 28 Jan 2001 20:17:33 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> Hi all,
> 
>         Xavier and I made 2 differents kernels of the new CVS: Ok for
> B132 but our 712 dies after saying:
> Firmware does not allow selection of default wide mode
> 
> Just after branching to kernel

The kernel does not emit that msg and it only attempts
the call pdc_psw_get_mask() for __LP64__ code.
(see arch/parisc/kernel/setup.c:init_per_cpu())
I just recently added that for CONFIG_SMP stuff.

OTOH, palo will attempt to make that PDC call for 64-bit kernels.
But that's not new code. See ipl/pdc_misc.c.
And it prints the above msg when (PDC_PSW, PDC_RETURN_MASK) is invoked
but wide_mode bit is clear (ie not available).

I also believe you didn't try the same kernel on the B132 as on the 712.
Otherwise, I'm pretty sure it would have given the same error.
As you probably know, "wide mode" is only supported on PA2.0 CPU's
and both systems you tried have PA1.1 (PXC-L or L2).

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
