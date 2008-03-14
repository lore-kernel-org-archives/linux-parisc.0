From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another ccio fix idea?
Date: Thu, 13 Mar 2008 21:57:31 -0600
Message-ID: <20080314035731.GB24794@colo.lackof.org>
References: <JXM1RH$256C92C0CB28292D8C30F2A8EBC987EF@scarlet.be> <1205322442.2941.104.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: rubisher <rubisher@scarlet.be>, dave <dave@hiauly1.hia.nrc.ca>,
	"soete.joel" <soete.joel@scarlet.be>,
	grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	kyle <kyle@parisc-linux.org>, matthew <matthew@wil.cx>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1205322442.2941.104.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 12, 2008 at 07:47:22AM -0400, James Bottomley wrote:
> On Wed, 2008-03-12 at 10:16 +0100, rubisher wrote:
> > -       asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> > +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[1]));
> > +       asm volatile("fdc %%r0(%0)" : : "r" (&pdir_ptr[0]));
> >         asm volatile("sync");
> 
> Actually, no, I'm afraid this is wrong.
> 
> The code is a complete dogs breakfast, since pdir_ptr is defined as u64
> * in ccio_pdir_entry() and char * in ccio_mark_invalid.

*ugh* sorry about that.
And pdir_ptr cast to "u32 *" in both uses where it's dereferenced.


> What Dave was pointing out is that this structure is 8 bytes long and
> may span two cache lines on the word boundary.  Assuming that's the
> case, this needs to flush the first and second word, not the first and
> second u64 entry as your code would (the second flush is actually
> flushing the next pdir entry).
> 
> However, since it's contained in a u64 pointer, it must reasonably be on
> an 8 byte boundary (or be triggering an unaligned poiner error) and
> therefore shouldn't span multiple cache lines anyway.

pdir_ptr will always point at a u64 * and will always be 8 byte aligned.
The allocation is done in ccio_ioc_init():
        ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL,
                                                 get_order(ioc->pdir_size));

hth,
grant

