Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailb.telia.com (mailb.telia.com [194.22.194.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02B044A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Mar 2001 14:56:54 -0700 (MST)
Message-Id: <200103062156.WAA06037@zaphod.halden.lillfab.se>
Date: Tue, 6 Mar 2001 22:56:46 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] TODO-list entry of "HIL keyboard driver needs  u
 pdating"
To: Alex deVries <alex@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3AA3C40A.C3D320FC@linuxcare.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On  5 Mar, Alex deVries wrote:

> I'm Alex.
> 
> The reason that I think I have HIL specs is because it's mentioned in
> the WAX documentation I have under NDA.  I can't send out copies of it,
> but I can give information necessary for writing code.

Does this include the WAX EISA bridge? 

In that case I have a few questions to you... I hope you don't mind.

First about different WAXes...

There seems to be two major versions here

- one with sversion 0x76 which is found on ASP based machines (715/old,
           730, 735, 750, 755) 

- one set of two with sversions 0x8e and 0x90 which are found on LASI
           based machines where the one with sversion 0x90 is the 
           EISA BA. 
           These seem to be found on the 715/new, 725, some B, C, D, J
           and R-class machines) 

How are these tow WAX EISA BA's different? Do you know?

1) About interrupts.

How are they implemented?
- If I assume that the interrupt controller is like a ASP or LASI with
the following registers, am I right, then?

#define OFFSET_IRR 0x0000   /* Interrupt request register */
#define OFFSET_IMR 0x0004   /* Interrupt mask register */
#define OFFSET_IPR 0x0008   /* Interrupt pending register */
#define OFFSET_ICR 0x000C   /* Interrupt control register */
#define OFFSET_IAR 0x0010   /* Interrupt address register */

If so how are the interrupts numbered is bit 0 irq 0 or 15 or?

How is the interrupt connected upwards? IRQ line 23 on the ASP is
labeled EISA is this where WAX EISA interrupts go? 

2) On I/O regions

I thinks that there are two I/O regions in the WAX EISA: one for port
I/O which seem to start at the hpa+0 and then a second one (for MMIO i
suppose) which starts at 0x100000 if this is a EISA bus address or
host linear address I don't know.

Question is: what do the docs say?

I guess I need to do something with MMIO so that ioremap() and 
virt_to_bus() work as expected. 
 
I guess I can not count of this thing being DMA coherent on a 715/old?

It seems from the existing source that there should be a version
register at 0x7000 but it seems to read 0xffff on my machine...


Best Regards, 

Daniel
-- 
