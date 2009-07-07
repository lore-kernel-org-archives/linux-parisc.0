From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: HPPA and Squeeze
Date: Tue, 07 Jul 2009 09:22:23 -0500
Message-ID: <1246976543.4522.14.camel@mulgrave.site>
References: <119aab440907060936x7051933fgfde585df640ca1b1@mail.gmail.com>
	 <20090706184539.5A76D4FE0@hiauly1.hia.nrc.ca>
	 <20090706214315.GA3826@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, randolph@tausq.org,
	deller@gmx.de, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706214315.GA3826@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-07-06 at 17:43 -0400, Kyle McMartin wrote:
> On Mon, Jul 06, 2009 at 02:45:37PM -0400, John David Anglin wrote:
> > I have to think that this has something to do with the machine
> > being a rp3440 (large memory and cache).  I have never seen this
> > on my c3750 with 32-bit UP kernel.  Also, this was with a 64-bit
> > UP kernel.
> > 
> 
> If I remember correctly, there's still some issues with the L2 cache on
> pa8800 that we haven't quite bothered to work out yet, since it's "good
> enough" for now. James probably knows more. It would be interesting to
> see if you could reproduce it with a UP 64-bit kernel on your C3750 to
> discount the L2 problems.

The pa8800/8900 are very special systems.  They have an L1/L2 VIPT cache
but an L2 PIPT one.  All other parisc systems have VIPT throughout.

The problem with the VIPT/PIPT combination is that you can get read only
stale alias resolution between the VIPT/PIPT hierarchy ... linux just
doesn't expect this to happen.  We work around this with extra flushes
in kmap to prevent the read only alias resolution from happening.
There's nothing missing in the logic of this, the only problem is that
its operation treats the vast L2 PIPT cache as a useless boat anchor
whose only job is to make life harder for us ... so we're getting
absolutely no benefit from the 25-50MB of cache there.

James


