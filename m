Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA00686
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 May 2000 11:56:31 -0600
Message-ID: <20000527115629.A664@puffin.external.hp.com>
Date: Sat, 27 May 2000 11:56:29 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: willy@thepuffingroup.com
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] -pre8 merge status
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
> 
> I'm hitting an undefined __shrdiv3 (or something... lost that error
> message, but it's one of those gcc-wants-64-bit-ops symbols).

lshrdi3 ?  that should be supplied in arch/parisc/lib but isn't.

if it has mul in it, maybe the nfs code wasn't fixed not to use 64-bit
multiplies.  a rather hacky fix for that would be

+++ linux/fs/nfs/nfs2xdr.c      Sun May 14 03:31:27 2000
@@ -658,9 +658,9 @@
        res->maxfilesize = 0x7FFFFFFF;  /* just a guess */
        res->bsize  = ntohl(*p++);
 
-       res->tbytes = ntohl(*p++) * res->bsize;
-       res->fbytes = ntohl(*p++) * res->bsize;
-       res->abytes = ntohl(*p++) * res->bsize;
+       res->tbytes = ntohl(*p++) * ((u32)res->bsize);
+       res->fbytes = ntohl(*p++) * ((u32)res->bsize);
+       res->abytes = ntohl(*p++) * ((u32)res->bsize);
        res->tfiles = 0;
        res->ffiles = 0;
        res->afiles = 0;

but istr it was discussed on l-k and fixed.

Sigh.  Is it really fun for you to run into the very same problems I
had while merging with 2.3.99-pre6 ?

	Philipp Rumpf
