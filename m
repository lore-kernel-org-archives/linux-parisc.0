From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the parisc-hd tree
Date: Tue, 29 Aug 2017 16:38:58 +1000
Message-ID: <20170829163858.3cab845b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arvind Yadav <arvind.yadav.cs@gmail.com>
To: Greg KH <greg@kroah.com>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/mux.c

between commit:

  fc72b7a3a0d8 ("parisc/mux: Fix section mismatches")

from the parisc-hd tree and commit:

  829374f544b3 ("tty: mux: constify parisc_device_id")

from the tty tree.

I fixed it up (the former is a superset of the latter) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
