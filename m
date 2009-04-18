From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Sat, 18 Apr 2009 17:00:16 -0600
Message-ID: <20090418230015.GA32177@lackof.org>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com> <20090413180052.GB11076@xw6200.broadcom.net> <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com> <20090413183725.GC11109@xw6200.broadcom.net> <1239655698.3278.83.camel@mulgrave.int.hansenpartnership.com> <20090414011710.GA11615@xw6200.broadcom.net> <20090414153911.GA22011@lackof.org> <20090414190232.GA12600@xw6200.broadcom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Michael Chan <mchan@broadcom.com>
To: Matt Carlson <mcarlson@broadcom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090414190232.GA12600@xw6200.broadcom.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is settled already I think...just following up to complete
the conversation. Was "Out of Office" this past week.

On Tue, Apr 14, 2009 at 12:02:32PM -0700, Matt Carlson wrote:
...
> > > tg3_nvram_read() returns a 32-bit word of NVRAM data, swapped according to
> > > the byteswapping rules for all register accesses.
> > 
> > Lets review that calling order I found in 2.6.29-rc8:
> > 	tg3_nvram_read -> tr32 -> tg3_read32 -> readl -> swab
> > 
> > o The swab is actually in tg3_nvram_read.
> 
> Right.
> 
> > o one should be able to get rid of indirect function call in tr32.
> 
> Well, there are situations where the read operation needs to be done
> using a different method.  So that the reader could concentrate on the
> higher-level algorthm, we hide the implementation details of the read
> through a function pointer.

I agree with "why" (problems demand it) but think "how" (implementation)
could be better. Indirect function calls are usually the next most
"expensive" operation after cache misses because they are not predictable
to the CPU (data dependency). I don't know as much about the compiler
behavior with respect to indirect function calls but expect the compiler
can't optimize well either.  So I usually prefer to only see indirect
function calls for "public" APIs and not internal functions.

So what are alternatives?
1) Embedding the choice in tr32() is the first obvious one. is use
   a switch statement and call the respective functions. The compiler
   can inline all the functions into one block since they are
   only being called from one place. Net cost is an extra branch.

2) Not as good as (1), but redefine tr32() to be a macro that is
   an indirect function call.  Maybe that's already happening via
   compiler inlining and I'm being obtuse. 

(1) would make code path explicit to HW/SW and work roughly the same
on all architectures.


> > >  On big endian machines,
> > > the data returned will be exactly as it would have been in NVRAM.  On
> > > little endian machines, the data will be swapped when compared to a raw
> > > read of the NVRAM.
> > 
> > Is this referring to the returned value from readl() or from tg3_nvram_read()?
> 
> It is referring to the value from readl().

Ok - than I hope it's clear the original assertion is not correct.

> 
> > The readl() return value will be the same in both LE and BE architectures.
> > readl() adjusts for endianess.
> > __raw_readl() does not.
> >
> > > To bring the data back to a bytestream format on LE
> > > systems, a swap is needed. 
> > 
> > For the above code path, if swap is needed on LE, it's also needed on BE.
> 
> Well, the 32-bit _value_ will be the same on architectures of either endianness.
> But our goal is to deal with the data as a bytestream.

Ok. This makes sense. But then maybe use __raw_read in this particular case?
Is it possible to read the bytes one at a time?

>  Consequently a > swap is needed.
> 
> For example, reading offset 0x0 of NVRAM (for legacy NVRAM formats)
> readl will always produce a value of 0x669955aa.  On LE machines, this 32-bit
> value will be laid out as :
> 
>   i             i + 3
>   |               |
>   V               V
> ---------------------
> | aa | 55 | 99 | 66 |
> ---------------------
> 
> On BE machines, the byte ordering is obviously reversed.  To do a
> memcpy, the bytes must be in the BE format.

memcpy() doesn't care which "order" bytes are in.
It treats the source/dest memory regions as byte streams as well.

> 
> > > After that, a memcpy should be all that is
> > > required to extract the MAC address.
> > > 
> > > Code that operates on data in a bytestream format will necessarily look
> > > different than code that operates on data as a 32-bit native endian
> > > quantity.  The code changes can look a bit drastic and are easily
> > > culpable at first glance.
> > 
> > This is true for code paths that deal with DMA data. It's not true
> > for readl() or writel() since those are already taking care of
> > the endianess.
> 
> Again, think bytestream.

The data is not a byte stream (yet) since we used readl() to retrieve
the value. Use cpu_to_le32() to convert what was originally an LE byte
stream back to a LE byte stream.

Using either __raw_read() or readb() would have avoided this confusion.


> > I'll stop here since most of the discussion is based on not knowing
> > that readl() takes care of endianess.
> 
> Yes.  I think the discussion will be resolved once we distinguish
> between operating on the data as a value and operating on the data as a
> bytestream.

Personally, it's easier for me compare "CPU register data" (aka "value")
vs "data in Memory" (which is inherently a byte stream). The CPU is the
one that is imposing an endianness to multi-byte data in memory.

thanks,
grant
