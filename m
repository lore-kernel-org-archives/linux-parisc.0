From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Wierd code in Entry.S
Date: Wed, 15 Jul 2009 00:38:00 -0600
Message-ID: <20090715063800.GA26739@lackof.org>
References: <20090710155559.CFAA44FC4@hiauly1.hia.nrc.ca> <1247242701.3936.28.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1247242701.3936.28.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 10, 2009 at 11:18:21AM -0500, James Bottomley wrote:
> On Fri, 2009-07-10 at 11:55 -0400, John David Anglin wrote:
...
> > Your comment would explain why I
> > don't see this on c3750.  Could this affect PA8700?
> 
> In theory it would affect every box running a 64 bit kernel.

Yes, regarding corrupting bit-44 but not U-bit.

IIRC, only pa880 and pa8900 pay attention to the U-bit.
I thought all the previous CPUs ignored U-bit.

> We
> actually set PAGE_NO_CACHE on ioremaps(), so it's spreading out from the
> PCI device space.

Yes - but only ZX1 chipset (e.g. rp3440 and C8000) uses IO space that
is outside of F-space. F-space is hardwired to be uncachable by the CPU.

hth,
grant
