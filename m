Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CE1F4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 13:26:00 -0700 (MST)
Message-Id: <200102182028.MAA15119@milano.cup.hp.com>
To: 5116@telia.com
Cc: alex@linuxcare.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about interrupts?) 
In-reply-to: Your message of "Sun, 18 Feb 2001 16:59:16 PST."
             <200102181559.QAA28579@zaphod.halden.lillfab.se>
Date: Sun, 18 Feb 2001 12:28:37 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

5116@telia.com wrote:
> Hello Alex and all.
> 
> Today I managed to get the ne driver to initialize my NE2k clone in the
> EISA slot on my  715/old.

Excellent! Good work!

> I have no idea on what to do about interrupts, so the do not work. But
> port I/O seems to work which it did not do before.

For some reason, I'm thinking the interrupts are routed through LASI
but I don't know why. The whole "Core I/O" interrupt routing is a
convoluted mess and I haven't looked at it in nearly a year.  I'm
afraid someone with access to HPUX source is going to have to unravel
that for you.

> For this to work the WAX EISA must be the first PCI bus adapter to be
> registered with the PCI code or else it does not get to mapped to the
> ISA port range.

That's not true. The "virtualized" bus numbers I think are confusing you.
Treat the addresses as "handles" to the address space and the EISA bus
support can strip off the bus number to get the real I/O Port address.

> This will only be problematic on boxes where there are
> both a EISA bus and a PCI bus and I do not know if there are any.

There are. Some of the workstations had all three: GSC, PCI, EISA slots.
There are even some systems with PA2.0 processors and EISA.

...
>  #define WAX_EISA_OUT(type, size) \
> -static void wax_out##type (u##size d, int addr) \
> +static void wax_out##type (struct pci_hba_data *hba, u16 addr, u##size d) \
...
> +        out_addr = (u32)hba->base_addr + ((addr & 0xfc00) >> 6) + \
>  			((addr & 0x03f8) << 9) + (addr & 0x0007) ; \

Note that the upper bits of the I/O port address are ignored anyway.
Ditto for the inb() functions.

...
> +        /* I think that hpa is the only part that makes sence to us */

typo: s/sence/sense/

> +        wax_eisa_hba.base_addr=d->hpa;
> +
> +	pcibios_register_hba((struct pci_hba_data *) &wax_eisa_hba);
> +        pci_port = (struct pci_port_ops*) &wax_port_ops;

Setting pci_port will prevent PCI I/O port space from working correctly
in the same box.  The design is "broken" because last year I didn't get
a clear answer on what is "PCI-like" and what isn't.

Let me propose the following:
o pci_port becomes an array (it doesn't look like pci_bios needs to)
o add "pci_port_ops *" parameter to pci_register_hba().
  pci_register_hba could then fill in the pci_port array.
o code in PCI_PORT_IN/OUT invoke (pci_port[b]->inb)(...) where 'b'
  is already used to look up bus specific data.

If someone is interested in making both PCI and EISA work in the same
box, please code up a patch with something along the lines of the above
proposal, I'll review and commit it. 

> +/* It seems that the standard disable_irq() in parisc-linux 
> + * does not sync, so this should be safe */
> +#define disable_irq_nosync(x) disable_irq(x)

Is "sync" instruction meant here?
Why is that a bad thing?

For SMP, we may eventually need both sync and/or dmasync instructions.
I don't understand all the issues on all platforms and thus just want
to document what people are thinking.

BTW, "disable_irq()" gets redirected to the region that owns the IRQ.
So for a CPU IRQ region, the code will land in disable_cpu_irq().
However, I don't expect EISA code to report directly to a CPU.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
