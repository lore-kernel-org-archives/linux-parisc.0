Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88301482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 02:49:33 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E0F2BB00C; Wed, 11 Jul 2001 09:48:16 +0100 (BST)
Date: Wed, 11 Jul 2001 09:48:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240
Message-ID: <20010711094816.G18375@linuxcare.com>
References: <rhirst@linuxcare.com> <200107110536.XAA31339@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107110536.XAA31339@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Tue, Jul 10, 2001 at 11:36:25PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 11:36:25PM -0600, Grant Grundler wrote:
> Richard Hirst wrote:
> > IAOQ = _gsc_readl + 8
> > called from dino_in32()
> > I guess it was dino_in32(0xc1b21ec0), which looks odd.
> 
> It's definitely wrong. dino_in32() pokes dino to generate IO Port
> transactions and Dino lives in 0xF... address range. This suggests the
> pci_dev->sys_data is garbage (perhaps not initialized?) or points to garbage.
> Perhaps for Dino's built-in PS/2 or RS232 port?
> 
> Sorry, I didn't follow this thread earlier. Does console output hint
> which PCI device was involved (if any)?

Not obviously, and it failed in the middle of the install, so presumably
whatever device was involved had been accessed successfully earlier.

Richard
