From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 17:50:07 -0400 (EDT)
Message-ID: <20101023215008.37BC94D30@hiauly1.hia.nrc.ca>
References: <1287865777.3003.31.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, mikulas@artax.karlin.mff.cuni.cz,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1287865777.3003.31.camel@mulgrave.site> from "James Bottomley" at Oct 23, 2010 03:29:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > James, what kind of firmware update is needed?
> 
> I have no idea ... I'm only deducing this from what had to be done to
> ion to make it a 4-way.  We had similar upgrades to some of the A180s as
> well.  It is unusual for a workstation class system, but the "too many
> CPUs" message seems definitive.  Perhaps the firmware is essentially the
> same as a server class and it's inheriting this behaviour.

I agree the message appears definitive, but my impression from searching
the internet and the technical reference is that the c8000 doesn't require
firmware upgrades like the servers to add a processor module.

I see that various suppliers are selling processor upgrade modules
(AB630A : 900 MHz 32 MB L2) for c8000.  There are warnings that speed
and cache must match.  Some c8000s were sold without L2 cache, but
I don't see any processor modules without cache for sale.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
