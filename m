Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF052482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jul 2001 12:01:26 -0600 (MDT)
Message-Id: <200107201759.LAA27765@puffin.external.hp.com>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@puffin.external.hp.com
Subject: Re: [parisc-linux] Kernel crashs on 715/100 
In-Reply-To: Message from =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
   of "Fri, 20 Jul 2001 11:21:23 +0200." <3B57F813.1B47E511@hrzpub.tu-darmstadt.de>
Date: Fri, 20 Jul 2001 11:59:54 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

=?iso-8859-1?Q?R=FCdiger?= Scholz wrote:
> a.c from "build-tools" says " 0x1010d5ac outb+2c" and "0x1010d5b0 outb+30

My theory: Some driver is attempting outb() to a device which isn't on
a supported bus. ie outb is dereferencing a NULL bus_ops ptr.
The right way to find the culprit is to unwind the stack
by hand to find who called outb.

Seems removing the offending driver from the .config should solve
the problem for now.  The right fix is to modify the driver so it
doesn't poke IO port space unless it's clear the device lives under
a suppported bus.

> I also refresh the files on th server. Now they are readable... ;-)

http://homepages.tu-darmstadt.de/~rscholz/ gives me:
	Forbidden
	You don't have permission to access /~rscholz/ on this server.

and http://homepages.tu-darmstadt.de/~rscholz/minicom.cap
give me a 404 (Not Found).

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
