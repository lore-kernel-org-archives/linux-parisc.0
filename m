From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another ccio fix idea?
Date: Thu, 13 Mar 2008 21:50:20 -0600
Message-ID: <20080314035020.GA24794@colo.lackof.org>
References: <47D3EC43.3070101@scarlet.be> <1205179187.2941.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Joel Soete <soete.joel@scarlet.be>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1205179187.2941.23.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 10, 2008 at 02:59:47PM -0500, James Bottomley wrote:
> On Sun, 2008-03-09 at 13:55 +0000, Joel Soete wrote:
> > Hello Grant,
> > 
> > Always tracking this ccio-dma bug, I figure out this stuff could be helpfull:
> > --- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
> > +++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
> > @@ -802,7 +802,7 @@
> >   			 * Hopefully someone figures out how to patch (NOP) the
> >   			 * FDC/SYNC out at boot time.
> >   			 */
> > -			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> > +			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> 
> That's the wrong fix.  What it's trying to do is flush the write made
> above this to pdir_ptr[7].  Therefore there should be an '&' in front,
> so
> 
> asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[7]))

In this case, it's certainly the same cacheline.
I can guarantee pdir_ptr is 8 byte aligned.

> Flushing pdir_ptr may or may not work depending on the cache line width
> (pdr_ptr[7] is 28 bytes away, so if the line size is 16 it will fail;
> although I think almost every machine with a ccio has a 32 byte or
> higher cache line width).

Yes (32-byte cachelines at least) and jda already pointed out pdir_ptr
is a char*.

thanks,
grant

> 
> James
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
