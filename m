Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from TYO201.gate.nec.co.jp (TYO201.gate.nec.co.jp [210.143.35.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13BE94829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 00:48:03 -0700 (MST)
To: Greg KH <greg@kroah.com>
Cc: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>,
	"Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	hch@lst.de, linux-kernel@vger.kernel.org, mochel@osdl.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
References: <20021109060342.GA7798@kroah.com>
	<200211091533.gA9FXuW02017@localhost.localdomain>
	<20021113061310.GD2106@kroah.com>
Reply-To: Miles Bader <miles@gnu.org>
From: Miles Bader <miles@lsi.nec.co.jp>
Date: 13 Nov 2002 16:46:58 +0900
In-Reply-To: <20021113061310.GD2106@kroah.com>
Message-ID: <buon0odsyh9.fsf@mcspd15.ucom.lsi.nec.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
