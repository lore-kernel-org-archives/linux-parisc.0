Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA21558
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 10:54:46 -0700
Message-Id: <200011301756.JAA29386@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] XFree status 
In-reply-to: Your message of "Thu, 30 Nov 2000 16:10:46 PST."
             <E141WIL-0007Ro-00@the-village.bc.nu>
Date: Thu, 30 Nov 2000 09:56:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
...
> > All HP graphics for PARISC are memory mapped. Both "GSC" and PCI flavors.
> 
> Yes, but if I want to say put an S3 Trio64 in my A180 and a USB card for
> keyboard mouse..,, (and yes these are sitting on my desk)

As long as everyone plays nicely on the PCI bus, it should work.
I would expect it too.

> The OS specific X code in XFree86 knows several ways to talk to Linux

Thanks for the explanation!


> For I/O it seems that on things like the A180 the only way to do it is to use
> /dev/port and pread/pwrite the file handle for each port I/O.
> This is slow but hopefully primarily used for booting the card

I/O port space is *really* slow under Dino. The problem is two writes
are needed to generate the I/O port transaction and since they must be
atomic - spin_lock_irqsave() is invoked around it. HPUX fundementally
does NOT use I/O port space for anything that is performance sensitive.

> (XFree 4.0 has a X86 emulator for booting the BIOS firmware on PCI cards)

And is this emulator running under parisc-linux now? (!)


thanks again,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
