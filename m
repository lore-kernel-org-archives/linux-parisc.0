Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18407
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 09:18:17 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 16:20:38 -0000
Subject: Re: [parisc-linux] XFree status
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 30 Nov 2000 16:10:46 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), parisc-linux@thepuffingroup.com
In-Reply-To: <200011300518.VAA28946@milano.cup.hp.com> from "Grant Grundler" at Nov 29, 2000 09:18:14 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141WIL-0007Ro-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Alan Cox wrote:
> > I have a server linked.
> Alan - that's Cool! Wow!

Its still got its atoms in a twist, so its bombing out in Xnest loading the
first font.

> > inb/inw/outb/outw and friends are right now null
> > functions until I fill them in. Thats not a big deal. Initially I'll probably
> > use /dev/port but for speed I hope everyone uses mmio based hardware.
> 
> All HP graphics for PARISC are memory mapped. Both "GSC" and PCI flavors.

Yes, but if I want to say put an S3 Trio64 in my A180 and a USB card for
keyboard mouse..,, (and yes these are sitting on my desk)

> But I'm pretty clueless how linux X server finds/talks to a frame buffer.
> For HPUX, the graphics driver supports some ioctl()'s.
> Any references to describe how it works for linux?

The OS specific X code in XFree86 knows several ways to talk to Linux

Memory:

1.	Directly mmap()ing /dev/mem or /dev/kmem to get access to the 
	mmio space of the card and frame buffer memory. 

2.	Mapping the pci space via a kernel frame buffer device (/dev/fb*)

3.	Arbitary other mmap based code that you plug into it (harder to do)


I/O

1.	Use of iopl/ioperm on x86

2.	Use of mmap to map the PCI I/O space regions on different 
	platforms (which doesnt work on some PA kit)

3.	Arbitary other code we plug into it 


For I/O it seems that on things like the A180 the only way to do it is to use
/dev/port and pread/pwrite the file handle for each port I/O. This is slow but
hopefully primarily used for booting the card (XFree 4.0 has a X86 emulator
for booting the BIOS firmware on PCI cards)


For most machines I imagine we would be using mmio and the /dev/fb interface.

Alan
