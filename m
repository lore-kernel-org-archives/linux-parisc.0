Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hoteldns02.stsn.com (p99.usslc13.stsn.com [208.32.226.99])
	by dsl2.external.hp.com (Postfix) with ESMTP id 609634A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Mar 2001 01:51:01 -0700 (MST)
Received: from linuxcare.com ([10.80.192.240])
	by hoteldns02.stsn.com (8.11.0/8.11.0) with SMTP id f278oJq19248;
	Wed, 7 Mar 2001 01:50:20 -0700
Sender: adevries@hoteldns02.stsn.com
Message-ID: <3AA5F8AB.A75EEB2B@linuxcare.com>
Date: Wed, 07 Mar 2001 04:00:27 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: 5116@telia.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] TODO-list entry of "HIL keyboard driver needs  
 updating"
References: <200103062156.WAA06037@zaphod.halden.lillfab.se>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> Does this include the WAX EISA bridge?

Yeah, it's the WAX ERS.  It has a Qtip on the front page.

> In that case I have a few questions to you... I hope you don't mind.

Not at all, I'm happy someone with coding time is asking them. I'm in a
hotel room in a different country than my docs, but I'll be reunited
with them in a crushing airport scene on Friday, hopefully.

> First about different WAXes...
> There seems to be two major versions here
> - one with sversion 0x76 which is found on ASP based machines (715/old,
>            730, 735, 750, 755)
> - one set of two with sversions 0x8e and 0x90 which are found on LASI
>            based machines where the one with sversion 0x90 is the
>            EISA BA.
>            These seem to be found on the 715/new, 725, some B, C, D, J
>            and R-class machines)
> How are these tow WAX EISA BA's different? Do you know?

My understanding is that one of them is the bridge portion of WAX, the
other is all the other WAX devices like HIL and RS232. It actually
doesn't much matter so long as we load the right driver based on the
right signatures.  I had thought I'd done that in the driver already.

And yes, the WAX does have RS232 ports, and it looks like the 715/new
machines have one serial port on Lasi, the other on WAX.

> 1) About interrupts.
> 
> How are they implemented?
> - If I assume that the interrupt controller is like a ASP or LASI with
> the following registers, am I right, then?
> 
> #define OFFSET_IRR 0x0000   /* Interrupt request register */
> #define OFFSET_IMR 0x0004   /* Interrupt mask register */
> #define OFFSET_IPR 0x0008   /* Interrupt pending register */
> #define OFFSET_ICR 0x000C   /* Interrupt control register */
> #define OFFSET_IAR 0x0010   /* Interrupt address register */
> 
> If so how are the interrupts numbered is bit 0 irq 0 or 15 or?
> 
> How is the interrupt connected upwards? IRQ line 23 on the ASP is
> labeled EISA is this where WAX EISA interrupts go?

I'll dig this up, I do have that info.

I tried to trigger interrupts, but never actually got this going.

> 2) On I/O regions
> 
> I thinks that there are two I/O regions in the WAX EISA: one for port
> I/O which seem to start at the hpa+0 and then a second one (for MMIO i
> suppose) which starts at 0x100000 if this is a EISA bus address or
> host linear address I don't know.

The remapping functions are pretty wild, and I'd thought I'd already
committed those.  It's a horrible bit twisting and shifting thing.

> Question is: what do the docs say?
> I guess I need to do something with MMIO so that ioremap() and
> virt_to_bus() work as expected.
> 
> I guess I can not count of this thing being DMA coherent on a 715/old?

There's some gross coherency problems that are going to be difficult to
outline without actually showing you the doc (which I'm okay with, but
you need to talk to HP to get that sorted out).

> It seems from the existing source that there should be a version
> register at 0x7000 but it seems to read 0xffff on my machine...

Let me find out about that as well, I did get this part to work at some
point.

Hang on a few days, I'll dig this up for you.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Putting open source to work.
