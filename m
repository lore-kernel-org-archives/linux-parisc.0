Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5188482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jul 2001 13:48:00 -0600 (MDT)
Message-Id: <200107291946.NAA15222@puffin.external.hp.com>
To: Scott Ashcroft <scott.ashcroft@talk21.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tracking down crash in 2.4.6 kernels on B160L 
In-Reply-To: Message from Scott Ashcroft <scott.ashcroft@talk21.com>
   of "Sat, 28 Jul 2001 15:38:23 BST." <3B62CE5F.31181B7A@talk21.com>
Date: Sun, 29 Jul 2001 13:46:32 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Scott Ashcroft wrote:
> I've rebuilt a kernel with EARLY_BOOTUP_DEBUG defined in
> linux/arch/parisc/kernel/pdc_console.c so I get some console output
> before the crash.

Excellent. I've got good and bad news for you.
The good news is I think I know what the problem is.

...
> Looks like it goes bang in probe_serial_pci to me as IAOQ is in that
> function.

That makes sense. Your box has no serial under PCI right?

If not, the code in drivers/char/serial.c looks broken:

static int __devinit serial_init_one(struct pci_dev *dev,
                                     const struct pci_device_id *ent)
{
        struct pci_board *board, tmp;
        int rc;
  
        for (board = pci_boards; board->vendor; board++) { 
                if (board->vendor != (unsigned short) PCI_ANY_ID &&
                    dev->vendor != board->vendor)
                        continue;
...

If pci_boards is NULL...anyway, that code is gone in 2.4.7 and
we will merge up again with the linus' tree again shortly.

You could try to build a kernel w/CONFIG_PCI disabled.
If that config doesn't build, file a bug about the fact that it didn't build.
You could also file a bug against "kernel" project at bugs.parisc-linux.org
and that could be closed once someone demonstrated the next merge fixes the
problem. In short, please file at least one bug.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
