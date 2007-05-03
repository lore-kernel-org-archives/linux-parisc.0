From: "Ollie Wild" <aaw@google.com>
Subject: Re: [parisc-linux] memory management issues
Date: Thu, 3 May 2007 01:11:04 -0700
Message-ID: <65dd6fd50705030111i993390bx829ee5eb8a188462__728.330881293182$1416624347$gmane$org@mail.gmail.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178153532.3712.39.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thanks, James.

> The first thing this does is
> immediately decohere the page because we zero it through the user
> mapping before adding it to the vma.  Fortunately get_user_pages()
> should make it coherent again.

This is the critical insight I was missing.  I was assuming the page
was unaccessed prior to mapping it into the kernel.  The zeroing
hadn't occurred to me.  Unfortunately, it looks like get_user_pages()
doesn't make it coherent again.  Calling flush_kernel_dcache_page()
alone fails to resolve the problem.  Calling flush_cache_page() after
kmap() and flush_kernel_dcache_page() before kunmap() does.

Is this a bug in get_user_pages()?  Should it be calling
flush_cache_page() directly?

By the way, I've left my kernel running on iodine.  Try running:

    ulimit -s unlimited
    ls -l `find /usr -type f`

Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
