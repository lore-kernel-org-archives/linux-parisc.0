Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mion.elka.pw.edu.pl (mion.elka.pw.edu.pl [194.29.160.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84934482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 09:47:58 -0600 (MDT)
Date: Fri, 11 Jul 2003 17:47:46 +0200 (MET DST)
From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
To: Matthew Wilcox <willy@debian.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] ns87415 irq
In-Reply-To: <20030711153515.GE20424@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.SOL.4.30.0307111742220.13589-100000@mion.elka.pw.edu.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> On Fri, Jul 11, 2003 at 05:32:12PM +0200, Bartlomiej Zolnierkiewicz wrote:
> > > BTW, Bart, seems like sparc64 does _have_ the ide_default_irq() function,
> > > it just returns 0.  So I think this patch shouldn't break anything.
> >
> > Yes, but 0 != 14 && 0 != 15. I am just paranoid. :-)
>
> Oh, 14 and 15 are not valid sparc64 irqs.  No problem.

Okay, patch accepted.

BTW Can we make irq detecion in init_hwif_ns87415() a bit simpler
    by using native PCI irq detection present in setup-pci.c?
    Hmmm...  I need to grab ns87415 datasheet...

> --
> "It's not Hollywood.  War is real, war is primarily not about defeat or
> victory, it is about death.  I've seen thousands and thousands of dead bodies.
> Do you think I want to have an academic debate on this subject?" -- Robert Fisk
