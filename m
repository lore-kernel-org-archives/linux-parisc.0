Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39075484C
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 12:49:49 -0600 (MDT)
Date: Sat, 10 Apr 2004 14:49:46 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
Message-ID: <20040410184946.GB7123@baldric.uwo.ca>
References: <1081513015.1759.5.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081513015.1759.5.camel@mulgrave>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

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

Has anyone considered inverted page table layouts?
 
> Now, if you put all this together, you'll see that for ILP32
> executables on the LP64 kernel, we only need a two level page table
> (2048 directory entries * 512 PTEs * 4096 = 4GB), saving us one level
> of indirect lookup.
> 
> Additionally, if we ever get around to implementing LP64 user binaries
> (and you know who you are...) we would then be able to address up to
> 2048 * 2048 * 512 * 4096 = 8EB of virtual space using a three level
> page table.

I've already started porting glibc, I'm convincing autoconf to traverse
the right system dependency directories. Hasn't been too painful yet,
I'm still writing the 64-bit dl-machine to handle the relocations
though. I have it building an ld64.so.1 but it doesn't work yet :)
 
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

If we used an inverted page table with hashing it would be a single
level page table, with good cache locality (less spread compared to a
hierarchical table).

> 3) We can unify the narrow and wide TLB miss handlers (we'd actually
>    predicate the 2 or 3 level lookup on the width of the user binary).


Cheers,
Carlos.
