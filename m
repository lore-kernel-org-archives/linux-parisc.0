From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] asm-parisc/ide.h cleanup (there are no
	standard ports)
Date: Sat, 27 Mar 2004 16:49:26 -0700
Message-ID: <20040327234926.GC24782__3252.39992603219$1416623311$gmane$org@colo.lackof.org>
References: <200403241443.43206.bzolnier@elka.pw.edu.pl>
	<20040327222810.GB24782@colo.lackof.org>
	<200403280024.57672.bzolnier@elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-ide@vger.kernel.org, parisc-linux@parisc-linux.org
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200403280024.57672.bzolnier@elka.pw.edu.pl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Mar 28, 2004 at 12:24:57AM +0100, Bartlomiej Zolnierkiewicz wrote:
> Well, I know but I have other cleanups incremental to this one. :-)

Ah ok - go for it.

> It is also NOP for #ifdef CONFIG_PCI (that is the reason for this patch BTW)
> since both ide_default_io_base() and ide_default_irq() are defined as '0'.

Ok - I didn't look any deeper.

> > Hypothetically someone could add an IDE card
> > to a parisc EISA bus (eg 725), not define PCI, and then run the IDE
> > in PIO mode since DMA is still kaputt behind our EISA IOMMU.
> 
> That would require (at least) passing "ide=base[,ctl,[irq]]" kernel parameter.

I was told offline my hypothetical example is in fact hypothetical.
parisc won't build with IDE unless PCI is defined. I haven't tried.

thanks,
grant
