From: Russell King <rmk+pcmcia@arm.linux.org.uk>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Mon, 5 Dec 2005 22:03:44 +0000
Message-ID: <20051205220344.GJ15201@flint.arm.linux.org.uk>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1133818340.3395.11.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 05, 2005 at 04:32:19PM -0500, James Bottomley wrote:
> On Sun, 2005-12-04 at 10:33 +0000, Russell King wrote:
> > On Sun, Dec 04, 2005 at 01:04:23AM -0500, Kyle McMartin wrote:
> > > PCMCIA port and memory probing is broken on parisc, disabling both
> > > allows the PCMCIA subsystem to work on parisc systems.
> > 
> > Do you know why it's broken?
> > 
> > The memory probing works by mapping the CIS into memory and then trying
> > to read it.  If you're saying it's broken, that implies that we can't
> > read the CIS, and therefore we can't use the addresses being probed.
> 
> On parisc, any read to a region that doesn't respond HPMCs (crashes) the
> box.  PA also has separated I/O space, so most random I/O reads are of
> non-responding regions.

I don't have issue with the I/O side.  It's the memory side I'm
wondering about.

The probing code sets up a mapping to place the CIS at one of the
regions, and then tries to validate/read the CIS.  It then unmaps
it and maps it into the next place and repeats.  Hence, we're
reading data from the PCMCIA card after setting up various valid
mappings.

These mappings are not much different from the mappings which are
used to interpret the CIS data from the card after the memory
probing has completed.

Hence, if the memory probing is causing you issues, I'd be concerned
about the reliability of reading the CIS data from the card under
the non-probing scenarios.

Alternatively, maybe you've found a real bug somewhere in PCMCIA
which needs fixing...

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
