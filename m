Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA14580
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Sep 1999 19:32:13 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA20015
	for <parisc-linux@thepuffingroup.com>; Sat, 4 Sep 1999 18:34:02 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id SAA10177 for <parisc-linux@thepuffingroup.com>; Sat, 4 Sep 1999 18:31:36 -0700 (PDT)
Message-Id: <199909050131.SAA10177@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Sat, 04 Sep 1999 18:31:36 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] EIM register programming
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
...
> > Of GSC devices I'm aware of, only Dino will support pcibios_fixup().
> > How would a GSC SCSI, LAN, or Graphics card driver program it's EIM
> > register?
> > (EIM is equivalent to Dino's IAR0/1 registers)
> 
> Not decided yet.

Ok.

> alloc_irq is flawed and right now I think
> 
> int gsc_request_irq(void *eim,
> 	void (*handler)(int, void *, struct pt_regs *),
> 	unsigned long irqflags,
> 	const char *devname,
> 	void *dev_id);
> 
> might be a good idea.  return value is the number of the IRQ you
> have so you can do:
> 
> 	irq = gsc_request_irq(&dino->hpa->iar0, dino_interrupt, ??, dino->name,
>    dino);
> 	if(irq < 0) {
> 		printk("%s: couldn't allocate IRQ\n" dino->name); 
> 		return irq;
> 	}
> 	printk("%s: allocated IRQ %d\n", dino->name, irq);
> 
> does that sound okay ?

I think it will work.
Does Dino need "irq_base" then? I guess it doesn't.

It's clear this only works for 32-bit "EIM" style devices.
It won't work for anything different and I don't really know
what's out there (graphics has a reputation for doing things
differently though I expect them to also use an EIM register.)

My general preference is to pass platform knowledge (CPU HPA/EIRR)
to the caller instead of passing device specific knowledge
(EIM address) to the service. The former lets one manage platform
knowledge as a resource (allocate/free model) and is ultimately
more flexible. The latter is OK too if the device knowledge is
for a "mature" architecture (eg PCI spec won't change much anymore).
And GSC certainly won't change anymore.

I guess what I was looking for were processor (vs bus) specific services.
The gsc_request_irq() would be a consumer of PA specific services
and I was thinking some drivers might want to directly use processor
services directly.

Other comments?

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
