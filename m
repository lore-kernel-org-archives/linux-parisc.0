From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] syncdma question (back to ccio drivers)
Date: Thu, 02 Nov 2006 22:11:02 +0000
Message-ID: <454A6CF6.3040309@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@parisc-linux.org>,
 grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
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

In one of my test, I also activated CCIO_MAP_STATS and noticed that before 53c700 pb occured the ccio driver used a very few 
number of entries: may max 30 of severall 100 available?

This make me so suspected a pb of coherency and remember me another of your comment in sba:
         /* XXX REVISIT for 2.5 Linux - need syncdma for zero-copy support.
         ** For Astro based systems this isn't a big deal WRT performance.
         ** As long as 2.4 kernels copyin/copyout data from/to userspace,
         ** we don't need the syncdma. The issue here is I/O MMU cachelines
         ** are *not* coherent in all cases.  May be hwrev dependent.
         ** Need to investigate more.
         asm volatile("syncdma");
         */

Reading back pa11_acd text:
� Cache Coherent I/O
Two instructions (LOAD COHERENCE INDEX and SYNCHRONIZE DMA) have been added to enable cache coherent memory references by 
I/O modules. Previously, responsibility for cache coherence between the processor and I/O modules lay with software, which 
had to use a sequence of flush and purge operations to ensure coherence. While software cache coherence for I/O is still 
attractive in uniprocessor systems because of the lower hardware cost, hardware cache coherence for I/O has a relatively low 
incremental cost in multiprocessor systems.

� Uncacheable Memory
An optional U (Uncacheable) bit has been added to each data TLB entry which controls cache move-in for the corresponding 
page. When the U-bit is set, new lines must not be moved in to the data cache, although existing lines may remain resident 
in the cache. This forces all references to non-resident lines to cause transactions to memory and enables better support of 
industry standard I/O busses where byte and word transactions to memory are sometimes required to communicate with I/O devices.

Unfortunately later:

If implemented, the U (Uncacheable) bit is found in the data TLB entry associated with a page. Whether or not the U-bit is 
implemented, the state of this bit if implemented, whether the memory reference is virtual or absolute, and whether the 
reference is made from a page in the memory or I/O address spaces determine if the reference may be moved into the data 
cache. The detailed rules for moving references into the data cache are specified in "Data Cache Move-In" on page 3-21.

Software must set the U-bit associated with all pages in the I/O address space to 1. Referencing a page in the I/O address 
space for which the U-bit is 0 is an undefined operation.

Changing the state of the U-bit for a page has no effect on the data cache lines from that page which already exist in the 
cache. A page from the memory address space which has its U-bit set to 0 is called a cacheable page. Pages from the I/O 
address space and pages which have their U-bit set to 1 are called uncacheable pages. It is possible for data cache lines 
from an uncacheable page to exist in a data cache. This case may be caused by changing a cacheable page to uncacheable after 
references to this page were moved into the data cache.

So my first question is:
How/where could I find if U-bit is implemented on my systems?

p-l pacache.S rely on its implementation (while hpux does syncdma conditional to a global var: duno what? )

TIA,
	Joel

PS: by reference to this James'paper <http://www.linuxjournal.com/article/7104>, mmu virtualize physical memory addresses 
for the cpu and otoh iommu virtualize this same physical memory addresses for the io bus; so given a virtual page address 
for the cpu, it's impossible for lpa to help me to know if this page is a physical address of a page in IO address space (I 
mean above 0xF0000000 for 32 bit kernels and above 0xF1000000 00000000 for 64bit kernel)?

PS2: is there any way to grab a [id]tlb entry for a given virtual address (may be undocumented feature like the "bit graber" 
;-) ?)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
