Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8EB3482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 31 Jul 2001 00:07:13 -0600 (MDT)
Message-Id: <200107310605.AAA25612@puffin.external.hp.com>
To: "Anthony Mori" <tonym@compusource.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 problem 
In-Reply-To: Message from "Anthony Mori" <tonym@compusource.net>
   of "Mon, 30 Jul 2001 23:48:31 EDT." <004b01c11973$ada28fd0$0b1e7b01@tpburner>
Date: Tue, 31 Jul 2001 00:05:55 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Anthony Mori" wrote:
> In the BIOS, I turned fastboot off, then did a reset, and it never came 
> up again.

fastboot flag controls the number and type of self tests the machine
does at poweron. I'd expect the LEDs to indicate what the problem is.
You could try removing all but two DIMMs and then swap to a different
pair if that doesn't work.
And try cycling the power too - that's different than a reset.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
