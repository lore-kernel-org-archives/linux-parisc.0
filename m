Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA18137
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Feb 2000 11:29:22 -0700
From: willy@thepuffingroup.com
Date: Sat, 5 Feb 2000 13:26:13 -0500
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ang <mang@subcarrier.org>, parisc-linux@thepuffingroup.com
Message-ID: <20000205132613.A30976@thepuffingroup.com>
References: <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com> <20000205153759.A538@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000205153759.A538@alpha.franken.de>; from Thomas Bogendoerfer on Sat, Feb 05, 2000 at 03:37:59PM +0100
Subject: [parisc-linux] ELFness and 64bit
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 05, 2000 at 03:37:59PM +0100, Thomas Bogendoerfer wrote:
> > Willy mentioned that we will have to think about running on 64bit at some
> > point.
> 
> IMHO, it's way too early to even think about it. Of course 64bit is sexy,
> but without a working 32bit userland it's a too big can of worms to open
> right now. Linux/MIPS64 hasn't started before a reasonable distribution
> existed, and I'm sure this wasn't a bad descision then.

We want to get people working on userland as soon as possible since this
parallelises well with other people hacking on the kernel.  However, we
need to go 64-bit inorder to support the L-class and similar machines.
I also mentioned that we need ELF support RSN as it is hurting us quite
badly.  I know Sammy has been working on getting 32-bit ELF going on
his 712 for the kernel.  Sammy, how's that going?
