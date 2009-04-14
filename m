From: "Matt Carlson" <mcarlson@broadcom.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 18:17:10 -0700
Message-ID: <20090414011710.GA11615@xw6200.broadcom.net>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com>
 <20090413180052.GB11076@xw6200.broadcom.net>
 <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
 <20090413183725.GC11109@xw6200.broadcom.net>
 <1239655698.3278.83.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Cc: "Matthew Carlson" <mcarlson@broadcom.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	"Parisc List" <linux-parisc@vger.kernel.org>,
	"Michael Chan" <mchan@broadcom.com>
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1239655698.3278.83.camel@mulgrave.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sorry for the delay.  I just ran the same experiment on an ia64 we have
in-house.  The results were the same.  The machine was a HP integrity
BL870C pre-production blade with dual 5704S LOMs.  More responses
inline.

On Mon, Apr 13, 2009 at 01:48:18PM -0700, James Bottomley wrote:
> On Mon, 2009-04-13 at 11:37 -0700, Matt Carlson wrote:
> > But that is exactly what the code is doing.  tg3_nvram_read_be32() will
> > return the data in bytestream format.  A memcpy() should be all that is
> > needed to transport the data to a different memory location.
> 
> But not the one you've done.  cpu_to_be32 is a nop pass through on our
> architecture, so tg3_nvram_read_be32 is equivalent to tg3_nvram_read on
> our architecture (i.e. identical to the code that was doing the read in
> 2.6.29).

tg3_nvram_read() returns a 32-bit word of NVRAM data, swapped according to
the byteswapping rules for all register accesses.  On big endian machines,
the data returned will be exactly as it would have been in NVRAM.  On
little endian machines, the data will be swapped when compared to a raw
read of the NVRAM.  To bring the data back to a bytestream format on LE
systems, a swap is needed.  After that, a memcpy should be all that is
required to extract the MAC address.

Code that operates on data in a bytestream format will necessarily look
different than code that operates on data as a 32-bit native endian
quantity.  The code changes can look a bit drastic and are easily
culpable at first glance.

> However, the memcpy is the wrong way around for us.

It shouldn't be, and that is the problem.  We are trying to determine
why the data isn't in the form we think it should be in.  The most
difficult part of this discussion is convincing ourselves that the end
result is the same, even though the path to get there changes in
significant ways.

The old code read the data from NVRAM, did a blind swap of the data and
then operated on that data as a 32-bit quantity.  The blind swap was
completely superfluous and only changed which byte the driver attempted
to get its data.  An important property of this version is that the
same code when working with machines of either endianness.

If you are with me this far, then hopefully you can see that, while the
two versions of the code appear different, they wind up with the same
result.  The change was made because the code became much more readable
when we describe the operations as a bytestream.

> If you look at an example, the original code said
> 
> dev_addr[0] = hi >> 16;
> dev_addr[1] = hi >> 24
> 
> So MSB-1 and MSB.  However, on a BE machine these are at offset one and
> zero from the start of the word.  The replacement memcopy is:
> 
> memcpy(&dev->dev_addr[0], ((char *)&hi) + 2, 2)
> 
> i.e. offset 3 and 4, which actually copies LSB-1 and LSB into there.
> You can follow similar logic to show that the lo copy is wrong too.

Yes.  The code will be different depending on whether you treat the data
as a native endian 32-bit word or as a 4 byte segment of a bytestream.

> Perhaps the fix is just to put the tg3_nvram_read() back as well as the
> original by loads?

The code is much more readable with the changes in place.  I'd rather
not back them out.  I'd like to find out why you are getting different
results than I am with my tests.

I just saw your NVRAM dump post.  Perhaps that'll shed some light on the
matter.

