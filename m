Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA06702
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Nov 2000 22:15:44 -0700
Message-Id: <200011300518.VAA28946@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] XFree status 
In-reply-to: Your message of "Thu, 30 Nov 2000 02:38:56 PST."
             <E141Jcg-0006je-00@the-village.bc.nu>
Date: Wed, 29 Nov 2000 21:18:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> I have a server linked.

Alan - that's Cool! Wow!

> inb/inw/outb/outw and friends are right now null
> functions until I fill them in. Thats not a big deal. Initially I'll probably
> use /dev/port but for speed I hope everyone uses mmio based hardware.

All HP graphics for PARISC are memory mapped. Both "GSC" and PCI flavors.

But I'm pretty clueless how linux X server finds/talks to a frame buffer.
For HPUX, the graphics driver supports some ioctl()'s.
Any references to describe how it works for linux?

parisc-linux doesn't create kernel virtual addresses for MMIO.
Which interface is used to create user virtual addresses for MMIO?
(In general - not just for frame buffers)

Is the PCI address passed to user space?
I'm wondering if/how "bus_to_virt()" type translations take place.

sorry for the many questions...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
