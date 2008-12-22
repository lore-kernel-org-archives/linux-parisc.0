From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 16:46:30 -0600
Message-ID: <1229985990.3345.47.camel@localhost.localdomain>
References: <20081219212906.GG8945@bombadil.infradead.org>
	 <20081221152017.102C84F19@hiauly1.hia.nrc.ca>
	 <20081221222005.GB30144@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221222005.GB30144@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-12-21 at 17:20 -0500, Kyle McMartin wrote:
> On Sun, Dec 21, 2008 at 10:20:16AM -0500, John David Anglin wrote:
> > > Honestly, I can't decide whether to apply this. It really should never
> > > happen in the kernel, since the kernel can guarantee it won't get the
> > > access rights failure (highest privilege level, and can set %sr and
> > > %protid to whatever it wants.)
> > 
> > I believe this change should be applied because we enable P and the
> > hardware can generate the exception.  Yes, it should never happen, but
> > the coding to prevent this occurring is very subtle.
> > 
> 
> If we're going to paper over a bug like this, we might as well just turn
> the P-bit off...

I'm afraid you can't.  The invisibility of the kernel space from user
space relies on this, as does quite a lot of the page protections.

James


