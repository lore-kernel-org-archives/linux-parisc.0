Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FEFA483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 04:42:18 -0600 (MDT)
Reply-To: <santosh.abraham@hp.com>
From: "Santosh Abraham" <santosha@india.hp.com>
To: "'Matthew Wilcox'" <willy@debian.org>,
	"'David S. Miller'" <davem@redhat.com>
Cc: "'Randolph Chung'" <randolph@tausq.org>,
	<parisc-linux@lists.parisc-linux.org>,
	"'Stephen C. Tweedie'" <sct@redhat.com>
Subject: RE: [parisc-linux] Fwd:  Problems with raw interface.
Date: Fri, 26 Sep 2003 16:12:07 +0530
Message-ID: <001201c3841a$d5be9900$e5624c0f@india.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

A call to flush_cache_range(), before the call to flush_dcache_page ()
would fix the problem. I tested this a couple of days back,
but called flush_user_dcache_range () instead of flush_cache_range(), and
our apps seemed to work fine.

flush_cache_range () calls flush_user_dcache_range () internally.
(i am aware that flush_user_dcache_range () is not an exported
interface, but I urgently needed to get our apps working ).

Would the following be acceptable ?
------------------------------------------------------------------------
*** mm/memory.c.orig       Fri Nov 29 07:51:13 2002
--- mm/memory.c    Fri Sep 26 15:56:02 2003
***************
*** 570,578 ****
        }
        iobuf->nr_pages = err;
        while (pgcount--) {
!               /* FIXME: flush superflous for rw==READ,
!                * probably wrong function for rw==WRITE
                 */
                flush_dcache_page(iobuf->maplist[pgcount]);
        }
        dprintk ("map_user_kiobuf: end OK\n");
--- 570,595 ----
        }
        iobuf->nr_pages = err;
        while (pgcount--) {
!               struct page *page;
!
!               page = iobuf->maplist[pgcount];
!
!               /*
!                * flush_dcache_page () calls flush_cache_page () internally
!                * in certain cases.  This check is an attempt to avoid
!                * spurious cache flushes.
                 */
+
+               if (!page->mapping) {
+                       unsigned long start = va + (pgcount * PAGE_SIZE);
+                       unsigned long end   = va + ((pgcount+1) *
PAGE_SIZE);
+
+                       /* Strictly not necessary, perhaps ? */
+                       if (end > va+len) {
+                               end = va+len;
+                       }
+                       flush_cache_range (mm, start, end);
+               }
                flush_dcache_page(iobuf->maplist[pgcount]);

-----------------------------------------------------------------------

Does the order of the calls to flush_cache_range ()/flush_dcache_page()
matter ?

Also, what would be the effect on other platforms ?


-----Original Message-----
From: willy@www.linux.org.uk [mailto:willy@www.linux.org.uk]On Behalf Of
Matthew Wilcox
Sent: Thursday, September 25, 2003 7:56 PM
To: santosh.abraham@hp.com
Cc: 'Randolph Chung'; parisc-linux@lists.parisc-linux.org; Stephen C.
Tweedie; David S. Miller
Subject: Re: [parisc-linux] Fwd: Problems with raw interface.


On Thu, Sep 25, 2003 at 04:49:21PM +0530, Santosh Abraham wrote:
>
> hmm.. why is map_user_kiobuf () calling flush_dcache_page () then ?
> should it not be calling flush_cache_{range,page} ?
>
> map_user_kiobuf () called from the raw I/O path should ,in the
> write case, be flushing user data out, so that its visible to
> the kernel VA.

I think you're right.  flush_dcache_page is for page cache pages, not for
random user addresses.  Would something like this make sense?

Index: mm/memory.c
===================================================================
RCS file: /var/cvs/linux-2.4/mm/memory.c,v
retrieving revision 1.24
diff -u -p -r1.24 memory.c
--- linux-2.4/mm/memory.c 29 Nov 2002 02:21:13 -0000      1.24
+++ linux-2.4/mm/memory.c 25 Sep 2003 14:22:42 -0000
@@ -569,12 +569,7 @@ int map_user_kiobuf(int rw, struct kiobu
                return err;
        }
        iobuf->nr_pages = err;
-       while (pgcount--) {
-               /* FIXME: flush superflous for rw==READ,
-                * probably wrong function for rw==WRITE
-                */
-               flush_dcache_page(iobuf->maplist[pgcount]);
-       }
+       flush_cache_range(mm, va, va + len);
        dprintk ("map_user_kiobuf: end OK\n");
        return 0;
 }

I deleted the comment because it's not correct ;-)  The kernel is about
to access these pages.  Any existing cache for the contents of those pages
must now be invalidated if the kernel's about to write to it, and must be
written back if the kernel's about to read from it.  flush_cache_range()
must already have these properties otherwise munmap() wouldn't work.

--
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies.
Do you think I want to have an academic debate on this subject?" -- Robert
Fisk
