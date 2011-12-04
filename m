From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Sun, 04 Dec 2011 08:32:24 -0600
Message-ID: <1323009144.3003.6.camel@dabdike.int.hansenpartnership.com>
References: <cover.1322163031.git.mst@redhat.com>
	 <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
	 <20111204104817.GI15464@redhat.com>
	 <1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
	 <20111204143000.GB21238@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111204143000.GB21238@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-12-04 at 16:30 +0200, Michael S. Tsirkin wrote:
> On Sun, Dec 04, 2011 at 08:22:34AM -0600, James Bottomley wrote:
> > On Sun, 2011-12-04 at 12:48 +0200, Michael S. Tsirkin wrote:
> > > On Thu, Nov 24, 2011 at 10:19:34PM +0200, Michael S. Tsirkin wrote:
> > > > parisc copied pci_iomap from generic code, probably to avoid
> > > > pulling the rest of iomap.c in.  Since that's in
> > > > a separate file now, we can reuse the common implementation.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > 
> > > Sorry to nag, any ACKs/NACKs on the parisc part?
> > > I intend to send this to Linus if there are no
> > > objections. Thanks!
> > 
> > Next time, send the patch to linux-arch or linux-parisc ... it helps to
> > get people to review it. Although this one looks completely trivial,
> > unless I'm missing something?
> 
> I think it's trivial but I don't have the setup to even compile it so
> depend on someone to ack.
> 
> > Obviously there was a bit of a brain fart when this was done: the parisc
> > piece shouldn't be a copy of the generic code: we don't have native i/o
> > ports and emulation is pretty expensive, so we should prefer
> > IORESOURCE_MEM over IORESOURCE_IO when both are available  ... but even
> > on x86, memory mapping is faster (although not by the order of magnitude
> > it is on parisc), so it looks like you could fix this in the generic
> > code.
> > 
> > James
> 
> AFAIK, on PCI a resource is either IO or MEM, but never both.
> What am I missing?

Could be ... I know we've had issues in the past with standard drivers
like the sym53c8xx which map via both and operate far less efficiently
over I/O ... but that could have been different bars I suppose (it's so
long ago that I can't remember).

James


