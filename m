From: Miles Bader <miles@lsi.nec.co.jp>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: 13 Nov 2002 17:26:34 +0900
Message-ID: <buoadkdswn9.fsf__25873.073822777$1416621918$gmane$org@mcspd15.ucom.lsi.nec.co.jp>
References: <20021109060342.GA7798@kroah.com>
	<200211091533.gA9FXuW02017@localhost.localdomain>
	<20021113061310.GD2106@kroah.com>
	<buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp>
	<20021113075223.GZ2106@kroah.com>
	<buoisz1sxr4.fsf@mcspd15.ucom.lsi.nec.co.jp>
	<20021113081008.GC2106@kroah.com>
Reply-To: Miles Bader <miles@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Cc: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Greg KH <greg@kroah.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021113081008.GC2106@kroah.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Greg KH <greg@kroah.com> writes:
> > I can't speak for `real machines,' but on my wierd embedded board,
> > pci_alloc_consistent allocates from a special area of memory (not
> > located at 0) that is the only shared memory between PCI devices and the
> > CPU.  pci_alloc_consistent happens to fit this situation quite well, but
> > I don't think a bitmask is enough to express the situation.
> 
> What does your pci_alloc_consistent() function need from the pci_dev
> structure in order to do what you need it to do?  Anything other than
> the dma_mask value?

Currently, it ignores the pci_dev argument entirely (I've never had a
device that needed the mask, so I haven't bothered with it).  It just
allocates a block from the special memory region and returns the result.

-Miles
-- 
自らを空にして、心を開く時、道は開かれる
