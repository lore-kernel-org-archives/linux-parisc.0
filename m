Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id EED47482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Jun 2001 10:44:17 -0600 (MDT)
Message-Id: <200106241643.KAA25895@puffin.external.hp.com>
To: Joe Drew <hoserhead@woot.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Sun, 24 Jun 2001 12:14:01 EDT."
             <20010624121401.A1717@woot.net>
Date: Sun, 24 Jun 2001 10:43:27 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: Headless workstation?
List-ID: <linux-parisc.vger.kernel.org>

Joe Drew wrote:
> [url details how to set up serial console]
> 
> Unfortunately I don't have a serial console available. I was looking for
> just how to disable the error on startup when a keyboard isn't available..

Ok. You can't. You can only change to serail console.
Note that 712 models are the only parisc workstations with this limitation.
All other workstations revert to serial console automatically if no
keyboard is attached.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
