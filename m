Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA00887
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 May 2000 12:00:50 -0600
Message-ID: <20000527120048.B664@puffin.external.hp.com>
Date: Sat, 27 May 2000 12:00:48 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: willy@thepuffingroup.com
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
References: <200005262326.QAA09671@milano.cup.hp.com> <20000526233720.E31075@thepuffingroup.com> <20000526204522.B24675@puffin.external.hp.com> <20000527000805.G31075@thepuffingroup.com> <20000527005646.H31075@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000527005646.H31075@thepuffingroup.com>; from willy@thepuffingroup.com on Sat, May 27, 2000 at 12:56:46AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 27, 2000 at 12:56:46AM -0400, willy@thepuffingroup.com wrote:
> On Sat, May 27, 2000 at 12:08:05AM -0400, willy@thepuffingroup.com wrote:
> > On Fri, May 26, 2000 at 08:45:22PM -0600, Philipp Rumpf wrote:
> > > > > fs/fs.o: In function `L1184':
> > > > > fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
> > > > > net/network.a(sunrpc.o): In function `rpc_create_client':
> > > > > sunrpc.o(.text+0x360): undefined reference to `rpc_debug'
> > > > 
> > > > can't see why you're having trouble here.  those variables are defined in
> > > > net/sunrpc/sysctl.c.  is that file being built?  i'm getting a toolchain
> > > > up here so I can try to reproduce.  [Dead hard drives SUCK].
> > > 
> > > grant: did you have CONFIG_SYSCTL set ?  if you didn't, that might
> > > explain your problems.
> > 
> > I think that's the case.  It's disabled by default if you make oldconfig,
> > so I'll commit a new defconfig which has it enabled (and has some of
> > the new options predefined).
> 
> Um.  That's definitely bad since then we don't have a sysrq_enabled definition.
> (it's in drivers/char/keyboard.c which we don't use).  But now I've changed
> it to `N', make dep, make clean, make vmlinux and I don't get those undefined
> symbols.  Curioser and curioser.  My .config was generated from `make oldconfig'
> with just hitting return for new options (ie answering `no').
> 
> > I'm hitting an undefined __shrdiv3 (or something... lost that error
> > message, but it's one of those gcc-wants-64-bit-ops symbols).
> 
> __lshrdi3.  It's referenced from fs/nfs/inode.c.  I'm damned if I can
> see where though (and I went through the gcc -E output trying to spot it.)

it's Logical SHift Right DI (i.e. 8 byte).  I.e. somethnig like

u64 foo, bar;

bar = foo >> 7;

if you do s/u64/s64/ in the example, it would generate a call to __ashrdi3,
which we have code in arch/parisc/lib/ashrdi3.c for.  Now look at m68k.
They have code for lshrdi3 in the same place as for ashrdi3.  So, it would
be logical for us to do the same, and I have, in my tree, a few weeks ago
</hint>.
	
	Philipp Rumpf
