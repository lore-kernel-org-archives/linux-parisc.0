Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44753482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 08:43:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19az7p-0006BT-E6; Fri, 11 Jul 2003 15:43:53 +0100
Date: Fri, 11 Jul 2003 15:43:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>, parisc-linux@parisc-linux.org
Message-ID: <20030711144353.GC20424@parcelfarce.linux.theplanet.co.uk>
References: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk> <Pine.SOL.4.30.0307111612370.9740-100000@mion.elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.30.0307111612370.9740-100000@mion.elka.pw.edu.pl>
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

On Fri, Jul 11, 2003 at 04:26:21PM +0200, Bartlomiej Zolnierkiewicz wrote:
> Question is on what other archs ns87415 is used because some archs
> do not have ide_default_irq() ie. sparc64.
> 
> from drivers/ide/Kconfig:
> config BLK_DEV_NS87415
>         tristate "NS87415 chipset support"
>         depends on BLK_DEV_IDEDMA_PCI
>         help
>           This driver adds detection and support for the NS87415 chip
>           (used in SPARC64, among others).
> 
> I think sparc64 uses PCI interrupt so this is not a problem.
> Are there any other archs using ns87415?

I really don't know.  I don't think it's unreasonable to expect
architectures to add ide_default_irq().  The existing code in the driver
can't work for anything other than x86, so either everyone has a local
hack to it (like parisc does) or nobody else uses it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
