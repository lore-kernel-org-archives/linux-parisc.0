From: "Matt Carlson" <mcarlson@broadcom.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Tue, 14 Apr 2009 12:02:32 -0700
Message-ID: <20090414190232.GA12600@xw6200.broadcom.net>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com>
 <20090413180052.GB11076@xw6200.broadcom.net>
 <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
 <20090413183725.GC11109@xw6200.broadcom.net>
 <1239655698.3278.83.camel@mulgrave.int.hansenpartnership.com>
 <20090414011710.GA11615@xw6200.broadcom.net>
 <20090414153911.GA22011@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Cc: "Matthew Carlson" <mcarlson@broadcom.com>,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	"Parisc List" <linux-parisc@vger.kernel.org>,
	"Michael Chan" <mchan@broadcom.com>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090414153911.GA22011@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 14, 2009 at 08:39:11AM -0700, Grant Grundler wrote:
> On Mon, Apr 13, 2009 at 06:17:10PM -0700, Matt Carlson wrote:
> > Sorry for the delay.  I just ran the same experiment on an ia64 we have
> > in-house.  The results were the same.  The machine was a HP integrity
> > BL870C pre-production blade with dual 5704S LOMs.  More responses
> > inline.
> 
> Matt,
> sorry - why test this on ia64?
> ia64 is also little endian.
> parisc is big endian.

Like Michael said in another post, Robin Holt experienced a similar (the
same?) problem on an IA64.  We were thinking that a problem reproduction
on one machine might imply the same problem on the other.

> > On Mon, Apr 13, 2009 at 01:48:18PM -0700, James Bottomley wrote:
> > > On Mon, 2009-04-13 at 11:37 -0700, Matt Carlson wrote:
> > > > But that is exactly what the code is doing.  tg3_nvram_read_be32() will
> > > > return the data in bytestream format.  A memcpy() should be all that is
> > > > needed to transport the data to a different memory location.
> > > 
> > > But not the one you've done.  cpu_to_be32 is a nop pass through on our
> > > architecture, so tg3_nvram_read_be32 is equivalent to tg3_nvram_read on
> > > our architecture (i.e. identical to the code that was doing the read in
> > > 2.6.29).
> > 
> > tg3_nvram_read() returns a 32-bit word of NVRAM data, swapped according to
> > the byteswapping rules for all register accesses.
> 
> Lets review that calling order I found in 2.6.29-rc8:
> 	tg3_nvram_read -> tr32 -> tg3_read32 -> readl -> swab
> 
> o The swab is actually in tg3_nvram_read.

Right.

> o one should be able to get rid of indirect function call in tr32.

Well, there are situations where the read operation needs to be done
using a different method.  So that the reader could concentrate on the
higher-level algorthm, we hide the implementation details of the read
through a function pointer.

> >  On big endian machines,
> > the data returned will be exactly as it would have been in NVRAM.  On
> > little endian machines, the data will be swapped when compared to a raw
> > read of the NVRAM.
> 
> Is this referring to the returned value from readl() or from tg3_nvram_read()?

It is referring to the value from readl().

> The readl() return value will be the same in both LE and BE architectures.
> readl() adjusts for endianess.
> __raw_readl() does not.
>
> > To bring the data back to a bytestream format on LE
> > systems, a swap is needed. 
> 
> For the above code path, if swap is needed on LE, it's also needed on BE.

Well, the 32-bit _value_ will be the same on architectures of either endianness.
But our goal is to deal with the data as a bytestream.  Consequently a
swap is needed.

For example, reading offset 0x0 of NVRAM (for legacy NVRAM formats)
readl will always produce a value of 0x669955aa.  On LE machines, this 32-bit
value will be laid out as :

  i             i + 3
  |               |
  V               V
---------------------
| aa | 55 | 99 | 66 |
---------------------

On BE machines, the byte ordering is obviously reversed.  To do a
memcpy, the bytes must be in the BE format.

> > After that, a memcpy should be all that is
> > required to extract the MAC address.
> > 
> > Code that operates on data in a bytestream format will necessarily look
> > different than code that operates on data as a 32-bit native endian
> > quantity.  The code changes can look a bit drastic and are easily
> > culpable at first glance.
> 
> This is true for code paths that deal with DMA data. It's not true
> for readl() or writel() since those are already taking care of
> the endianess.

Again, think bytestream.

> > > However, the memcpy is the wrong way around for us.
> > 
> > It shouldn't be, and that is the problem.  We are trying to determine
> > why the data isn't in the form we think it should be in.  The most
> > difficult part of this discussion is convincing ourselves that the end
> > result is the same, even though the path to get there changes in
> > significant ways.
> 
> It's not that hard. readl() is already compensating for endianess.
> 
> > The old code read the data from NVRAM, did a blind swap of the data and
> > then operated on that data as a 32-bit quantity.  The blind swap was
> > completely superfluous and only changed which byte the driver attempted
> > to get its data.
> 
> The swap is not superfluous if one is using memcpy.
>
> >  An important property of this version is that the
> > same code when working with machines of either endianness.
> > 
> > If you are with me this far, then hopefully you can see that, while the
> > two versions of the code appear different, they wind up with the same
> > result.  The change was made because the code became much more readable
> > when we describe the operations as a bytestream.
> 
> I think james already demonstrated that the result is not the same.
> 
> I'll stop here since most of the discussion is based on not knowing
> that readl() takes care of endianess.

Yes.  I think the discussion will be resolved once we distinguish
between operating on the data as a value and operating on the data as a
bytestream.

