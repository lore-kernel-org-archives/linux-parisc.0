From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 5 May 2012 14:53:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.1205051448400.2623@file.rdu.redhat.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com>
 <20120505115851.1fecbe50@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120505115851.1fecbe50@pyramind.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 5 May 2012, Alan Cox wrote:

> On Fri, 4 May 2012 22:58:32 -0400 (EDT)
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Hi
> > 
> > This patch fixes compile failure on PA-RISC.
> > 
> > BTW. if the PA-RISC port is uncompilable for all 3.4-rc versions (and 
> > contains two other bugs that prevent it from booting) ... does it mean 
> > that I'm the only one who is using PA-RISC with recent kernel?
> 
> 
> Probably - and if so would you please get the NO_IRQ define fixed because
> it seems parisc also has no maintainer any more 8)
> 
> Alan

What NO_IRQ problem do you mean? There is
#define NO_IRQ          (-1)
in arch/parisc/include/asm/irq.h.

And there are other NO_IRQ definitions in other architectures, some 
defining it to ((unsigned int)(-1)), some to 0xffffffff, some to INT_MAX, 
some to (-1) and some to (0).

Some drivers define NO_IRQ too, if not defined by the architecture.

Mikulas
