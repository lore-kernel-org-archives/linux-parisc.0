Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA15035
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 14:15:37 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA07905
	for <parisc-linux@thepuffingroup.com>; Mon, 14 Jun 1999 13:15:33 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id NAA18426 for <parisc-linux@thepuffingroup.com>; Mon, 14 Jun 1999 13:15:14 -0700 (PDT)
Message-Id: <199906142015.NAA18426@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino PCI and I/O spaces 
In-reply-to: Your message of "Mon, 14 Jun 1999 16:15:08 PDT."
             <E10tYS4-00066l-00@the-village.bc.nu>
Date: Mon, 14 Jun 1999 13:15:10 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> 
> I've put together draft code to handle the Dino PCI configuration space
> accesses. There seems to be no way to do byte sized config accesses, do
> I just read 32bits mask and write 32bits ?

I don't recall HP-UX performing read/modify/write.
I thought Dino will forward the byte enables to the PCI bus.
PCI-PCI bridge numbering I think depends on this.

> The I/O space documentation also doesn't cover how to force sizes for
> inb/inw/inl.

It doesn't clearly for configuration space.
It does for I/O space. I suspect all spaces are handled the
same in this regard.
See section 7.7.3 "Configuration Access Endianness".
Other sections may talk more about the "byte enable" signals.

> Im guessing you simply do that sized memory access to the 0x6C offset.

That's been my experience.

> 
> I'm mapping the notional I/O space 0x0000->0xFFFF as PCI space I/O. Since
> HP boxes have I/O space high no MMIO can be confused for PCI this way.
> If we have multiple Dino's in any box I need to put my thinking hat back on.

Not a problem. Each Dino has it's own configuration and I/O space.
If the parent/child relationship between Dino and PCI devices is
maintained then bus numbering and address assignment is not a problem.

Enabling memory mapped I/O requires programming Dino to respond
to a unique host address range. On the A/B/C/J class boxes, firmware
takes care of this and programming PCI devices BAR registers to match.
The OS can pick this up and pass it too device drivers.

On these boxes it's "uncomplicated" since the host physical address
is the same as the PCI bus address. I mention this since it's not
the case for all HP platforms.

> Also as a btw: PCI I/O port access will suck rocks on HP because we have
> to grab a lock since it is a two stage operation. That may mean we want
> to write smart copy/csum/io and ins* functions for PCI block I/O.

Yup.  HP has generally used memory mapped I/O on all it's platforms.
Since I/O port space is (was?) not performance path, it was OK for the
PCI device driver has to use what we call an "accessor" function.
Ditto for PCI configuration space access.

grant

> Alan
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
