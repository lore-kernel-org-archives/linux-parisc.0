Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9FC2482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Jun 2003 05:18:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19UPLI-0006zO-VH; Mon, 23 Jun 2003 12:18:36 +0100
Date: Mon, 23 Jun 2003 12:18:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <joel.soete@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video card]
Message-ID: <20030623111836.GA2620@parcelfarce.linux.theplanet.co.uk>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be> <20030615161948.GA12995@dsl2.external.hp.com> <3EF46AA9.7040703@tiscali.be> <20030623050450.GA449@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030623050450.GA449@dsl2.external.hp.com>
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

On Sun, Jun 22, 2003 at 11:04:50PM -0600, Grant Grundler wrote:
> AFAICT, eqnx driver doesn't call pci_enable_device().  The bug I'd be
> looking for is a PCI "resource" (BAR) to be accessed before it was enabled.
> Try adding a pci_enable_device() to eqnx_init() or eqx_pci_buspresent().
> [ *gag* I'm surprised this code even works on x86. ]

x86 typically doesn't need to call pci_enable_device, so people who've
never tried their driver on any other box may have missed it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
