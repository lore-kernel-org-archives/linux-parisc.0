Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA09805
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 00:37:24 -0700
Message-Id: <200012010740.XAA01023@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] XFree status 
In-reply-to: Your message of "Thu, 30 Nov 2000 16:10:46 PST."
             <E141WIL-0007Ro-00@the-village.bc.nu>
Date: Thu, 30 Nov 2000 23:40:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> For I/O it seems that on things like the A180 the only way to do it is to use
> /dev/port and pread/pwrite the file handle for each port I/O.

Alan,
Why do you think only I/O port space can be used for XFree86?
Is the BIOS/x86 emulator wanting to talk to VGA registers the issue?

jsm tells me VGA MMIO lives at 0xA0000.
Dino only forwards 0xf0800000 through FF80_0000-1 to the PCI bus below.
(See section 7.9 "Accessing PCI Memory Space" in dino3.pdf).

jsm pointed out VGA MMIO is available on Astro/Ike chip sets.
I'm pretty sure this feature isn't used under HPUX.
Requires poking Astro to enable it.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
