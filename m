Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA15456
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 16:05:11 -0600
Message-Id: <200008182207.PAA07370@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge 
In-reply-to: Your message of "Fri, 18 Aug 2000 12:49:44 PDT."
             <20000818124944.A13870@linuxcare.com>
Date: Fri, 18 Aug 2000 15:07:51 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> Hi,
>   The tulip driver doesn't initialise with the 2.4.0-test6 kernel
> (for me, anyway).
> The problem is that pci_resource_start (pdev, 0) in tulip_core.c
> line 1046, returns 0x0001ff00, where it should (I think) return
> 0x0000ff00.  I added a printk in drivers/pci/pci.c to show the
> start/end values as it filled in the pci_dev->resource table,
> and that showed start 0x0000ff00 end 0x0000ff7e.  Don't know
> where bit 16 gets added to start..

The bit 16 and up is the PCI bus number. The parisc PCI services use
the bus number to index into the corresponding bus services.

The driver should be using 0x0001ff00 when talking to I/O port
space services (ie inb/outb).

> I just commented out the 'goto err_out_free_netdev' in tulip_core.c
> and it now claims to mount nfs root, but cannot find init.
> I had to comment out the unregistering of pdc console to
> see that.
> 
> In 2.3.99pre8 tulip announced that the chip was at 0x1ff00 also,
> but it didn't matter because the request_region call was different.

Maybe I should take a look at the request_region() call and see what's
up there...It should be a NOP since we trust firmware to uniquely
assign I/O Port and MMIO address space (and I haven't seen any problems
where it doesn't on any platform).

> My 53c720 driver doesn't work any more either :-(

bummer...we'll get em working...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
