Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA26462
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 21:59:29 -0600
From: willy@thepuffingroup.com
Date: Sat, 27 May 2000 00:56:46 -0400
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
Message-ID: <20000527005646.H31075@thepuffingroup.com>
References: <200005262326.QAA09671@milano.cup.hp.com> <20000526233720.E31075@thepuffingroup.com> <20000526204522.B24675@puffin.external.hp.com> <20000527000805.G31075@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000527000805.G31075@thepuffingroup.com>; from willy@thepuffingroup.com on Sat, May 27, 2000 at 12:08:05AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 27, 2000 at 12:08:05AM -0400, willy@thepuffingroup.com wrote:
> On Fri, May 26, 2000 at 08:45:22PM -0600, Philipp Rumpf wrote:
> > > > fs/fs.o: In function `L1184':
> > > > fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
> > > > net/network.a(sunrpc.o): In function `rpc_create_client':
> > > > sunrpc.o(.text+0x360): undefined reference to `rpc_debug'
> > > 
> > > can't see why you're having trouble here.  those variables are defined in
> > > net/sunrpc/sysctl.c.  is that file being built?  i'm getting a toolchain
> > > up here so I can try to reproduce.  [Dead hard drives SUCK].
> > 
> > grant: did you have CONFIG_SYSCTL set ?  if you didn't, that might
> > explain your problems.
> 
> I think that's the case.  It's disabled by default if you make oldconfig,
> so I'll commit a new defconfig which has it enabled (and has some of
> the new options predefined).

Um.  That's definitely bad since then we don't have a sysrq_enabled definition.
(it's in drivers/char/keyboard.c which we don't use).  But now I've changed
it to `N', make dep, make clean, make vmlinux and I don't get those undefined
symbols.  Curioser and curioser.  My .config was generated from `make oldconfig'
with just hitting return for new options (ie answering `no').

> I'm hitting an undefined __shrdiv3 (or something... lost that error
> message, but it's one of those gcc-wants-64-bit-ops symbols).

__lshrdi3.  It's referenced from fs/nfs/inode.c.  I'm damned if I can
see where though (and I went through the gcc -E output trying to spot it.)
Does someone want to copy that from libgcc?  I'm going to lay down a tag
for end-of-merge now since I'm headed off for the weekend.
