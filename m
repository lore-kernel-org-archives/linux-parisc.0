Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA30013
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Sep 2000 19:12:02 -0600
Received: (from epaulson@localhost)
	by data.upl.cs.wisc.edu (8.10.2/8.10.2) id e8M1CfR29182
	for parisc-linux@thepuffingroup.com; Thu, 21 Sep 2000 20:12:41 -0500
Date: Thu, 21 Sep 2000 20:12:41 -0500
From: Erik Paulson <epaulson@upl.cs.wisc.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000921201241.C28365@data.upl.cs.wisc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] C100 and ccio-dma
List-ID: <linux-parisc.vger.kernel.org>

Hi,
	Using the CVS kernel on a C100 I'm seeing it die with an out-of-mapping
resources error from ccio-dma.c. It looks like there's been some active 
development there about a week ago, but it's not helping my machine. The 
quickest way for me to bring it about is to try and use mke2fs, but just
mounting the CD and running a few commands will oftentimes do the trick.

How can I help debug this? There's really no useful information provided by
the printk now - is there some sort of debugging info I could be collecting,
or would a backtrace help?

Thanks

-Erik
