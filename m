From: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
Date: Wed, 13 Nov 2002 15:21:07 -0500
Message-ID: <200211132021.gADKL8r02349__20220.5746820711$1416621926$gmane$org@localhost.localdomain>
References: <grundler@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Miles Bader <miles@gnu.org>, Greg KH <greg@kroah.com>,
	"J.E.J. Bottomley" <James.Bottomley@SteelEye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Wed, 13 Nov 2002 13:13:57 MST." <20021113201357.5302F4829@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Miles Bader wrote:
> I can't speak for `real machines,' but on my wierd embedded board,
> pci_alloc_consistent allocates from a special area of memory (not
> located at 0) that is the only shared memory between PCI devices and the
> CPU.  pci_alloc_consistent happens to fit this situation quite well, but
> I don't think a bitmask is enough to express the situation.

grundler@dsl2.external.hp.com said:
> HP PARISC V-Class do that as well. The "consistent" memory lives on
> the PCI Bus Controller - not in host mem. Note that parisc-linux does
> not (yet) support V-class. 

Actually, I think dma_mask and consistent memory are orthogonal problems.  
dma_masks are used by the I/O subsystem to determine whether direct DMA to a 
memory region containing an I/O buffer is possible or whether it has to be 
bounced.  Consistent memory is usually allocated for driver specific 
transfers.  The I/O subsystem doesn't usually require the actual I/O buffers 
to be in consistent memory.

James
