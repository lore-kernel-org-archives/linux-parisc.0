Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jurassic.park.msu.ru (jurassic.park.msu.ru [195.208.223.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3BA34829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 05:00:33 -0700 (MST)
Date: Wed, 13 Nov 2002 14:59:02 +0300
From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
To: Greg KH <greg@kroah.com>
Cc: Miles Bader <miles@gnu.org>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Message-ID: <20021113145902.A1245@jurassic.park.msu.ru>
References: <20021109060342.GA7798@kroah.com> <200211091533.gA9FXuW02017@localhost.localdomain> <20021113061310.GD2106@kroah.com> <buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp> <20021113075223.GZ2106@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021113075223.GZ2106@kroah.com>; from greg@kroah.com on Tue, Nov 12, 2002 at 11:52:23PM -0800
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

On Tue, Nov 12, 2002 at 11:52:23PM -0800, Greg KH wrote:
> On Wed, Nov 13, 2002 at 04:46:58PM +0900, Miles Bader wrote:
> > This this would end up [or have the ability to] invoking a bus-specific
> > routine at some point, right?  [so that a truly PCI-specific definition
> > could be still be had]
> 
> If that was needed, yes, we should not break that functionality.
> 
> Are there any existing archs that need more than just dma_mask moved to
> struct device out of pci_dev?  Hm, ppc might need a bit more...

Add alpha, parisc, sparc and so on. ;-)

pci_dev->sysdata needs to be moved as well, but not only.
It seems that two things are fundamentally missing in generic
device model:
1. clean way to detect the type of container structure from arbitrary
   struct device *;
2. parent/child relationship between devices of different bus types.

Example (not exactly real life, but close enough):
to do DMA mapping properly for, say, some legacy device, I need to know
that it's sitting behind ISA-to-PCI bridge X belonging in PCI domain Y of
the root-level IO controller Z.

Ivan.
