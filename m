Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2D7548C1
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 07:56:06 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 8CE8844C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 09:56:05 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id HAA27501
	for parisc-linux@lists.parisc-linux.org; Wed, 3 Oct 2001 07:56:05 -0600 (MDT)
Date: Wed, 3 Oct 2001 07:56:05 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110031356.HAA27501@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [parisc-linux-cvs] Diff for PCXS fixes
List-ID: <linux-parisc.vger.kernel.org>

>
> On Wed, Oct 03, 2001 at 02:15:49AM -0600, John Marvin wrote:
> > +     /* Program VIPER to interrupt on the ASP irq */
> > +     gsc_writel((1 << (31 - ASP_GSC_IRQ)),VIPER_INT_WORD);
>
> If we can program Viper (the graphics board, right?) to interrupt on any
> CPU interrupt, why not give it its own rather than make it share an IRQ
> with Asp?

No, that is a misunderstanding. Viper is the memory/bus controller.
Asp is connected to viper, i.e. Asp pulls an interrupt line and viper
writes the interrupt into the cpu eirr. There is not really a hard
wired ASP IRQ as implied in asp.c. the value "3" just happened to
be what was left by the firmware on 720/730. The 710 firmware
leaves a clean slate and unwires the Asp interrupt. This write is
required to let Asp interrupt at all. You can make Asp interrupt on
any irq. I decided to just stick with the 3, but we could change it
or dynamically allocate it.

John
