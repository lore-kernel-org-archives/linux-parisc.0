From: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
Date: Wed, 13 Nov 2002 15:44:17 -0500
Message-ID: <200211132044.gADKiHi02548__614.012606865977$1416621927$gmane$org@localhost.localdomain>
References: <grundler@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bjorn Helgaas <bjorn_helgaas@hp.com>, Greg KH <greg@kroah.com>,
	Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@SteelEye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Wed, 13 Nov 2002 13:33:21 MST." <20021113203321.DCF174829@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

grundler@dsl2.external.hp.com said:
> For device discovery and initialization, the generic PCI code has to
> muck with PCI specific resources (IO Port, MMIO, and IRQ related stuff
> primarily). 

Oh, I agree.  If we conduct a phased approach to this, what happens initially 
is that the pci drivers simply pull pci_dev out of the struct device and use 
it as previously.

However, I think the ultimate destination is to see how much of the bus 
specific stuff we can abstract by throwing an API around it.  I think IRQ, 
port and mmio are feasible.  Specific knowledge of bus posting et al may not 
be.

> uhmm...If we are going to touch dma_mask in pci_dev, then just move it
> to struct device and be done with it. Then fixup pci_set_dma_mask() to
> do the right thing. 

Well...OK.  The advantage of a pointer in struct device is that the code can 
be converted as is, and no-one has to muck with the direct accessors of the 
pci_dev->dma_mask.  However, I'll see how many of them there actually are, its 
probably just the drivers that transfer the information to 
blk_queue_bounce_limit.

> Duck! (that's going to get fixed it seems) ;^) 

I thought the 53c700 was working OK?  Richard Hirst did some extensive testing 
on a parisc with an IO-MMU for me (he caught a lot of early mapping leaks 
which I fixed).

James
