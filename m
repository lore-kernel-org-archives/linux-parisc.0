From: Miles Bader <miles@lsi.nec.co.jp>
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Date: 13 Nov 2002 16:46:58 +0900
Message-ID: <buon0odsyh9.fsf__3121.22563268549$1416621916$gmane$org@mcspd15.ucom.lsi.nec.co.jp>
References: <20021109060342.GA7798@kroah.com>
	<200211091533.gA9FXuW02017@localhost.localdomain>
	<20021113061310.GD2106@kroah.com>
Reply-To: Miles Bader <miles@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
To: Greg KH <greg@kroah.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021113061310.GD2106@kroah.com>
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
> What is the real reason for needing this, pci_alloc_consistent()?  We
> have talked about renaming that to dev_alloc_consistent() in the past,
> which I think will work for you, right?

This this would end up [or have the ability to] invoking a bus-specific
routine at some point, right?  [so that a truly PCI-specific definition
could be still be had]

Thanks,

-Miles
-- 
[|nurgle|]  ddt- demonic? so quake will have an evil kinda setting? one that 
            will  make every christian in the world foamm at the mouth? 
[iddt]      nurg, that's the goal 
