Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maild.telia.com (maild.telia.com [194.22.190.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DAC84A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 16:02:16 -0700 (MST)
Message-Id: <200102182302.AAA30325@zaphod.halden.lillfab.se>
Date: Mon, 19 Feb 2001 00:02:09 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int
 errupts?)
To: Grant Grundler <grundler@cup.hp.com>
Cc: alex@linuxcare.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200102182028.MAA15119@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 18 Feb, Grant Grundler wrote:
> 5116@telia.com wrote:
>> Hello Alex and all.

>> I have no idea on what to do about interrupts, so the do not work. But
>> port I/O seems to work which it did not do before.
> 
> For some reason, I'm thinking the interrupts are routed through LASI
> but I don't know why. The whole "Core I/O" interrupt routing is a
> convoluted mess and I haven't looked at it in nearly a year.  I'm
> afraid someone with access to HPUX source is going to have to unravel
> that for you.

I see that some machines (those with a LASI?) have another WAX device as
well as the was EISA BA, that is installed as an interrupt router
(drivers/gsc/wax.c) but my machine does not have this device, only the
WAX EISA BA ant the ASP.

>> For this to work the WAX EISA must be the first PCI bus adapter to be
>> registered with the PCI code or else it does not get to mapped to the
>> ISA port range.
> 
> That's not true. The "virtualized" bus numbers I think are confusing you.
> Treat the addresses as "handles" to the address space and the EISA bus
> support can strip off the bus number to get the real I/O Port address.
Yes, but ISA drivers vill expect that 0x300 is 0x300 ant not 0x20300.
PCI drivers all get their port addresses from probing the bus so they
will 'just work'.

 

> 
>> +        wax_eisa_hba.base_addr=d->hpa;
>> +
>> +	pcibios_register_hba((struct pci_hba_data *) &wax_eisa_hba);
>> +        pci_port = (struct pci_port_ops*) &wax_port_ops;
> 
> Setting pci_port will prevent PCI I/O port space from working correctly
> in the same box.  The design is "broken" because last year I didn't get
> a clear answer on what is "PCI-like" and what isn't.
> 
> Let me propose the following:
> o pci_port becomes an array (it doesn't look like pci_bios needs to)
> o add "pci_port_ops *" parameter to pci_register_hba().
>   pci_register_hba could then fill in the pci_port array.
> o code in PCI_PORT_IN/OUT invoke (pci_port[b]->inb)(...) where 'b'
>   is already used to look up bus specific data.
Yes, I had some idea in this direction to, are we sure this belongs in
the PCI layer? It might be thought of as an IO switch above the
PCI/EISA/what-ever as well.
 
>> +/* It seems that the standard disable_irq() in parisc-linux 
>> + * does not sync, so this should be safe */
>> +#define disable_irq_nosync(x) disable_irq(x)
>
> Is "sync" instruction meant here?
> Why is that a bad thing?
Well the i386 version is that disable_irq() waits until all pending
interrupts on the local processor have been serviced while
disable_irq_nosync() returns immediately. The parisc version of
disable_irq() seems to be what disable_irq_nosync() is on the i386. 

Best Regards,
 
/Daniel

-- 
