From: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: Wed, 13 Nov 2002 13:13:57 -0700
Message-ID: <20021113201357.5302F4829__43794.6295286112$1416621925$gmane$org@dsl2.external.hp.com>
References: <20021109060342.GA7798@kroah.com> <200211091533.gA9FXuW02017@localhost.localdomain> <20021113061310.GD2106@kroah.com> <buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp> <20021113075223.GZ2106@kroah.com>  <buoisz1sxr4.fsf@mcspd15.ucom.lsi.nec.co.jp>
Cc: Greg KH <greg@kroah.com>,
	"J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Miles Bader <miles@gnu.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Miles Bader <miles@lsi.nec.co.jp>
   of "13 Nov 2002 17:02:39 +0900." <buoisz1sxr4.fsf@mcspd15.ucom.lsi.nec.co.jp>
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

HP PARISC V-Class do that as well. The "consistent" memory lives
on the PCI Bus Controller - not in host mem.
Note that parisc-linux does not (yet) support V-class.

grant
