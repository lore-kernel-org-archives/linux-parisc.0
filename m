From: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Wed, 13 Nov 2002 13:12:07 -0700
Message-ID: <20021113201207.4F49C4829__29785.6135447093$1416621925$gmane$org@dsl2.external.hp.com>
References: <20021109060342.GA7798@kroah.com> <200211091533.gA9FXuW02017@localhost.localdomain> <20021113061310.GD2106@kroah.com> <buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp>  <20021113075223.GZ2106@kroah.com>
Cc: Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Greg KH <greg@kroah.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Greg KH <greg@kroah.com>
   of "Tue, 12 Nov 2002 23:52:23 PST." <20021113075223.GZ2106@kroah.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Greg KH wrote:
> Are there any existing archs that need more than just dma_mask moved to
> struct device out of pci_dev?  Hm, ppc might need a bit more...

"out of pci_dev" and into struct device?
I think that's all parisc port would need now.

At some point I'd like to propose "dma_hint" field.
But I don't have a specific proposal yet.
Something to help drivers communicate DMA characteristics to
the IOMMU support code. ie bandwidth needed, cacheline line aware,
MWLI support, etc.

grant
