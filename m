Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7712948A5
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 08:26:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A2X4Z-0000yP-9A; Thu, 25 Sep 2003 15:26:23 +0100
Date: Thu, 25 Sep 2003 15:26:23 +0100
From: Matthew Wilcox <willy@debian.org>
To: santosh.abraham@hp.com
Cc: 'Randolph Chung' <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org,
	"Stephen C. Tweedie" <sct@redhat.com>,
	"David S. Miller" <davem@redhat.com>
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
References: <20030925105005.GX16872@tausq.org> <000801c38356$dea5cda0$e5624c0f@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000801c38356$dea5cda0$e5624c0f@india.hp.com>
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
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
