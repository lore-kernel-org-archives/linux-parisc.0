Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA25532
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 20:39:11 -0600
From: willy@thepuffingroup.com
Date: Fri, 26 May 2000 23:37:20 -0400
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
Message-ID: <20000526233720.E31075@thepuffingroup.com>
References: <200005262326.QAA09671@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200005262326.QAA09671@milano.cup.hp.com>; from Grant Grundler on Fri, May 26, 2000 at 04:26:35PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 26, 2000 at 04:26:35PM -0700, Grant Grundler wrote:
> mm/mm.o: In function `L1575':
> mm/mm.o(.text+0x15ec): undefined reference to `clear_user_page'
> ipc/ipc.o: In function `L1833':
> ipc/ipc.o(.text+0x7088): undefined reference to `clear_user_page'

fixed.

> fs/fs.o: In function `set_fs_altroot':
> fs/fs.o(.text+0x11a98): undefined reference to `__emul_prefix'

fixed.

> fs/fs.o: In function `L1184':
> fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
> net/network.a(sunrpc.o): In function `rpc_create_client':
> sunrpc.o(.text+0x360): undefined reference to `rpc_debug'

can't see why you're having trouble here.  those variables are defined in
net/sunrpc/sysctl.c.  is that file being built?  i'm getting a toolchain
up here so I can try to reproduce.  [Dead hard drives SUCK].

> make: *** [vmlinux] Error 1
> 
> Thanks to all who helped!

Yes, thanks to everyone!  I'd prefer if people still didn't commit until
we lay down a tag signifying end-of-merge.
