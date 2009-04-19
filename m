From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Sun, 19 Apr 2009 16:32:02 -0600
Message-ID: <20090419223201.GA22926@lackof.org>
References: <20090418230015.GA32177@lackof.org> <C27F8246C663564A84BB7AB343977242177D75A059@IRVEXCHCCR01.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 'Grant Grundler' <grundler@parisc-linux.org>,
	Matthew Carlson <mcarlson@broadcom.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	"linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Michael Chan <mchan@broadcom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <C27F8246C663564A84BB7AB343977242177D75A059@IRVEXCHCCR01.corp.ad.broadcom.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 19, 2009 at 12:30:26AM -0700, Michael Chan wrote:
[ Deleted my comments about indirect function calls. ]
...
> We've had a lengthy discussion on this topic with DaveM and jgarzik many
> years ago.  Marc is down and I cannot find the archive.  It was agreed
> that the function pointer approach is better than a cascade of if -
> else if - else if approach.  The Branch target buffers in modern CPUs
> are supposed to be able to predict these function pointer branches
> if we are using the same method in the hot code path.

Ok - thanks. I can look for that.

...
> > The data is not a byte stream (yet) since we used readl() to retrieve
> > the value. Use cpu_to_le32() to convert what was originally an LE byte
> > stream back to a LE byte stream.
> >
> > Using either __raw_read() or readb() would have avoided this
> > confusion.
> 
> It's a 32-bit so we cannot use readb().  I don't think the chip will decode
> the byte enables.

Ok. Thanks for clarifying.

> I don't like to use __raw_read() because it does not have
> the same memory barrier as regular readl().

I don't think the memory barrier is necessary in the "get" case.
wmb() is probably needed in the "set" case.

I was thinking that avoiding several byte swaps would make the code
more maintainable and one wmb() could be explained with a comment.
Remember, we are having this conversation because the MAC address
was incorrectly ordered on BE machine. Seems that a "load from NVRAM"
and "Store to HostMem" preserves the byte stream order in the same
way memcpy would. And would be heck of a lot easier to understand.

thanks,
grant
