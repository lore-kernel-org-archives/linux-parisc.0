Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Cc: Bjorn Helgaas <bjorn_helgaas@hp.com>, Greg KH <greg@kroah.com>,
	Miles Bader <miles@gnu.org>, Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface 
In-Reply-To: Message from "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
   of "Wed, 13 Nov 2002 15:44:17 EST." <200211132044.gADKiHi02548@localhost.localdomain>
References: <200211132044.gADKiHi02548@localhost.localdomain> 
Date: Wed, 13 Nov 2002 14:42:15 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021113214215.AD0494829@dsl2.external.hp.com>
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

"J.E.J. Bottomley" wrote:
> However, I think the ultimate destination is to see how much of the bus 
> specific stuff we can abstract by throwing an API around it.  I think IRQ, 
> port and mmio are feasible.  Specific knowledge of bus posting et al may not 
> be.

I was thinking how many BARs are present/used is PCI specific.

arch code already handles most of the IRQ fixups anyway and it
doesn't really matter where IRQ info is stored as long as the
device driver knows where to find it.

> > Duck! (that's going to get fixed it seems) ;^) 
> 
> I thought the 53c700 was working OK?

sorry - "going to get fixed" meant we are looking for a C180
or similar machine to send you.

thanks!
grant
