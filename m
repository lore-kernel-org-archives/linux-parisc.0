From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] Re: syncdma question (back to ccio drivers)
Date: Sun, 05 Nov 2006 11:50:45 +0000
Message-ID: <454DD015.6040304@scarlet.be>
References: <454A6CF6.3040309@scarlet.be>
	<20061104223938.GC14141@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061104223938.GC14141@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

Grant Grundler wrote:
 > On Thu, Nov 02, 2006 at 10:11:02PM +0000, Joel Soete wrote:
 >> Hello Grant,
 >>
 >> In one of my test, I also activated CCIO_MAP_STATS and noticed that before 53c700 pb occured the ccio driver used a very 
few number of entries: may max 30 of severall 100 available?
 >
 > ok. that's not too surprising given drivers are only supposed to map
 > memory for DMA just before sending the DMA request to HW.
 >
 >> This make me so suspected a pb of coherency and remember me another of your comment in sba:
 >>         /* XXX REVISIT for 2.5 Linux - need syncdma for zero-copy support.
 >>         ** For Astro based systems this isn't a big deal WRT performance.
 >>         ** As long as 2.4 kernels copyin/copyout data from/to userspace,
 >>         ** we don't need the syncdma. The issue here is I/O MMU cachelines
 >>         ** are *not* coherent in all cases.  May be hwrev dependent.
 >>         ** Need to investigate more.
 >>         asm volatile("syncdma");
 >>         */
 >
 > What makes you think this is a problem with IOMMU coherency?
 >
Remember: 53c700 driver on b180 (don't use any ccio) works fine but the same 53c700 driver on c110/d380 failed sadely:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030202.html>

and according to James' comment:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030204.html>

this should be a pb in sg list management; not in 53c700 (because works fine without ccio) but well in ccio to which this 
53c700 driver has to address its io request, right?

In a first step, I so manage to backport all your sba job since the time those drivers looks like brotherhood:
around
<http://cvs.parisc-linux.org/linux-2.4/arch/parisc/kernel/sba_iommu.c?rev=1.26&view=markup>

This seems to help to improve ncr53c720 driver (not absolutely sure: run untar/rm loop only 1h while it failed after few min 
before, but not yet enough for me and more over it seems to break dino on the d380 additional nic, though) but if didn't 
seem to degrade 53c700 driver, it didn't improve it at all.

In a second step, I suspected specific stuff to ccio and specialy what doesn't seems to exist here in ccio:
the sba
     /* flush purges */
     READ_REG32(ioc->ioc_hpa+IOC_PCOM);

but without doc (not yet publicaly available) I couldn't go further in this investigation.

Let so assume that's ok.

Anyway something else could show a pb of synchronization: the driver perf which can be a bit improved by disabling 
CCIO_SEARCH_TIME as this comment said:
/*
  * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
  * impacts performance though - ditch it if you don't use it.
  */

If that make top stat completely false that mainly made 53c700 behaviour even worse: (with the same driver code and same up 
config) even only one untar/rm didn't reach to complete (iirc it didn't even finished untar) while it could at least 
complete 2 or 3 loop before.

This latest test make me though it could also be a pb of synchronization somewhere between ccio and 53c700 and may be a pb 
of cache?

 >> Reading back pa11_acd text:
 > ...
 >> So my first question is:
 >> How/where could I find if U-bit is implemented on my systems?
 >
 > I'm certain all PA 2.0 systems support U-bit.
 > I believe all PA 1.1 systems do too.
 > arch/parisc/kernel/pci-dma.c depends on it I think.
 >
 > PDC might also tell us but I haven't looked the spec recently.
 >
ok I will try to find out stuff.

 >> p-l pacache.S rely on its implementation (while hpux does syncdma conditional to a global var: duno what? )
 >>
 >> TIA,
 >>     Joel
 >>
 >> PS: by reference to this James'paper <http://www.linuxjournal.com/article/7104>, mmu virtualize physical memory 
addresses for the cpu and otoh iommu virtualize this same physical memory addresses for the io bus; so given a virtual page 
address for the cpu, it's impossible for lpa to help me to know if this page is a physical address of a page in IO address 
space (I mean above 0xF0000000 for 32 bit kernels and above 0xF1000000 00000000 for 64bit kernel)?
 >
 > lpa by itself won't work.
 > Also need to know the memory map of the system.
 >
 >> PS2: is there any way to grab a [id]tlb entry for a given virtual address (may be undocumented feature like the "bit 
graber" ;-) ?)
 >
 >  I don't know. Probably but requires knowledge of how addresses
 > map to either I or D cache.
 >
 > grant
 >
 >
Thanks,
     Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
