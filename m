Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B214482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 23:37:11 -0600 (MDT)
Message-Id: <200107110536.XAA31339@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Tue, 10 Jul 2001 14:31:51 BST." <20010710143151.D23509@linuxcare.com>
Date: Tue, 10 Jul 2001 23:36:25 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> IAOQ = _gsc_readl + 8
> called from dino_in32()
> I guess it was dino_in32(0xc1b21ec0), which looks odd.

It's definitely wrong. dino_in32() pokes dino to generate IO Port
transactions and Dino lives in 0xF... address range. This suggests the
pci_dev->sys_data is garbage (perhaps not initialized?) or points to garbage.
Perhaps for Dino's built-in PS/2 or RS232 port?

Sorry, I didn't follow this thread earlier. Does console output hint
which PCI device was involved (if any)?

> Don't know why it should fail like that in the middle of the
> install.  Is it repeatable?

If it's a problem with devices on-board Dino, I'd expect the problem to
be reproducible but with different symptoms depending on what's in pci_dev.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
