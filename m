Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id B48FF4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 13:21:26 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id MAA00377
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 12:21:22 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gADKL8r02349;
	Wed, 13 Nov 2002 15:21:08 -0500
Message-Id: <200211132021.gADKL8r02349@localhost.localdomain>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Miles Bader <miles@gnu.org>, Greg KH <greg@kroah.com>,
	"J.E.J. Bottomley" <James.Bottomley@SteelEye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Wed, 13 Nov 2002 13:13:57 MST." <20021113201357.5302F4829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Nov 2002 15:21:07 -0500
From: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
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
