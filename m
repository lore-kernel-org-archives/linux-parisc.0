From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: [parisc-linux] Splitted lasi_82596 driver
Date: Sun, 22 Apr 2007 15:06:26 +0200
Message-ID: <20070422130626.GA6828__48593.6211691753$1416624340$gmane$org@alpha.franken.de>
References: <20070415144209.GA11196@alpha.franken.de> <200704211614.19496.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <tsbogend@alpha.franken.de>
In-Reply-To: <200704211614.19496.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 21, 2007 at 04:14:19PM +0200, Helge Deller wrote:
> Tests sucessfully passed on my B160L :-)

thanks for testing.

I did some more changes, so I could use it wie coherent dma memory on
the SNI machines (otherwise I would have to pad all descriptors to
64bytes, because of the 64 byte L2 cacheline size on the R4400 bases
machines). I've testet this version on my B132L and it's working like
the unmodified driver.

> > Are there any other things, which should be improved in the driver,
> > before I'm going to submit this driver ?
> 
> Some basic ethtool support would be a nice-to-have.
> E.g. name/driver name/Available speeds/link up&down/...

no problem, as there are basically static values. Even link detection
would be more or less a "return some_old_state", because the hardware
does only link monitoring during transmits.

My current plan is to submit the changes for inclusion into 2.6.22 and
do enhancments after that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
