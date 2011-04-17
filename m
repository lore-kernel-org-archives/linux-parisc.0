From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Bug#622997: Debian bug 622997
Date: Sun, 17 Apr 2011 18:33:37 -0500
Message-ID: <1303083217.2583.14.camel@mulgrave.site>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
	 <1303053807.2583.1.camel@mulgrave.site>
	 <1303068487.2583.7.camel@mulgrave.site>
	 <1303069050.5282.943.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: 622997@bugs.debian.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303069050.5282.943.camel@localhost>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-04-17 at 20:37 +0100, Ben Hutchings wrote:
> On Sun, 2011-04-17 at 14:28 -0500, James Bottomley wrote:
> > I traced the module loads and successful inits and found it; it's
> > pata_cmd64x  ... it loads but never returns from init.  I bet it's
> > trying to poke into ISA space which causes the HPMC.
> > 
> > Removing this one module from the system allows it to boot again.
> [...]
> 
> We also had a recent report that this driver is also bust on some sparc
> systems.  We could swap back to cmd64x on these architectures but I
> would rather get pata_cmd64x fixed.

Well, I've got a working pata_cm64x (and now a working CD drive).

The specific issue on parisc (and probably sparc) is that we're using
this siimage chip hard wired to a single DVD drive.  We have no use for
a secondary port, so there isn't one.  The registers for the secondary
port are pointing off into empty space.  When libata-sff tries to touch
the secondary port, we get an instant High Priority Machine Check
because on most non-x86 systems, it's a fault to touch non-responding
memory.

I got it to work by making libata-sff only probe a single port.  Now,
here's the problem: the libata-sff driver is hardwired to probe two
ports, so it will require major surgery to check dynamically how many
ports there are ... and the second problem is that I don't even know how
to check this.  I'll ask about this on linux-ide.

James


