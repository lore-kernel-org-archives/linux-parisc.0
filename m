Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ccd.cargoclaimsdirect.com (unknown [62.6.162.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34F63482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 14:04:04 -0600 (MDT)
Date: Sun, 29 Jul 2001 21:01:00 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tracking down crash in 2.4.6 kernels on B160L
Message-ID: <20010729210100.A6411@cargoclaimsdirect.com>
References: <200107291946.NAA15222@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107291946.NAA15222@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 29, 2001 at 01:46:32PM -0600, Grant Grundler wrote:
> Scott Ashcroft wrote:
> > I've rebuilt a kernel with EARLY_BOOTUP_DEBUG defined in
> > linux/arch/parisc/kernel/pdc_console.c so I get some console output
> > before the crash.
> 
> Excellent. I've got good and bad news for you.
> The good news is I think I know what the problem is.
> 
> ...
> > Looks like it goes bang in probe_serial_pci to me as IAOQ is in that
> > function.
> 
> That makes sense. Your box has no serial under PCI right?

Don't think so. Always detects one though.

> If not, the code in drivers/char/serial.c looks broken:
> 
> static int __devinit serial_init_one(struct pci_dev *dev,
>                                      const struct pci_device_id *ent)
> {
>         struct pci_board *board, tmp;
>         int rc;
>   
>         for (board = pci_boards; board->vendor; board++) { 
>                 if (board->vendor != (unsigned short) PCI_ANY_ID &&
>                     dev->vendor != board->vendor)
>                         continue;
> ...
> 
> If pci_boards is NULL...anyway, that code is gone in 2.4.7 and
> we will merge up again with the linus' tree again shortly.
> 
> You could try to build a kernel w/CONFIG_PCI disabled.
> If that config doesn't build, file a bug about the fact that it didn't build.
> You could also file a bug against "kernel" project at bugs.parisc-linux.org
> and that could be closed once someone demonstrated the next merge fixes the
> problem. In short, please file at least one bug.

OK and the bad news was?

Scott
