From: "Matt Carlson" <mcarlson@broadcom.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 20 Apr 2009 13:46:16 -0700
Message-ID: <20090420204616.GA7243@xw6200.broadcom.net>
References: <20090418230015.GA32177@lackof.org>
 <C27F8246C663564A84BB7AB343977242177D75A059@IRVEXCHCCR01.corp.ad.broadcom.com>
 <20090419223201.GA22926@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Cc: "Michael Chan" <mchan@broadcom.com>,
	"Matthew Carlson" <mcarlson@broadcom.com>,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	"Parisc List" <linux-parisc@vger.kernel.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090419223201.GA22926@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 19, 2009 at 03:32:02PM -0700, Grant Grundler wrote:
> > > The data is not a byte stream (yet) since we used readl() to retrieve
> > > the value. Use cpu_to_le32() to convert what was originally an LE byte
> > > stream back to a LE byte stream.
> > >
> > > Using either __raw_read() or readb() would have avoided this
> > > confusion.
> > 
> > It's a 32-bit so we cannot use readb().  I don't think the chip will decode
> > the byte enables.
> 
> Ok. Thanks for clarifying.
> 
> > I don't like to use __raw_read() because it does not have
> > the same memory barrier as regular readl().
> 
> I don't think the memory barrier is necessary in the "get" case.
> wmb() is probably needed in the "set" case.
> 
> I was thinking that avoiding several byte swaps would make the code
> more maintainable and one wmb() could be explained with a comment.
> Remember, we are having this conversation because the MAC address
> was incorrectly ordered on BE machine. Seems that a "load from NVRAM"
> and "Store to HostMem" preserves the byte stream order in the same
> way memcpy would. And would be heck of a lot easier to understand.

While we could reduce some of the byte swaps, I'm not sure this
problem will be any easier to grok for that effort.

The confusion in this case stems from the fact that the SEEPROM
interface deals with data in LE format.  This fact violates rule that
the chip always deals with its data in BE format.

We can move the discussion so that we are instead talking about values
as they appear on the bus, but then that just means we need to
highlight that this data comes across the bus in BE format, when every
other value (including the flash interface data) comes across in
LE format.  IOW, no matter where we choose to couch the discussion,
we will still have to somehow convey that the behaviors are backwards
of every other chip access.

The approach you are proposing here hides the problem in the behavioural
differences between __raw_read() and readl().  The problem with this is
that someone at some point in the future wants to make the same
conversion / optimization to the flash interface.  That person will then
be confronted with this exact same problem.

If we really want to make the code more maintainable, I might try
giving the EEPROM it's own "read as value" and "read as bytestream"
functions instead.  This would effectively hide the difference behind
an API.  The intentions would (still) be clear and we would avoid the
pointless byteswap in tg3_nvram_read_using_eeprom() and swapback in
tg3_nvram_read_be32() when attempting to read the data as a bytestream.
Swapping the readl() for __raw_read() then becomes an exercise in
optimization, and we could apply it equally to the flash interface.

The problem with this proposal is that we'd still have the ugly
swap32(be32_to_cpu(data)) wart in tg3_nvram_write_block_using_eeprom().
I'm not sure how I'd want to make that prettier.

