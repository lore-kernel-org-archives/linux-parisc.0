Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA14217
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 11:18:51 -0700
Message-Id: <200101251824.KAA22158@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree? 
In-reply-to: Your message of "Thu, 25 Jan 2001 10:19:18 PST."
             <20010125101918.M3571@linuxcare.com>
Date: Thu, 25 Jan 2001 10:24:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> Main branch is certainly broken.  e.g. drivers/pci/Makefile makes
> drivers/pci/pci.a but Makefile tries to link drivers/pci/drivers.o
> I fixed that in my tree but then got masses of unresolved
> references on the final link.

The whole PCI stuff needs to be merged. I was supposed to do that
once willy had a branch ready...I guess I should be doing that RSN
on the trunk. :^(

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
