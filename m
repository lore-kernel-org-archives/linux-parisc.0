Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA27695
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 11:09:49 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 19 Oct 1999 17:10:42 -0000
Subject: Re: [parisc-linux] LASI and serial port initialization
To: grundler@cup.hp.com (Grant Grundler)
Date: Tue, 19 Oct 1999 17:58:07 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com, Helge.Deller@ruhr-uni-bochum.de
In-Reply-To: <199910191630.JAA27454@milano.cup.hp.com> from "Grant Grundler" at Oct 19, 99 09:30:45 am
Content-Type: text
Message-Id: <E11dcaO-0001bd-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> 2) Use IODC until the console device is "owned" by the appropriate driver
>    and can start taking input/output. 

That is basically the sparc approach. It also works well for bootstrapping
new hardware - nothing claims the console so you can see what happens until
you fix it

> Either 2 or 3 requires some software layer behind printk to change
> behavior at some point. I don't know where that point is or how

Not really. We have register_console() and unregister_console() already
in existance.

Alan
