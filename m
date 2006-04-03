From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Mon, 03 Apr 2006 15:21:22 +0200
Message-ID: <E1FQOzi-0007VZ-00__2129.16605310074$1416624042$gmane$org@dorka.pomaz.szeredi.hu>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
	<E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
	<1143931084.3368.18.camel@mulgrave.il.steeleye.com>
	<E1FPyD6-0002ag-00@dorka.pomaz.szeredi.hu>
	<1143986960.3865.5.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1143986960.3865.5.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Sun, 02 Apr 2006 09:09:20 -0500)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Otherwise sparc and ppc would have to check PageAnon() from both
> > flush_dcache_page() and flush_anon_page() and call a common function,
> > which seems to just complicate things without any gain.
> 
> I don't think what you propose is desirable or possible:
> flush_dcache_pages() is designed not to have to flush them (it can't
> actually because it can't find them properly)

I see now, that flush_anon_page() also gets the virtual address.

Pardon my ignorance, but I'm still not getting the whole picture.

Current (with your API updates) get_user_pages() does the following on
PARISC:

  flush_anon_page():

    - If page is anonymous, the the user address is flushed which was
      passed to get_user_pages().

  flush_dcache_page():
     - The kernel address is flushed regardless whether the page is
       anonymous or not

     - If the page is file backed, then all user addresses refering to
       the page are flushed

Why this discrepancy between anonymous and file backed pages?
Wounldn't it be enough for file backed pages too to flush only one
user address?

Added to the mix are copy_to/from_user_page() which already seem to do
the above, and are used in combination with get_user_pages() which
results in multiple redundant cache flushes.  Not too clean, is it?

Thanks,
Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
