Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mion.elka.pw.edu.pl (mion.elka.pw.edu.pl [194.29.160.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B552482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 08:26:48 -0600 (MDT)
Date: Fri, 11 Jul 2003 16:26:21 +0200 (MET DST)
From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
To: Matthew Wilcox <willy@debian.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	<parisc-linux@parisc-linux.org>
In-Reply-To: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.SOL.4.30.0307111612370.9740-100000@mion.elka.pw.edu.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: [2.5] ns87415 irq
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 11 Jul 2003, Matthew Wilcox wrote:

> Would this patch make sense for 2.5?  I have to confess not testing it
> on any hardware, but it seems to be the Right Thing (and I'm sure Alan
> remembers the mess we had in the 2.4 parisc tree for this ...)

Question is on what other archs ns87415 is used because some archs
do not have ide_default_irq() ie. sparc64.

from drivers/ide/Kconfig:
config BLK_DEV_NS87415
        tristate "NS87415 chipset support"
        depends on BLK_DEV_IDEDMA_PCI
        help
          This driver adds detection and support for the NS87415 chip
          (used in SPARC64, among others).

I think sparc64 uses PCI interrupt so this is not a problem.
Are there any other archs using ns87415?
--
Bartlomiej

> --- linus-2.5/drivers/ide/pci/ns87415.c	Thu Jul 10 16:18:07 2003
> +++ parisc-2.5/drivers/ide/pci/ns87415.c	Fri Jul 11 08:03:17 2003
> @@ -200,7 +200,7 @@
>  	}
>
>  	if (!using_inta)
> -		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
> +		hwif->irq = ide_default_irq(hwif->io_ports[IDE_DATA_OFFSET]);
>  	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
>  		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */
