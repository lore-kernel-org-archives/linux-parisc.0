From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 21:25:19 -0400
Message-ID: <20110418012519.GA25505@hiauly1.hia.nrc.ca>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca> <1303053807.2583.1.camel@mulgrave.site> <1303068487.2583.7.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303068487.2583.7.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 17 Apr 2011, James Bottomley wrote:

> On Sun, 2011-04-17 at 10:23 -0500, James Bottomley wrote:
> > It's most likely a driver module that's getting loaded which is turned
> > off in the booting configuration ... finding it isn't going to be easy,
> > though ...
> 
> Finally got a build (had to swap out -Os for -O2).

Didn't need this with the gcc 4.5.3 snapshot that I mentioned previously.

> I traced the module loads and successful inits and found it; it's
> pata_cmd64x  ... it loads but never returns from init.  I bet it's
> trying to poke into ISA space which causes the HPMC.
> 
> Removing this one module from the system allows it to boot again.

Confirm that removing this module restores boot.

This is excellent detective work.  If I might ask, how did you trace
the module loads and successful inits?

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
