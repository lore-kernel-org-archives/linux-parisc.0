Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mion.elka.pw.edu.pl (mion.elka.pw.edu.pl [194.29.160.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF1EB482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jul 2003 09:32:38 -0600 (MDT)
Date: Fri, 11 Jul 2003 17:32:12 +0200 (MET DST)
From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
To: Matthew Wilcox <willy@debian.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] ns87415 irq
In-Reply-To: <20030711151640.GD20424@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.SOL.4.30.0307111726350.7550-100000@mion.elka.pw.edu.pl>
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

> On Fri, Jul 11, 2003 at 04:02:50PM +0100, Alan Cox wrote:
> > On Gwe, 2003-07-11 at 15:07, Matthew Wilcox wrote:
> > > Would this patch make sense for 2.5?  I have to confess not testing it
> > > on any hardware, but it seems to be the Right Thing (and I'm sure Alan
> > > remembers the mess we had in the 2.4 parisc tree for this ...)
> >
> > Yes, it makes sense to do this generally. However can you also pass
> > hwif to the ide_default_irq function because that lets the arch code
> > work out what pci bus the device is nailed to
>
> Erm, that seems like more work than I should be doing.  That would touch
> 36 files, including a lot of mips/ppc ide files.  Or did you want Bart
> to make that change?

Alan, are there any benefits of doing this?

> BTW, Bart, seems like sparc64 does _have_ the ide_default_irq() function,
> it just returns 0.  So I think this patch shouldn't break anything.

Yes, but 0 != 14 && 0 != 15. I am just paranoid. :-)

> --
> "It's not Hollywood.  War is real, war is primarily not about defeat or
> victory, it is about death.  I've seen thousands and thousands of dead bodies.
> Do you think I want to have an academic debate on this subject?" -- Robert Fisk
