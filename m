From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 1 May 2005 22:12:44 -0600
Message-ID: <20050502041244.GA1601@colo.lackof.org>
References: <20050501074901.GA13801@colo.lackof.org>
	<1114975460.4788.27.camel@mulgrave>
	<20050502000833.GE17998@colo.lackof.org>
	<1114993898.4788.47.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1114993898.4788.47.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 01, 2005 at 07:31:37PM -0500, James Bottomley wrote:
> > *nod*. Where should we be telling the VM about MMIO ranges?
> > We clearly need to be advertising them.
> 
> Is this a 64 bit mmio region?  Our pfn_is_io heuristics are a bit simple
> (i.e. top F only set).

It's a 64-bit BAR but not an address > 32-bits.
ion:~# lspci -vs 81:
0000:81:00.0 InfiniBand: Mellanox Technology MT23108 InfiniHost (rev a1)
        Subsystem: Hewlett-Packard Company: Unknown device 12ce
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 24
        Memory at c0800000 (64-bit, non-prefetchable) [size=1M]
        Memory at c0000000 (64-bit, prefetchable) [size=8M]
        Capabilities: [40] #11 [001f]
        Capabilities: [50] Vital Product Data
        Capabilities: [60] Message Signalled Interrupts: 64bit+ Queue=0/5 Enable-
        Capabilities: [70] PCI-X non-bridge device.

The 3rd BAR isn't exposed by the current version of firmware.
If it were exposed, then we would see a 128MB or 256MB MMIO space.


> Yes, wrong kernel.  That bug physically cannot occur with
> CONFIG_DISCONTIGMEM=n.  What I'm interested in there is if the tool
> actually works.

Sorry, it was the old kernel. I expect make -j2 failure scrolled
off the screen after one of the threads segfaults.
ie no new kernel got built.

Now the system just resets. No tombstone of any kind. :^(

ion:/usr/src/openib_gen2/src/userspace/tvflash# cat /proc/meminfo 
MemTotal:      1024548 kB
MemFree:        988272 kB
Buffers:          2016 kB
Cached:          15172 kB
...
ion:/usr/src/openib_gen2/src/userspace/tvflash# src/tvflash -i
open_hca(0)



Firmware Version  44.24

Duplex Console IO Dependent Code (IODC) revision 1


PC and RP from PIM dump + System.map:

CPU0 IOAQ 0x1010aadc $$remoI+350
CPU0 GR02 0x1010d110 __udivdi3+198

CPU1 IOAQ 0x101011b0 flush_data_cache_local+8
CPU1 GR02 0x10113b04 update_mmu_cache+94


Looks like CPU1 died right away trying to flush an uncacheable region.
No surprise that didn't work too well.

And no clue what's up with CPU0.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
