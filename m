Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1BDA4854
	for <parisc-linux@parisc-linux.org>;
	Wed, 10 Mar 2004 08:29:05 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B15do-0001MH-RE
	for parisc-linux@parisc-linux.org; Wed, 10 Mar 2004 15:29:04 +0000
Date: Wed, 10 Mar 2004 15:29:04 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20040310152904.GV2148@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Cc: 
Subject: [parisc-linux] Anyone still caring about 2.4?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


I was just looking at a 2.4 problem for lamont so I went back to a 2.4
tree I had lying around.  I found this diff:

Index: mm/memory.c
===================================================================
RCS file: /var/cvs/linux-2.4/mm/memory.c,v
retrieving revision 1.25
diff -u -p -r1.25 memory.c
--- a/mm/memory.c       1 Dec 2003 22:52:15 -0000       1.25
+++ b/mm/memory.c       1 Dec 2003 23:08:32 -0000
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

Don't remember why I made it or whether it's right.  Thought I'd throw
it out to the mailing list rather than just delete it.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
