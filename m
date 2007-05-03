From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] memory management issues
Date: Thu, 03 May 2007 09:53:05 -0500
Message-ID: <1178203985.3714.11.camel__948.65729702196$1416624349$gmane$org@mulgrave.il.steeleye.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: Ollie Wild <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2007-05-03 at 01:11 -0700, Ollie Wild wrote:
> Thanks, James.
> 
> > The first thing this does is
> > immediately decohere the page because we zero it through the user
> > mapping before adding it to the vma.  Fortunately get_user_pages()
> > should make it coherent again.
> 
> This is the critical insight I was missing.  I was assuming the page
> was unaccessed prior to mapping it into the kernel.  The zeroing
> hadn't occurred to me.  Unfortunately, it looks like get_user_pages()
> doesn't make it coherent again.  Calling flush_kernel_dcache_page()
> alone fails to resolve the problem.  Calling flush_cache_page() after
> kmap() and flush_kernel_dcache_page() before kunmap() does.

No, you're perverting the use of get_user_pages() ... it's designed to
get mapping backed pages.  I already did one fix for it so the fuse
people could use it to get anonymous pages ... I have a nasty feeling
stack pages are neither file backed nor anonymous.

Really, given the page is already present and cached in user space, why
not just copy through the user mappings instead of trying to map the
pages into the kernel an then fix up coherence issues, copy then push
the coherency back to the user ... the API you want is copy_in_user().

James


> Is this a bug in get_user_pages()?  Should it be calling
> flush_cache_page() directly?
> 
> By the way, I've left my kernel running on iodine.  Try running:
> 
>     ulimit -s unlimited
>     ls -l `find /usr -type f`
> 
> Ollie

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
