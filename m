Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA09839
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 18:17:58 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 30 Aug 2000 00:17:57 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13TvZg-0004Qt-00; Wed, 30 Aug 2000 01:17:52 +0100
Date: Wed, 30 Aug 2000 01:17:52 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>, Helge Deller <deller@gmx.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000830011752.A9854@parcelfarce.linux.theplanet.co.uk>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com> <20000829172308.A1032@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000829172308.A1032@vodka.thepuffingroup.com>; from matthew@wil.cx on Tue, Aug 29, 2000 at 05:23:08PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 29, 2000 at 05:23:08PM -0400, Matthew Wilcox wrote:
> > Helge Deller wrote some code in drivers/net/lasi_82596.c that plays
> > with %sr1 and uses FDC, FIC, PDC, SYNC, and SYNCDMA.

> #define kernel_fdc(addr) asm volatile("fdc 0(%%sr0,%0)" : : "r" (addr))
> 
> however, the resulting kernel wouldn't boot.  So let's take this a
> step at a time and see how far we can go towards eliminating the *E
> variants.  I've written a little rant on this suject which you can find
> in linux-2.3/Documentation/parisc/mm.  feel free to ignore it if you want.

ok.  we now have interfaces for flushing kernel dcache.  I'm assuming
that no-one is intending to dma to/from an instruction page, so i
haven't included an icache variant.  i'm not using sync or syncdma yet.
perhaps i should be.  are we out-of-order right now or have we told the
MMU to strongly order our writes?

Anyway, would either of Richard or Helge like to look over the lasi_82596
driver and convert it to use the flush_kernel_dcache_range() interface
or tell me why my code is no good and I suck?  Ditto the sim700 driver
actually.  Are there any other drivers which have simply taken the
lasi_82596 wback code and replicated it or are these the only two?
