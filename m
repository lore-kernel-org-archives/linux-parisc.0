Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA18747
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Mar 2000 15:13:39 -0700
Date: Sun, 12 Mar 2000 22:13:55 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: "Brian S. Julin" <bri@mojo.calyx.net>, g@abacus.local
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] HIL_BASE ("finding" devices)
Message-ID: <20000312221355.H5281@abacus.local>
References: <MDAEMON80008200003111913.AA1339046@xanaxis.dyndns.org> <Pine.BSO.4.21.0003121544180.20661-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003121544180.20661-100000@mojo.calyx.net>; from bri@mojo.calyx.net on Sun, Mar 12, 2000 at 03:52:52PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 12, 2000 at 03:52:52PM -0500, Brian S. Julin wrote:
> I've only just really started to hack at the HIL driver, but
> one thing I noticed off the bat is that the HIL_BASE defined
> in hil.h is 0xf0821000 while the device base listed when 
> I boot for the HIL is 0xf0201000.  This probably means it 
> varies across different models.

It probably does.   AFAIK, the HIL driver is pretty much a hack
Matthew did to get his 715's keyboard working (the 715 and keyboard
are here now and Matthew is in Ottawa, and I don't have it set up
so didn't work on the driver).

> Optimally I suppose the best thing would be to somehow 
> find the device -- the code that prints out the hardware 
> found seems to get strings from the "pdc" which I glean is
> the "BIOS".  I suppose the only thing the HIL will have that
> is unique is this string, or are there model invariant 
> numbers like the PCI fn?

There are indeed, hversion and sversion are the words you're looking
for.  See the register_driver for the current (broken IMHO) interface.

> Alternatively I suppose we could do what the alpha folk
> have done and have a compile-time selection of the system type
> (e.g. "avanti") which sets the values for various things like that.

No way.  The "machine vector" concept wouldn't work well for us - it
works for ppc and alpha because those machines usually have a relatively
limited number of setups - with most chipsets, you can only use one CPU
type;  Lasi is used with PA7100LC, PA7300LC, PA8000, PA8200, and PA8500,
and shares code with the PA7100 (?) version (ASP) as well.  Furthermore
PDC device detection is sane to a certain extent - a lot of devices PDC
doesn't tell us about though.

	Philipp Rumpf
