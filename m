Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA30766
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jan 2000 11:49:32 -0700
Message-Id: <200001191715.JAA20163@milano.cup.hp.com>
To: Michael Ang <mang@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NCR driver 
In-reply-to: Your message of "Wed, 19 Jan 2000 11:44:49 PST."
             <3885EA01.88E1513B@thepuffingroup.com>
Date: Wed, 19 Jan 2000 09:15:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Michael Ang wrote:
> I've gotten the tulip driver to find it's device on the A180, but the
> PCI I/O address is being reported incorrectly at some point.  The
> pci_ioaddr reported is way too low, so I suspect that there is a Dino
> related offset that needs to be added somewhere.  I'm digging into the
> Dino code to find the right place to add the offset, and any hints/help
> is appreciated.

dino_fixup_bus()

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
