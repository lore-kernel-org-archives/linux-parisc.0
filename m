Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA27273
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 09:17:31 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 21857566B
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 08:19:01 -0800 (PST)
Message-Id: <200011151617.IAA13311@milano.cup.hp.com>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] dino maintainer? 
In-reply-to: Your message of "Wed, 15 Nov 2000 11:50:27 PST."
             <3A12BED3.B4F42ED2@linuxcare.com>
Date: Wed, 15 Nov 2000 08:17:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> Hang on a sec... what Grant's saying is that *card-mode* dino is never
> used for SCSI controllers, but on the B160L it would probably be
> *chip-mode* dino.

No such thing - you probably mean "Bridge Mode" and that's what
the built-in Dino is using.

> Does this mean that all GSC SCSI expansion cards are Zalon based?
>
> So what Helge has isn't a PCI card specifically, Dino and the 53c8xx are
> all on the motherboard.
> 
> Does Dino handle IO memory mapping differently for chip or card mode?

yes. yes. yes (conditional).

"IO memory mapping" is a confusing term. I'll assume you mean MMIO.
(Memory Mapped I/O)

MMIO space access is independent of I/O Port space access.
MMIO space access simple isn't available for card-mode Dino since
niether PDC nor the OS assigns host physical address space to the
card-mode Dino (that's what IO_ADDR_EN is for). PDC does this
for Bridge-mode dino (built-in) - but apperently only when it needs
to.

I/O Port space accesses are done the same way for both modes.
I/O Port space access is implemented by poking registers on Dino.

Read the Dino Spec (or source) for more details.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
