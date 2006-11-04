From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: syncdma question (back to ccio drivers)
Date: Sat, 4 Nov 2006 15:39:38 -0700
Message-ID: <20061104223938.GC14141@colo.lackof.org>
References: <454A6CF6.3040309@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <454A6CF6.3040309@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 02, 2006 at 10:11:02PM +0000, Joel Soete wrote:
> Hello Grant,
> 
> In one of my test, I also activated CCIO_MAP_STATS and noticed that before 
> 53c700 pb occured the ccio driver used a very few number of entries: may 
> max 30 of severall 100 available?

ok. that's not too surprising given drivers are only supposed to map
memory for DMA just before sending the DMA request to HW.

> This make me so suspected a pb of coherency and remember me another of your 
> comment in sba:
>         /* XXX REVISIT for 2.5 Linux - need syncdma for zero-copy support.
>         ** For Astro based systems this isn't a big deal WRT performance.
>         ** As long as 2.4 kernels copyin/copyout data from/to userspace,
>         ** we don't need the syncdma. The issue here is I/O MMU cachelines
>         ** are *not* coherent in all cases.  May be hwrev dependent.
>         ** Need to investigate more.
>         asm volatile("syncdma");
>         */

What makes you think this is a problem with IOMMU coherency?

> Reading back pa11_acd text:
...
> So my first question is:
> How/where could I find if U-bit is implemented on my systems?

I'm certain all PA 2.0 systems support U-bit.
I believe all PA 1.1 systems do too.
arch/parisc/kernel/pci-dma.c depends on it I think.

PDC might also tell us but I haven't looked the spec recently.

> p-l pacache.S rely on its implementation (while hpux does syncdma 
> conditional to a global var: duno what? )
> 
> TIA,
> 	Joel
> 
> PS: by reference to this James'paper 
> <http://www.linuxjournal.com/article/7104>, mmu virtualize physical memory 
> addresses for the cpu and otoh iommu virtualize this same physical memory 
> addresses for the io bus; so given a virtual page address for the cpu, it's 
> impossible for lpa to help me to know if this page is a physical address of 
> a page in IO address space (I mean above 0xF0000000 for 32 bit kernels and 
> above 0xF1000000 00000000 for 64bit kernel)?

lpa by itself won't work.
Also need to know the memory map of the system.

> PS2: is there any way to grab a [id]tlb entry for a given virtual address 
> (may be undocumented feature like the "bit graber" ;-) ?)

 I don't know. Probably but requires knowledge of how addresses
map to either I or D cache.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
