From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Mon, 05 Dec 2005 19:45:23 -0500
Message-ID: <1133829923.3262.1.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Russell King <rmk+pcmcia@arm.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051205220344.GJ15201@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2005-12-05 at 22:03 +0000, Russell King wrote:
> I don't have issue with the I/O side.  It's the memory side I'm
> wondering about.

I'm sorry, by I/O reads I mean memory.  PA doesn't have any I/O port
cycles (except those which are generated in the busses via mmio
read/write sequences).

> The probing code sets up a mapping to place the CIS at one of the
> regions, and then tries to validate/read the CIS.  It then unmaps
> it and maps it into the next place and repeats.  Hence, we're
> reading data from the PCMCIA card after setting up various valid
> mappings.

Yes, that's what crashes.  Any memory probe to a non-responding address
on PA causes a high priority machine check.  This is what trips us up.
We have to explicitly list the responding regions in the config file.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
