Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA25706
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 20:45:24 -0600
Message-ID: <20000526204522.B24675@puffin.external.hp.com>
Date: Fri, 26 May 2000 20:45:22 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: willy@thepuffingroup.com, Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
References: <200005262326.QAA09671@milano.cup.hp.com> <20000526233720.E31075@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000526233720.E31075@thepuffingroup.com>; from willy@thepuffingroup.com on Fri, May 26, 2000 at 11:37:20PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> > fs/fs.o: In function `L1184':
> > fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
> > net/network.a(sunrpc.o): In function `rpc_create_client':
> > sunrpc.o(.text+0x360): undefined reference to `rpc_debug'
> 
> can't see why you're having trouble here.  those variables are defined in
> net/sunrpc/sysctl.c.  is that file being built?  i'm getting a toolchain
> up here so I can try to reproduce.  [Dead hard drives SUCK].

grant: did you have CONFIG_SYSCTL set ?  if you didn't, that might
explain your problems.
