Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C8C1.dip.t-dialin.net [217.81.200.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE39C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 13:29:16 -0600 (MDT)
Date: Thu, 11 Oct 2001 21:28:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: norbert.naether@leica-microsystems.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HPA4552A, stifb
Message-ID: <20011011212803.A1661@solo.franken.de>
References: <OF4ACC8BA3.E1FA8942-ONC1256AE2.0037A5B7@leica.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OF4ACC8BA3.E1FA8942-ONC1256AE2.0037A5B7@leica.co.uk>; from norbert.naether@leica-microsystems.com on Thu, Oct 11, 2001 at 12:27:13PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 12:27:13PM +0200, norbert.naether@leica-microsystems.com wrote:
> the C200 VISUALIZE with an HPA4552A graphic board (SUMMIT fx2) is finally
> running sticon. :-)

cool, I've checked, whether I get the same on my FX6. And it works:-)

> I only added the PCI device ID to sti_pci_tbl[ ] in sticore.c :
> 
> { PCI_VENDOR_ID_HP, 0x1008, PCI_ANY_ID, PCI_ANY_ID, 0 ,0, 0}

I'm going to commit that change later.

Is there a reason for the #if 1 /* FIXME: */ in sticore.c ? Which machines
will lockup, if PCI graphics boards are enabled ?

> Now, I did some (more or less stupid..) things in stifb.c. With one
> (expected) result:  *take the power cord !* ;-)
> Is there anything I could do, to get this device running the framebuffer
> driver ?

no way without documentation or at least some source code to look at.
I've tried treating my fx6 as VIS-EG or HCRX, both locked up the machine.
So the FX boards aren't like the old ngle like boards.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
