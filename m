From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Subject: Re: [parisc-linux] [PATCH] asm-parisc/ide.h cleanup (there are no
	standard ports)
Date: Sun, 28 Mar 2004 01:04:51 +0100
Message-ID: <200403280104.51341.bzolnier__6731.22804514623$1416623311$gmane$org@elka.pw.edu.pl>
References: <200403241443.43206.bzolnier@elka.pw.edu.pl>
	<200403280024.57672.bzolnier@elka.pw.edu.pl>
	<20040327234926.GC24782@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-ide@vger.kernel.org, parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <B.Zolnierkiewicz@elka.pw.edu.pl>
In-Reply-To: <20040327234926.GC24782@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 28 of March 2004 00:49, Grant Grundler wrote:
> On Sun, Mar 28, 2004 at 12:24:57AM +0100, Bartlomiej Zolnierkiewicz wrote:
> > Well, I know but I have other cleanups incremental to this one. :-)
>
> Ah ok - go for it.
>
> > It is also NOP for #ifdef CONFIG_PCI (that is the reason for this patch
> > BTW) since both ide_default_io_base() and ide_default_irq() are defined
> > as '0'.
>
> Ok - I didn't look any deeper.
>
> > > Hypothetically someone could add an IDE card
> > > to a parisc EISA bus (eg 725), not define PCI, and then run the IDE
> > > in PIO mode since DMA is still kaputt behind our EISA IOMMU.
> >
> > That would require (at least) passing "ide=base[,ctl,[irq]]" kernel
> > parameter.
>
> I was told offline my hypothetical example is in fact hypothetical.
> parisc won't build with IDE unless PCI is defined. I haven't tried.

Ok, I will push this to Linus.

Thanks,
Bartlomiej
