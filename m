From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Mon, 02 May 2005 09:51:50 -0500
Message-ID: <1115045510.5006.7.camel@mulgrave>
References: <20050501074901.GA13801@colo.lackof.org>
	<1114975460.4788.27.camel@mulgrave>
	<20050502000833.GE17998@colo.lackof.org>
	<1114993898.4788.47.camel@mulgrave>
	<20050502041244.GA1601@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050502041244.GA1601@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-05-01 at 22:12 -0600, Grant Grundler wrote:
>         Memory at c0800000 (64-bit, non-prefetchable) [size=1M]
>         Memory at c0000000 (64-bit, prefetchable) [size=8M]

Exactly ... that's the 3rd gigabyte; I assume there's no physical memory
there, so the pfnnid_map is 0xff (except the bit where the io region
check works).

However, there's a total screw up here: 0xc0000000 is outside of our
premapped I/O region (0xf0000000-0xffffffff) so one of our assumptions
about pa is broken; either the mercury doesn't obey the I/O window rules
and we need to update the OS, or the card has the wrong address.

> Now the system just resets. No tombstone of any kind. :^(
[...]
> CPU0 IOAQ 0x1010aadc $$remoI+350
> CPU0 GR02 0x1010d110 __udivdi3+198
> 
> CPU1 IOAQ 0x101011b0 flush_data_cache_local+8
> CPU1 GR02 0x10113b04 update_mmu_cache+94
> 
> 
> Looks like CPU1 died right away trying to flush an uncacheable region.
> No surprise that didn't work too well.
> 
> And no clue what's up with CPU0.

CPU0 was probably executing a different thread when it was halted by the
HPMC.

flushing an uncacheable area doesn't cause a HPMC, but flushing a non-
existent (and non-responding) area would ...

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
