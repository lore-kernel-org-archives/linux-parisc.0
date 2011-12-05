From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Mon, 5 Dec 2011 18:24:13 +0200
Message-ID: <20111205162412.GA15603@redhat.com>
References: <cover.1322163031.git.mst@redhat.com>
 <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
 <20111204104817.GI15464@redhat.com>
 <1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
 <20111204143000.GB21238@redhat.com>
 <1323009144.3003.6.camel@dabdike.int.hansenpartnership.com>
 <20111204144236.GA21506@redhat.com>
 <1323099209.7213.18.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1323099209.7213.18.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 05, 2011 at 09:33:29AM -0600, James Bottomley wrote:
> On Sun, 2011-12-04 at 16:42 +0200, Michael S. Tsirkin wrote:
> > On Sun, Dec 04, 2011 at 08:32:24AM -0600, James Bottomley wrote:
> > > On Sun, 2011-12-04 at 16:30 +0200, Michael S. Tsirkin wrote:
> > > > On Sun, Dec 04, 2011 at 08:22:34AM -0600, James Bottomley wrote:
> > > > > On Sun, 2011-12-04 at 12:48 +0200, Michael S. Tsirkin wrote:
> > > > > > On Thu, Nov 24, 2011 at 10:19:34PM +0200, Michael S. Tsirkin wrote:
> > > > > > > parisc copied pci_iomap from generic code, probably to avoid
> > > > > > > pulling the rest of iomap.c in.  Since that's in
> > > > > > > a separate file now, we can reuse the common implementation.
> > > > > > > 
> > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > 
> > > > > > Sorry to nag, any ACKs/NACKs on the parisc part?
> > > > > > I intend to send this to Linus if there are no
> > > > > > objections. Thanks!
> > > > > 
> > > > > Next time, send the patch to linux-arch or linux-parisc ... it helps to
> > > > > get people to review it. Although this one looks completely trivial,
> > > > > unless I'm missing something?
> > > > 
> > > > I think it's trivial but I don't have the setup to even compile it so
> > > > depend on someone to ack.
> > > > 
> > > > > Obviously there was a bit of a brain fart when this was done: the parisc
> > > > > piece shouldn't be a copy of the generic code: we don't have native i/o
> > > > > ports and emulation is pretty expensive, so we should prefer
> > > > > IORESOURCE_MEM over IORESOURCE_IO when both are available  ... but even
> > > > > on x86, memory mapping is faster (although not by the order of magnitude
> > > > > it is on parisc), so it looks like you could fix this in the generic
> > > > > code.
> > > > > 
> > > > > James
> > > > 
> > > > AFAIK, on PCI a resource is either IO or MEM, but never both.
> > > > What am I missing?
> > > 
> > > Could be ... I know we've had issues in the past with standard drivers
> > > like the sym53c8xx which map via both and operate far less efficiently
> > > over I/O ... but that could have been different bars I suppose (it's so
> > > long ago that I can't remember).
> > 
> > Probably, it looks like it has both mmio and io:
> > 
> > drivers/scsi/sym53c8xx_2/sym_glue.c
> > 
> > #ifdef CONFIG_SCSI_SYM53C8XX_MMIO
> >         if (device->mmio_base)
> >                 device->s.ioaddr = pci_iomap(pdev, 1,
> >                                                 pci_resource_len(pdev, 1));
> > #endif
> >         if (!device->s.ioaddr)
> >                 device->s.ioaddr = pci_iomap(pdev, 0,
> >                                                 pci_resource_len(pdev, 0));
> > 
> > 
> > so ... ACK?
> 
> Um, well, it looks like a trivial code shift, so it doesn't really need
> one (it can just go through the trivial tree).

It's part of a larger set not all of which is trivial.

>  Unless there's some
> reason actually to test it out on parisc because something will break
> (in which case, I'll need the actual patch, not just a quoted one).
> 
> James

A build test would be nice. Just forwarded you a patch.
It's also on linux-next.

-- 
MST
