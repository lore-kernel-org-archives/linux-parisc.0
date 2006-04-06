From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Thu, 06 Apr 2006 08:53:39 +0200
Message-ID: <E1FRON9-0005rC-00__24882.9134776772$1416624046$gmane$org@dorka.pomaz.szeredi.hu>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
	<E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
	<1143931084.3368.18.camel@mulgrave.il.steeleye.com>
	<E1FPyD6-0002ag-00@dorka.pomaz.szeredi.hu>
	<1143986960.3865.5.camel@mulgrave.il.steeleye.com>
	<E1FQOzi-0007VZ-00@dorka.pomaz.szeredi.hu>
	<1144135400.3552.11.camel@mulgrave.il.steeleye.com>
	<E1FQhEh-0000Vz-00@dorka.pomaz.szeredi.hu>
	<1144165204.3597.13.camel@mulgrave.il.steeleye.com>
	<E1FQo4N-000159-00@dorka.pomaz.szeredi.hu>
	<1144282046.3214.7.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1144282046.3214.7.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Wed, 05 Apr 2006 20:07:26 -0400)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > No, because if you look at the implementation, you'll see that
> > > copy_to/from_user() copy straight into the user view (i.e. via the user
> > > cache lines).
> > 
> > Yes.  But how will this ensure that the above problems (dirty/clean
> > cache lines in aliases) won't cause any problems?
> 
> It doesn't.  The object is to write into the user cache as though the
> actual user process had done it (i.e. disregarding all aliasing).

Which is also what the object of get_user_pages() + memcpy() is.  The
fact that in the process some part of the cache is flushed is
irrelevant.

get_user_pages() is used as a _substitute_ for copy_*_user() if the
memory copying needs to be done from a different VM context.

> > What is the difference between
> > 
> >  - updating cached data through the user view
> > 
> >  - flushing the cache lines for the user view, then updating data
> >    through the kernel view and finally flushing the cache lines for
> >    the kernel view
> 
> In the former, the data usually ends up in dirty user cache lines.  In
> the latter the cache lines are entirely clean after the procedure.
> 
> > I don't see in either case that the cache lines for any other aliases
> > are touched.  Is there still some difference in behavior?
> 
> Yes, in the former, only a single alias (the user view) is affected.  In
> the latter, all views are accounted for.

I think we agree on what happens, but not about why it is needed to
happen.

With your fix get_user_pages() guarantees _more_ coherency than
copy_from/to_user().  This not a bug per-se, but it does require a new
interface (flush_anon_pages()) and provides "strange" cache coherency
semantics.

By strange I mean, that all views of file backed pages are flushed,
but only one view of anononymous pages.  This IMO doesn't make too
much sense, but feel free to correct me if I'm wrong.

How about this?

Index: linux/mm/memory.c
===================================================================
--- linux.orig/mm/memory.c	2006-04-04 18:44:47.000000000 +0200
+++ linux/mm/memory.c	2006-04-06 08:40:26.000000000 +0200
@@ -1072,8 +1072,8 @@ int get_user_pages(struct task_struct *t
 			if (pages) {
 				pages[i] = page;
 
-				flush_anon_page(page, start);
-				flush_dcache_page(page);
+				flush_cache_page(vma, start, page_to_pfn(page));
+				flush_kernel_dcache_page(page);
 			}
 			if (vmas)
 				vmas[i] = vma;

The flushing semantics are cleaner, and the flush_anon_page()
interface is not needed.

Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
