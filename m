From: "J.E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
Date: Wed, 13 Nov 2002 12:23:48 -0500
Message-ID: <200211131723.gADHNmp02426__11262.9073010341$1416621924$gmane$org@localhost.localdomain>
References: <bjorn_helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Greg KH <greg@kroah.com>, Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Bjorn Helgaas <bjorn_helgaas@hp.com>
   of "Wed, 13 Nov 2002 09:32:00 MST." <200211130932.00864.bjorn_helgaas@hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Absolutely.  Boxes with multiple IOMMUs (at least ia64, sparc64,
> parisc) need to look up the correct IOMMU with which to map the
> allocated buffer. Typically this is in the pci_dev sysdata. 

Actually, I think all of the DMA mapping api needs to become bus independent 
and take a struct device * instead of a pci_dev.  How this lookup/mapping is 
done could be abstracted per architecture inside the DMA api internals.

We should also allow devices to do all the setup through bus generic 
functions, but leave open the possibility that the driver may (once it knows 
the bus type) obtain the pci_dev (or whatever) from the struct device if it 
really, really has to muck with bus specific registers.

As far as the SCSI mid layer goes, all we really need from struct device is 
the dma_mask for setting up the I/O bounce buffers.

The simplest way to do all of this is probably to add a pointer to the 
dma_mask in struct device and make it point to the same thing in pci_dev.  If 
we find we need more than this per device, it could become a pointer to a 
generic dma information structure later on.

Drivers need to advertise DMA conformance (at the moment, requires consistent 
allocation, or fully writeback/invalidate compliant)

We should also adopt Adam's pointer approach to the sync/invalidate points so 
we can treat a dma_alloc_consistent failure as a real failure and not clutter 
the code with writeback/invalidate fallbacks.

The above changes would allow me to yank all of the pci_dev specific code out 
of the scsi mid layer, and also introduce a mca_dev type, convert the 53c700 
driver to using the generic dma API and *finally* get us to the point where I 
don't have to use bounce buffers for highmem access on the MCA bus.

Since the 53c700 is also used by parisc (including some machines with 
IOMMUs---which, unfortunately, I don't have access to), it probably makes an 
ideal conversion test case.

This can probably all be wrappered so the current SCSI pci drivers don't 
notice anything wrong.

James
