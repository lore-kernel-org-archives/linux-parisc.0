Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA10723
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 16:37:19 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 2136C1B1
	for <parisc-linux@thepuffingroup.com>; Tue, 29 Feb 2000 17:38:42 -0500 (EST)
Message-Id: <200002292234.OAA08460@milano.cup.hp.com>
To: "Gyula Matics" <gyula_matics@hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] zalon 
In-reply-to: Your message of "Tue, 29 Feb 2000 16:11:55 PST."
             <00cf01bf82c7$51677260$a94abc0f@hungary.hp.com>
Date: Tue, 29 Feb 2000 14:34:47 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Gyula Matics" wrote:
> Hi all,
> 
> I'm working on the ncr7xx driver and plan to add support for the
> Bluefish GSC SCSI interface. I looked at the Mach kernel and
> found that before accessing the c720 it is initializing something
> called zalon.
> 
> What is that thing?

It's the chip that allows 53c720 signals to mean something to PA-RISC I/O.
The things I'm aware Zalon chip provides:
o IODC bytes: identify the I/O board as zalon  (ie GSC SCSI)
o EIM register:  used to generate PA interrupt transactions based on
  NCR c720 "pulling" it's IRQ line.
o HPA: hard physical address decoding so firmware can assign an MMIO
  address.

BTW, Bluefish is the EISA form factor of the GSC SCSI card.
I'm pretty sure other form factors exist including for K-class
and "built-in".

> Should one care about it

Yes.

> or just blindly do the same as the Mach kernel does?

Probably not exactly. You want to look at how drivers/gsc/dino.c
uses gsc_alloc_irq() and do something very similar in order
to program the EIM register. AFAIK, Once the Zalon EIM register is
programmed, the c720 chip can be pretty much treated like it's
on a PCI bus *using MMIO*.

The MMIO base address is handed to the parisc-linux device driver in
the struct hp_device *. Again, see dino.c for details.

hope this helps,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
