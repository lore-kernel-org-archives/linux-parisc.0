From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ioremap-changes
Date: Wed, 15 Mar 2006 00:20:17 -0700
Message-ID: <20060315072017.GA28066@colo.lackof.org>
References: <20060307211213.3A261494013@palinux.hppa> <200603072227.38097.deller@gmx.de> <20060308073743.GA31959@colo.lackof.org> <200603121426.16996.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200603121426.16996.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 12, 2006 at 02:26:16PM +0100, Helge Deller wrote:
> drivers/parisc/sba_iommu.c does the following on my machine:
>         void __iomem *sba_addr;
>         sba_addr = ioremap(0xfffffffffed00000, 4096);  /* 0xfffffffffed00000 is hpa of Astro BC Runway Port at 0xfffffffffed00000 [10] */
>         func_class = * (volatile unsigned long long *) (sba_addr + 8);
> 
> Here is the important part of the bootlog:
....
> hpa start = fffffffffed00000 size=4096    <<<<<< this is the Astro BC
> IOREMAP: phys_addr=fffffffffed00000, offset = 0, size=4096
> IOREMAP: addr = 0000000000008000         <<<<< the new vm area ( fffffffffed00000(phys) will be mapped to 0x8000(virt))
> set_pte: virtual:8000 -> phys=fffffffffed00000, pte=fffffffffed00283  << here is the pte entry which ioremap() generates.
> 
> The pte value seems right, and the __pgprot flags which I used were: _PAGE_PRESENT | _PAGE_RW | _PAGE_NO_CACHE;

Is the U-bit getting set in the CPU pdir?
It doesn't look like it.

In theory this shouldn't matter since the address falls in "F-space".
IIRC all parisc CPUs treat "F-space" as uncached.

> Nevertheless, when reading the quadword from (virt) 0x8000+8 it crashes
> ("A Data Miss Timeout"? - see HPMC log).
...
> Looking at the log, it seems that the pte was (mostly?) right, since
> the System Responder Address below is 0xfffffffffed10200.
> Although I don't understand why it was 0xfffffffffed10200
> and not 0xfffffffffed00008 ?

I don't understand that either. ffed10200 is the "MEM_CONTROL_0"
register and has nothing to do with the IOC or base SBA function.
But google is my friend:
	http://archives.neohapsis.com/archives/hp/2001-q2/0037.html

This suggests whatever address that was accessed was expected to be
handled by the memory controller. So I wonder if the pte is really correct.


Looking at use of _PAGE_NO_CACHE_BIT in arch/parisc/kernel/entry.S,
I'm skeptical we need to set U-bit for any 1.1 TLB handlers:
        .macro          make_insert_tlb_11      spc,pte,prot
        zdep            \spc,30,15,\prot
        dep             \pte,8,7,\prot
        extru,=         \pte,_PAGE_NO_CACHE_BIT,1,%r0
        depi            1,12,1,\prot
...

AFAIK, all the PA 1.1 CPUs hard code F-space to be uncached,
do not support U-bit, and do not support IO outside of F-space.
Am I missing something?

I suggest this in case we can make our TLB handlers another cycle
(or two) faster. This matters on workloads the use > ~200 pages of RAM.


Suprisingly, I didn't see any reference to _PAGE_NO_CACHE_BIT in
make_insert_tlb macro. I have to wonder if the combination of
IOREMAP and setting U-bit would solve the PA8800 cache issues.


	        depd            \pte,8,7,\prot

moves the right-most 7 bits to pos 8 in \prot.
_PAGE_NO_CACHE_BIT is the 8th bit from the right.

Consider adding two lines of code currently in the make_insert_tlb_11
macro to make_insert_tlb:
        extru,=         \pte,_PAGE_NO_CACHE_BIT,1,%r0
        depi            1,12,1,\prot
 
But like I said near the top, U-bit may not matter for Astro machines.
Astro has all IO in F-space.
It will matter for Stretch (N-class), ZX1 (e.g. rp3440), and SX1000
(rp8420) platforms which have IO from 2GB to 4GB in the physical
address space.

And I think "f_extend" macro is wrong for stretch and ZX1 platforms.
Those platforms are 64-bit only. While the comment says f_extend is
for ILP32 PA2.0 only, any objections if I add "ifndef 64BIT/else/endif"
code to not do anything for the 64-bit builds?

thanks,
grant
