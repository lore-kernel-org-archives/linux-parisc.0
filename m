Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8175482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 21:12:20 -0600 (MDT)
Message-Id: <200104030306.VAA10572@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request_region() 
In-Reply-To: Your message of "Tue, 03 Apr 2001 00:11:14 BST."
             <20010403001114.F9198@linuxcare.com>
Date: Mon, 02 Apr 2001 21:06:10 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> My 715/old, with a cvs head kernel, has no entries in /proc/ioports.
> If I change our IO_SPACE_LIMIT in io.h from 0x00ffffff to 0xfffffff,
> I get
> 
> apollo:~# cat /proc/ioports 
> f0800000-f08fffff : ASP
>   f0800000-f0800013 : reserved
>   f0800020-f0800020 : led_data
>   f0824800-f0824802 : parport0
>   f0826000-f0826010 : i82596
...
> Should all that ASP related stuff be doing a request_mem_region()
> so they show up in /proc/iomem rather than /proc/ioports?

Yes. I think so.
Ideally, /proc/ioports should be empty for systems without PCI or EISA.


> If so, does that have implications for EISA devices which will appear
> under ASP, where we might want to use exisiting drivers that do
> request_region()?

The plan was EISA devices under ASP should use request_region()
and inb/outb. I have no clue how EISA "bus walk" works or how EISA
drivers will find/claim their devices.

The EISA HBA needs to register it's "pci_ops".
See arch/parisc/kernel/pci.c:PCI_PORT_OUT macro.

> from io.h:
> 
> /* IO Port space is :      BBiiii   where BB is HBA number. */
> #define IO_SPACE_LIMIT 0x00ffffff

Yup - that's correct. It means the "offending" drivers above aren't
using inb/outb since "BB" value would index beyond the end
of the HBA array and crash the box.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
