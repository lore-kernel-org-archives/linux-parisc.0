Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA18082
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 07:01:14 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 15 Jun 1999 13:00:58 -0000
Subject: Re: [parisc-linux] Dino PCI and I/O spaces (fwd)
To: billk@sr.hp.com (Bill Katz)
Date: Tue, 15 Jun 1999 13:53:41 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199906150534.WAA14372@meow.sr.hp.com> from "Bill Katz" at Jun 14, 99 10:34:16 pm
Content-Type: text
Message-Id: <E10tsil-0007FD-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Grant has it right.  I've watchedd Dino with a full logic analyzer on
> both GSC and PCI...  The 4 byte enables get swapped as Grant described
> and if you do a single byte access, a single byte pops out the other side.

Thanks. I'll go and change my PCI code to reflect reality

Alan
