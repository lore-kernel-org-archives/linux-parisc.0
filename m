From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Mon, 05 Dec 2005 16:32:19 -0500
Message-ID: <1133818340.3395.11.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Russell King <rmk+pcmcia@arm.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051204103338.GA16791@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-12-04 at 10:33 +0000, Russell King wrote:
> On Sun, Dec 04, 2005 at 01:04:23AM -0500, Kyle McMartin wrote:
> > PCMCIA port and memory probing is broken on parisc, disabling both
> > allows the PCMCIA subsystem to work on parisc systems.
> 
> Do you know why it's broken?
> 
> The memory probing works by mapping the CIS into memory and then trying
> to read it.  If you're saying it's broken, that implies that we can't
> read the CIS, and therefore we can't use the addresses being probed.

On parisc, any read to a region that doesn't respond HPMCs (crashes) the
box.  PA also has separated I/O space, so most random I/O reads are of
non-responding regions.

My solution was simply to force the pcmcia subsystem not to probe and
instead believe the map we passed in from the pcmcia daemon.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
