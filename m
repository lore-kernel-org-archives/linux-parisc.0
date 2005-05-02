From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Mon, 2 May 2005 10:00:47 -0600
Message-ID: <20050502160047.GA20612@colo.lackof.org>
References: <20050501074901.GA13801@colo.lackof.org>
	<1114975460.4788.27.camel@mulgrave>
	<20050502000833.GE17998@colo.lackof.org>
	<1114993898.4788.47.camel@mulgrave>
	<20050502041244.GA1601@colo.lackof.org>
	<1115045510.5006.7.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1115045510.5006.7.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 02, 2005 at 09:51:50AM -0500, James Bottomley wrote:
> On Sun, 2005-05-01 at 22:12 -0600, Grant Grundler wrote:
> >         Memory at c0800000 (64-bit, non-prefetchable) [size=1M]
> >         Memory at c0000000 (64-bit, prefetchable) [size=8M]
> 
> Exactly ... that's the 3rd gigabyte; I assume there's no physical memory
> there, so the pfnnid_map is 0xff (except the bit where the io region
> check works).

ok

> However, there's a total screw up here: 0xc0000000 is outside of our
> premapped I/O region (0xf0000000-0xffffffff) so one of our assumptions
> about pa is broken; either the mercury doesn't obey the I/O window rules
> and we need to update the OS,

We need to update the OS.

> or the card has the wrong address.

The card has the right address for the Rope it's under.
THis is a ZX1 chipset. Similar to N-class, MMIO space is 2-4GB address.

> > CPU1 IOAQ 0x101011b0 flush_data_cache_local+8
> > CPU1 GR02 0x10113b04 update_mmu_cache+94
> > 
> > 
> > Looks like CPU1 died right away trying to flush an uncacheable region.
> > No surprise that didn't work too well.
> > 
> > And no clue what's up with CPU0.
> 
> CPU0 was probably executing a different thread when it was halted by the
> HPMC.

Maybe. The fact that it died early in the routine suggests otherwise.

> flushing an uncacheable area doesn't cause a HPMC,

This is the part I'm not sure about. John Marvin?

> but flushing a non-existent (and non-responding) area would ...

Yes, probably.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
