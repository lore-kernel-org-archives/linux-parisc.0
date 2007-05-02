From: "Ollie Wild" <aaw@google.com>
Subject: Re: [parisc-linux] memory management issues
Date: Wed, 2 May 2007 16:52:18 -0700
Message-ID: <65dd6fd50705021652s3b3b721dl6a8323259cd4efa9__15999.6690032587$1416624351$gmane$org@mail.gmail.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178149192.3712.28.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Give me more of a clue on this one ... afterwards *who* sees the pages
> as zero'd?  The user or the kernel ... if the user, I think it's a
> simple coherency problem.

Ah, I should have been more clear.  I scattered a bunch of code
similar to this throughout the kernel:

  {
    struct page *page;
    char * addr;

    get_user_pages(current, bprm->mm, bprm->p, 1, 0, 1, &page, NULL);
    addr = kmap(page);
    printk("page = %p, bprm->p = %016lx\n", page, bprm->p);
    printk("%s: %d: \"%s\"\n", __FUNCTION__, __LINE__, addr);
    kunmap(page);
    put_page(page);
  }

I observed that after the activate_mm() call, page and bprm->p were
unchanged, but the string at addr switched from the executable name to
the null string.

I thought that caching might play a role, so I added
flush_dcache_page() calls after the kunmap's, but that didn't help.

Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
