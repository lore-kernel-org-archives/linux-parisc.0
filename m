From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 14:28:07 -0500
Message-ID: <1303068487.2583.7.camel@mulgrave.site>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
	 <1303053807.2583.1.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	622997@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303053807.2583.1.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-04-17 at 10:23 -0500, James Bottomley wrote:
> It's most likely a driver module that's getting loaded which is turned
> off in the booting configuration ... finding it isn't going to be easy,
> though ...

Finally got a build (had to swap out -Os for -O2).

I traced the module loads and successful inits and found it; it's
pata_cmd64x  ... it loads but never returns from init.  I bet it's
trying to poke into ISA space which causes the HPMC.

Removing this one module from the system allows it to boot again.

I'd suggest just disabling in the parisc config for now.  Using an ATA
based CD/DVD instead of a SCSI one is a very recent thing.  I'll see if
I can get it working, but ATA controllers tend to be somewhat nasty and
x86 specific ...

James


