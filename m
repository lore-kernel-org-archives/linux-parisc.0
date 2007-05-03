From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] memory management issues
Date: Wed, 02 May 2007 19:52:12 -0500
Message-ID: <1178153532.3712.39.camel__1164.15727320618$1416624352$gmane$org@mulgrave.il.steeleye.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: Ollie Wild <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2007-05-02 at 16:52 -0700, Ollie Wild wrote:
> > Give me more of a clue on this one ... afterwards *who* sees the pages
> > as zero'd?  The user or the kernel ... if the user, I think it's a
> > simple coherency problem.
> 
> Ah, I should have been more clear.  I scattered a bunch of code
> similar to this throughout the kernel:
> 
>   {
>     struct page *page;
>     char * addr;
> 
>     get_user_pages(current, bprm->mm, bprm->p, 1, 0, 1, &page, NULL);
>     addr = kmap(page);
>     printk("page = %p, bprm->p = %016lx\n", page, bprm->p);
>     printk("%s: %d: \"%s\"\n", __FUNCTION__, __LINE__, addr);
>     kunmap(page);
>     put_page(page);
>   }
> 
> I observed that after the activate_mm() call, page and bprm->p were
> unchanged, but the string at addr switched from the executable name to
> the null string.

Well, it seems to be a classic case of missing flushing ... however,
because of the way you've altered the page allocation, it's incredibly
subtle.  You no longer use alloc_page() to get the page, you use
expand_stack on an anonymous vma.  The first thing this does is
immediately decohere the page because we zero it through the user
mapping before adding it to the vma.  Fortunately get_user_pages()
should make it coherent again.  however, you need to
flush_kernel_dcache_page() before kunmap() I think

> I thought that caching might play a role, so I added
> flush_dcache_page() calls after the kunmap's, but that didn't help.

It likely wouldn't ... on most architectures, flush_dcache_page() can do
strange things on non file backed areas ... although most of the time it
should call flush_kernel_dcache_page() anyway.  Try
flush_kernel_dcache_page() first and I can think further if that fails.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
