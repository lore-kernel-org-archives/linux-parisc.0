Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09605
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 16:29:54 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 23:32:23 -0000
Subject: Re: [parisc-linux] On the naming of discs
To: grundler@cup.hp.com (Grant Grundler)
Date: Mon, 4 Dec 2000 23:25:05 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@thepuffingroup.com
In-Reply-To: <200012042158.NAA03700@milano.cup.hp.com> from "Grant Grundler" at Dec 04, 2000 01:58:46 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E1434yp-0004UL-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > discs differently.  HPUX follows the spec and numbers from 7 down to 0,
> > Linux follows the PC aberration and numbers from 0 up to 7.
> 
> The problem is not how disks are enumerated. HPUX does it exactly the
> same way - SCSI spec defines how the SCSI bus is to be walked.

ANSI order is 15->0 order PC order 0->15

> The real problem is how devices are "named". Adding or removing devices may
> cause existing devices to get new names when the system is rebooted.
> And adding/removing devices on one SCSI bus will affect how devices
> on other SCSI busses are named.

This isnt a kernel related issue
