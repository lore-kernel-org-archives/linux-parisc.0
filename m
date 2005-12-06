From: Russell King <rmk+pcmcia@arm.linux.org.uk>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 6 Dec 2005 09:36:44 +0000
Message-ID: <20051206093643.GA1706@flint.arm.linux.org.uk>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<1133829923.3262.1.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1133829923.3262.1.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 05, 2005 at 07:45:23PM -0500, James Bottomley wrote:
> On Mon, 2005-12-05 at 22:03 +0000, Russell King wrote:
> > The probing code sets up a mapping to place the CIS at one of the
> > regions, and then tries to validate/read the CIS.  It then unmaps
> > it and maps it into the next place and repeats.  Hence, we're
> > reading data from the PCMCIA card after setting up various valid
> > mappings.
> 
> Yes, that's what crashes.  Any memory probe to a non-responding address
> on PA causes a high priority machine check.  This is what trips us up.
> We have to explicitly list the responding regions in the config file.

I don't think you've fully understood what I've been saying.
When we try to do memory probing, we setup a mapping in the same
way that we setup a mapping to read the CIS from the card.

Therefore, when we read from the regions we're probing, we should
see valid CIS data.  Therefore, we are _not_ accessing an address
which doesn't respond, but we're accessing an address which we've
asked the PCMCIA bridge to map the card memory to.

If the hardware decides that, despite us setting up such a mapping,
the address we're accessing is not valid, then rather than disabling
the probing we should not ask PCMCIA to use it because the address
range is not available.

In either case, if the memory probe fails in some way, the solution
is not to disable it because then you're just papering over whatever
real problem exists.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
