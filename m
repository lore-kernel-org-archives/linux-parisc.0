Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FB76482A
	for <parisc-linux@parisc-linux.org>; Thu,  9 Aug 2001 10:46:38 -0600 (MDT)
Message-Id: <200108091645.KAA13777@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Tue, 07 Aug 2001 22:36:50 BST." <20010807223650.F1011@linuxcare.com>
Date: Thu, 09 Aug 2001 10:45:04 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> I've fixed the lockup on CapsLock, using an analyser to monitor what happened
> on the PS/2 cable:

Cool!
reverse engineering is more fun when one has the right tools...

> I changed the driver to allow 5ms rather than 1ms, and it works now.
> In fact, for my keyboard, the time from command being written to ack
> being received is about 2.5ms.
>
> Can't say I like the idea of mdelay(5) being called 3 times every time I
> press CapsLock though.

Would sleep/wakeup be better than polling?
It seems the keyboard does generate interrupts.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
