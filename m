Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29169
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 13:59:37 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 20:33:48 -0000
Subject: Re: [parisc-linux] XFree status
To: grundler@cup.hp.com (Grant Grundler)
Date: Thu, 30 Nov 2000 20:33:42 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), parisc-linux@thepuffingroup.com
In-Reply-To: <200011301756.JAA29386@milano.cup.hp.com> from "Grant Grundler" at Nov 30, 2000 09:56:46 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141aOm-0007lW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > (XFree 4.0 has a X86 emulator for booting the BIOS firmware on PCI cards)
> 
> And is this emulator running under parisc-linux now? (!)

It builds, it seems to run its tests (ignoring the fact I have in/out ops
nulled out). It is already used on other platforms. It might be interesting
to use it in the PA bootloader too 8)

Alan
