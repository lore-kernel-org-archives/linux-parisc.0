From: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Wed, 13 Nov 2002 13:37:09 -0700
Message-ID: <20021113203709.2C61B4829__38067.9655856968$1416621926$gmane$org@dsl2.external.hp.com>
References: <200211132021.gADKL8r02349@localhost.localdomain>
Cc: Miles Bader <miles@gnu.org>, Greg KH <greg@kroah.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
   of "Wed, 13 Nov 2002 15:21:07 EST." <200211132021.gADKL8r02349@localhost.localdomain>
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
> Actually, I think dma_mask and consistent memory are orthogonal problems.  

No. consistent memory needs to be reachable by the device as well.
dma_mask constrains which memory pci_alloc_consistent() can use.

> dma_masks are used by the I/O subsystem to determine whether direct DMA to a 
> memory region containing an I/O buffer is possible or whether it has to be 
> bounced.  Consistent memory is usually allocated for driver specific 
> transfers.  The I/O subsystem doesn't usually require the actual I/O buffers 
> to be in consistent memory.

right.

grant
