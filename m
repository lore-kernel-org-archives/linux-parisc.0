Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA30616
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 14:20:16 -0700
Date: Tue, 8 Feb 2000 15:15:26 -0500 (EST)
From: Sam Creasey <sammy@sammy.net>
To: willy@thepuffingroup.com
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ang <mang@subcarrier.org>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELFness and 64bit
In-Reply-To: <20000205132613.A30976@thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0002081511370.28088-100000@sammyville.sammy.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Sat, 5 Feb 2000 willy@thepuffingroup.com wrote:

> On Sat, Feb 05, 2000 at 03:37:59PM +0100, Thomas Bogendoerfer wrote:
> > > Willy mentioned that we will have to think about running on 64bit at some
> > > point.
> > 
> > IMHO, it's way too early to even think about it. Of course 64bit is sexy,
> > but without a working 32bit userland it's a too big can of worms to open
> > right now. Linux/MIPS64 hasn't started before a reasonable distribution
> > existed, and I'm sure this wasn't a bad descision then.
> 
> We want to get people working on userland as soon as possible since this
> parallelises well with other people hacking on the kernel.  However, we
> need to go 64-bit inorder to support the L-class and similar machines.
> I also mentioned that we need ELF support RSN as it is hurting us quite
> badly.  I know Sammy has been working on getting 32-bit ELF going on
> his 712 for the kernel.  Sammy, how's that going?

heh...  welll....   I'm getting a better understanding of parts of the
problem, if that makes anyone feel better. :)

I've actually got a kernel together than compiles and links in a fairly
sane manner...  except for the .data segment, which will, eventually, get
badly munged..  It's looking like a linker error revolving around certain
types of relocations that don't quite work right.  further investigation
is still needed, but I've not had time for the last week or so.
