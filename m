Return-Path: <soete.joel@tiscali.be>
Received: from spoolo4.tiscali.be (spoolo4.tiscali.be [62.235.13.170])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A584482A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 14:12:57 -0600 (MDT)
Message-ID: <407703C3.8050708@tiscali.be>
Date: Fri, 09 Apr 2004 20:12:51 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
References: <1081513015.1759.5.camel@mulgrave>
In-Reply-To: <1081513015.1759.5.camel@mulgrave>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi James,

James Bottomley wrote:
> Current state of Play
> =====================
> 
> On PA, we currently have different page table layouts depending on
> whether we're running a 64 bit (LP64) or 32 bit (ILP32) kernel.  PA
> has a so called software TLB, which means that each PA processor
> contains a number of fixed TLB entries and if the current virtual
> address is not in one of them the processor takes a TLB miss fault and
> the fault routine gets to locate the TLB entry and insert it (usually
> causing the processor to throw out another TLB entry).  This software
> TLB policy means that our page table structure is really up to us.
> 
> On ILP32 we have a 2 level page table, with a 4k directory pointing to
> a page of 4k containing the entries, each entry pointing to a physical
> page and taking 4 bytes (covering 1024*1024*4096 = 4GB total).
> 
> On LP64 we have a 3 level page table, with a 4k directory pointing to
> a 4k mid-directory pointing to a page of 4k containing entries.  Since
> our pointers here are 8 bytes, 4k only contains 512 of them, so we
> cover 512 * 512 * 512 * 4096 = 512GB
> 
> One disadvantage on LP64 is that even though our user-space is mostly
> ILP32, we still incur the overhead of a three level lookup.
> 
> Another problem with this is that each Page table Entry (PTE) needs to
> contain certain flags (some are mandated by Linux, others are needed
> to control the type of TLB entries we insert).  Since each PTE points
> to a page (and thus must be page aligned), we get the lower 12 bits of
> the address for the flags.  If you look in asm/pgtable.h, you'll see
> that all of those bits are already in use for 13 flags (we overload
> _PAGE_FILE and _PAGE_DIRTY).
> 
> In order to solve our cache flush penalty on fork/exec, and implement
> stingy flushing, we need to be able to mark a page as being "in
> cache", and would need an extra flag to do this with.  Additionally,
> at some point in the future it would be nice to be able to be adaptive
> about page size (i.e. r-x regions are just faulted binary text, we
> could cover them with 16k or even 64k pages for efficiency and Linux
> would be none the wiser).
> 
> To achieve all of this, we need quite a large expansion in the number
> of available flags.
> 
> So:
> 
> New Proposal for Page Table Layout
> ==================================
> 
> The proposal is:
> 
> 1) Make the PTE on both ILP32 and LP64 8 bytes.  Even on LP64, the
>    maximum addressable physical memory is 48bits (256EB), so we can
>    use the top 16 bits for additional flags.  On ILP32 we'd have an
>    extra long, so again, we use the top 16 bits for flags and leave
>    the lower 16 bits unused.  This gives us identical PTE layouts on
>    both ILP32 and LP64
> 
> 2) Make the directories 8k in size (this has to be physically
>    contiguous because the TLB miss handler operates in absolute
>    space).
> 
> 3) Allocate all page tables in ZONE_DMA.  On PA, this means that the
>    physical address of every page table will be under 4GB, so we only
>    need *four* bytes for all of the directory entries. (The flags I'm
>    looking for are only in the PTE, we have plenty of extra space
>    still for directory flags).
> 
I would just take the opportunity to mentioned you a pb I encounter on N4k model
(typicaly requiring 64bit kernel) with 2 cpu and 4Gb of ram. I can just run a up kernel (2.6.5-pa5 :) )
which only uses only 2 of the 4 Gb of the available ram.
Thanks to Matthew (http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022393.html)
and Grant (http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022408.html),
I can figure out the following stuff:
 > <==== actualy return by setup_bootmem() ====>
 > pmem_ranges[0].start_pfn = 0.
 > pmem_ranges[0].pages = 524288.
 > pmem_ranges[1].start_pfn = 1572864.
 >
There is so an actual gap too big for setup_bootmem():
(in arch/parisc/kernel/init.c)
[snip]
#define MAX_GAP (0x40000000UL >> PAGE_SHIFT)

static void __init setup_bootmem(void)
{
[snip]
#ifdef __LP64__

#ifndef CONFIG_DISCONTIGMEM
[snip]
         for (i = 1; i < npmem_ranges; i++) {
                 if (pmem_ranges[i].start_pfn -
                         (pmem_ranges[i-1].start_pfn +
                          pmem_ranges[i-1].pages) > MAX_GAP) {
                         npmem_ranges = i;
                         break;
                 }
         }
#endif
[snip]

I try to have a look to implement 'CONFIG_DISCONTIGMEM' but I am not a developer and have not enough kernel knowledge to do it.

Just in the hope it could help you,
	Joel
> Now, if you put all this together, you'll see that for ILP32
> executables on the LP64 kernel, we only need a two level page table
> (2048 directory entries * 512 PTEs * 4096 = 4GB), saving us one level
> of indirect lookup.
> 
> Additionally, if we ever get around to implementing LP64 user binaries
> (and you know who you are...) we would then be able to address up to
> 2048 * 2048 * 512 * 4096 = 8EB of virtual space using a three level
> page table.
> 
> The disadvantages:
> 
> 1) Our directory entries become order one allocations.  Linux is
>    careful about this, so these type of allocations should be
>    plentiful and we only need one directory per ILP32 process anyway.
> 
> 2) we have to allocate GFP_DMA.  Since very few people actually have a
>    PA machine with more than 4GB of ram, this shouldn't be too much of
>    a problem.
> 
> The advantages:
> 
> 1) We get an extra sixteen PTE flags to play with.
> 
> 2) We use 2 level page tables for ILP32 user processes on LP64.
> 
> 3) We can unify the narrow and wide TLB miss handlers (we'd actually
>    predicate the 2 or 3 level lookup on the width of the user binary).
> 
> James
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
