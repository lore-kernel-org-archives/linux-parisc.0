From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Fri, 3 Mar 2006 17:38:02 -0700
Message-ID: <20060304003802.GB18473@colo.lackof.org>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 03, 2006 at 03:14:28PM -0500, Kyle McMartin wrote:
> Finally got around to making this work. I don't want to commit it yet,
> as I still haven't decided I like using the x86-esque interface for
> deciding to patch. And the names of some of the things are kind of lame.

Sure...but overall it looks good.

> Someone looking it over would be nice. Ten poins if someone can find
> another use for this that justifies making it as generic as it is.

Anyplace we use asm that could be different for PA20 vs PA11.
__ffs() in include/asm/bitops.h probaby isn't the best example
but it might be good enough to give an idea.
Ie kernel built for PA11 could be optimized for PA20-32bit.

> Also, if you want to test it, you'll need to remove the & ~_PAGE_WRITE from
> PAGE_KERNEL_RO in asm/pgtable.h until we write protect the kernel at a
> later stage.

hrm...are kernel modules loaded into write protected space as well?
If so, then we can't apply this to kernel modules...would kinda limit
how it could be used. E.g. we couldn't get rid of dma_ops indirect
calls.

> -	/* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
> -	**        PCX-U/U+ do. (eg C200/C240)
> -	**        PCX-T'? Don't know. (eg C110 or similar K-class)
> -	**
> -	** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".

I'd like to save the comments that specify which CPU/platforms need
certain ops. We need these comments to document which platforms/CPUs
needs to be tested if something related changes.
Can you add leave them someplace in ccio/sba code?

>  	** Hopefully we can patch (NOP) these out at boot time somehow.

This commnent could be deleted though. :)

> +#include <asm/system.h>                /* for instruction patching */

Can we put instruction patching declarations in a new header file?
system.h is way overloaded already.

very cool! ++kyle. :)

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
