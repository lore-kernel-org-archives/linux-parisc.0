Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 975E4482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 11:47:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15v0DQ-0002gX-00; Sat, 20 Oct 2001 18:47:20 +0100
Date: Sat, 20 Oct 2001 18:47:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] The long awaited iotree patch for System Map Firmware
Message-ID: <20011020184720.A31505@parcelfarce.linux.theplanet.co.uk>
References: <20011019165926.A31233@beavis.ybsoft.com> <20011020100404.917E2482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020100404.917E2482A@dsl2.external.hp.com>; from deller@gmx.de on Sat, Oct 20, 2001 at 12:02:53PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 12:02:53PM +0200, Helge Deller wrote:
> 2. Mirage Jr Core BA (11) at 0xf0100000 [2], versions 0x28, 0x0, 0x81
> 3.  (0) at 0x0 [2/0], versions 0x0, 0x0, 0x0
> 4. Mirage Jr Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x28, 0x0, 0x82

OK.  So we should skip printing devices which don't have an hpa.

> 12. Mirage Jr Wax EISA BA (11) at 0xfc000000 [4], versions 0x28, 0x0, 0x90
> 13. Mirage Jr Wax BA (11) at 0xf0200000 [5], versions 0x12, 0x0, 0x8e

Mmmmpf.  That complicates thngs a little; I assumed the EISA BA was
actually under the normal BA.

> CONFIG_SMP=n  ignoring additional CPUs
> Warning : device (0, 0x0, 0x0, 0x0) NOT claimed by CPU
> CONFIG_SMP=n  ignoring additional CPUs
> Warning : device (0, 0x60a, 0x0, 0x4) NOT claimed by CPU

Hehe, yes, devices not completely filled in look like CPUs.  Oops :-)

> As you see, your iotree inserts "phantom" devices on [2/0] an [5/0]. I think both
> devices should be pre-initialized by default to type HPHW_FAULTY and to the hpa of the
> parent device in the function alloc_tree_node().

I agree about HPHW_FAULTY.  I don't think we need to initialise the hpa
though.  Maybe a new HPHW_FAKE instead?  It's not necessarily confusing,
since devices which actually report HPHW_FAULTY never get inserted into
the iotree.

> The other thing is, that currently no interrupts are found for any devices - I'll investigate that
> later but think this shouldn't be so hard to fix either.

I know why that is.  Basically we need to get lasi (and wax) to fix up
their subdevices the same way that asp does.  Then we can finally kill
busdevice_alloc_irq.  As a quick hack, we could check parent->hw_type ==
HPHW_FAULTY in busdevice_alloc_irq and skip to that parent.

Not quite sure how to handle Wax EISA not being underneath the Wax BA..
maybe just walk from wax's parent to fill in known irqs.

-- 
Revolutions do not require corporate support.
