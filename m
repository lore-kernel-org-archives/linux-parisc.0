From: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Wed, 13 Nov 2002 13:33:21 -0700
Message-ID: <20021113203321.DCF174829__29068.2784784169$1416621927$gmane$org@dsl2.external.hp.com>
References: <200211131723.gADHNmp02426@localhost.localdomain>
Cc: Bjorn Helgaas <bjorn_helgaas@hp.com>, Greg KH <greg@kroah.com>,
	Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: "J.E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from "J.E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
   of "Wed, 13 Nov 2002 12:23:48 EST." <200211131723.gADHNmp02426@localhost.localdomain>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"J.E.J. Bottomley" wrote:
> We should also allow devices to do all the setup through bus generic 
> functions, but leave open the possibility that the driver may (once it knows 
> the bus type) obtain the pci_dev (or whatever) from the struct device if it 
> really, really has to muck with bus specific registers.

For device discovery and initialization, the generic PCI code has to muck
with PCI specific resources (IO Port, MMIO, and IRQ related stuff primarily).

> As far as the SCSI mid layer goes, all we really need from struct device is 
> the dma_mask for setting up the I/O bounce buffers.
> 
> The simplest way to do all of this is probably to add a pointer to the 
> dma_mask in struct device and make it point to the same thing in pci_dev.
> If we find we need more than this per device, it could become a pointer
> to a generic dma information structure later on.

uhmm...If we are going to touch dma_mask in pci_dev, then just move it
to struct device and be done with it. Then fixup pci_set_dma_mask()
to do the right thing.

...
> Since the 53c700 is also used by parisc (including some machines with 
> IOMMUs---which, unfortunately, I don't have access to), it probably makes an 
> ideal conversion test case.

Duck! (that's going to get fixed it seems) ;^)

thanks,
grant
