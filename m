From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Fri, 3 Mar 2006 19:35:31 -0500
Message-ID: <20060304003531.GA30283@quicksilver.road.mcmartin.ca>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
	<20060304003802.GB18473@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060304003802.GB18473@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 03, 2006 at 05:38:02PM -0700, Grant Grundler wrote:
> Anyplace we use asm that could be different for PA20 vs PA11.
> __ffs() in include/asm/bitops.h probaby isn't the best example
> but it might be good enough to give an idea.
> Ie kernel built for PA11 could be optimized for PA20-32bit.
>

*nod* 

> hrm...are kernel modules loaded into write protected space as well?
> If so, then we can't apply this to kernel modules...would kinda limit
> how it could be used. E.g. we couldn't get rid of dma_ops indirect
> calls.
>

Unfortunately, this can't directly be applied to modules. It could
though, be extended by exporting the code, and hacking it into the module
loader, I imagine.
 
> > -	/* FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
> > -	**        PCX-U/U+ do. (eg C200/C240)
> > -	**        PCX-T'? Don't know. (eg C110 or similar K-class)
> > -	**
> > -	** See PDC_MODEL/option 0/SW_CAP word for "Non-coherent IO-PDIR bit".
> 
> I'd like to save the comments that specify which CPU/platforms need
> certain ops. We need these comments to document which platforms/CPUs
> needs to be tested if something related changes.
> Can you add leave them someplace in ccio/sba code?
> 

Will do.

> Can we put instruction patching declarations in a new header file?
> system.h is way overloaded already.
> 

Yeah, touching system.h sucks too, as it causes basically everything
to be rebuilt.

> very cool! ++kyle. :)
>

Thanks,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
