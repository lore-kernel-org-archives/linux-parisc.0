Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE2D4482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 21:59:20 -0600 (MDT)
Date: Mon, 24 Sep 2001 21:59:18 -0600
To: R?diger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
Message-ID: <20010924215918.A23464@beavis.ybsoft.com>
References: <20010921104838.A2049@beavis.ybsoft.com> <3BAF13BC.3090302@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BAF13BC.3090302@hrzpub.tu-darmstadt.de>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 24, 2001 at 01:06:36PM +0200, R?diger Scholz wrote:
> Hi there,
> 
> I've tested the patch on my 715/100. I enabled STI-Console only and no 
> STI-fb, because of the second Coral Graphics Card in my box.Using the 
> kernel 2.4.9-pa25, the new patch kernel boots out of the box, but it 
> doesn't recognize my graphics cards. I also changed the 
> kmalloc-statement according to your second mail .
> 
> I added the bootlog.
> 
> Any hints? Ruediger

First I am assuming this worked before you tested this patch....

Ok, here we found the two graphics cards in firmware....
> Found devices:
> 1. Coral SGC Graphics (10) at 0xf4000000, versions 0x4, 0x0, 0x77
> 2. Mirage GSC Builtin Graphics (10) at 0xf8000000, versions 0x13, 0x0, 0x85


Here both the devices were not claimed by the STI driver.
> sticonsole_init: searching for STI ROMs
> Warning : device (10, 0x4, 0x0, 0x77) NOT claimed by sti (native)
> Warning : device (10, 0x13, 0x0, 0x85) NOT claimed by sti (native)

if you look in the register_parisc_driver() in arch/parisc/kernel/drivers.c

you will see that this warning is printed with the driver->probe() function
returns non-zero.

                if (driver->probe(device) == 0) {
                        device->driver = driver;
                } else {
                        printk(KERN_WARNING "Warning : device (%d, 0x%x, 0x%x, 0x%x) NOT claimed by %s\n",
                                device->id.hw_type, device->id.hversion,
                                device->id.hversion_rev, device->id.sversion,
                                driver->name);
                }

The probe function for the STI drive resolves to this function sticore_pa_init()
in drivers/video/sticore.c

I would look at the different inputs/outputs from this function with and without
the patch applied.  I have been trying to duplicate your problem on the 712/100
all day without success *sigh*   I do have a 715 here I can try if you can not
locate the problem, but nothing with dual graphics cards.

Sorry, I do not have a better answer for you *sigh*  


Is anyone else having these problems? I'd like to commit this patch, but I'm
hesitent if it is causing problems.

Thanks,

- Ryan
