Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63A5D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 13:44:36 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id MAA06734
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 12:44:32 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gADKiHi02548;
	Wed, 13 Nov 2002 15:44:17 -0500
Message-Id: <200211132044.gADKiHi02548@localhost.localdomain>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Bjorn Helgaas <bjorn_helgaas@hp.com>, Greg KH <greg@kroah.com>,
	Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@SteelEye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device
 interface
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Wed, 13 Nov 2002 13:33:21 MST." <20021113203321.DCF174829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Nov 2002 15:44:17 -0500
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
