Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12518482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 14:42:30 -0600 (MDT)
Message-Id: <200106052034.OAA20747@puffin.external.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr 
In-Reply-To: Your message of "Tue, 05 Jun 2001 00:52:05 +0200."
             <20010605005205.B3234@solo.franken.de>
Date: Tue, 05 Jun 2001 14:34:47 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:
> I don't think so, J282 doesn't even have PCI. Right now I can't boot it,
> because I've disassembled my computer room, but if memory serves right
> serial is attached to either wax or lasi.

I just checked. You are right. No PCI and both wax and lasi export
a serial interface. I thought all J-class had PCI but that is clearly wrong.
Early B/C-class don't have PCI either.

> 
> > for that...but I know it's not on the 0.9 ISOs. Booting from a lifimage
> > (newer kernel plus Dino patch) might work better.
> 
> even without having Dino ?

No. It won't work better afaik.
Anyone with a C160 is able to boot/install?

sorry,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
