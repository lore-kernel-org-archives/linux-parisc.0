From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Fri, 22 Oct 2010 01:05:16 +0000
Message-ID: <201010220105.o9M15Ghv016986@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 338e4fab3d41aa14264e10ce505a7c908633cdad
Author: Julia Lawall <julia@diku.dk>
Date:   Wed Oct 20 15:55:45 2010 -0700

    drivers/char/agp/parisc-agp.c: eliminate memory leak
    
    alloc_pci_dev allocates some memory, so that memory should be freed before
    leaving the function in an error case.
    
    A simplified version of the semantic match that finds this problem is:
    (http://coccinelle.lip6.fr/)
    
    // <smpl>
    @r exists@
    local idexpression x;
    expression E;
    identifier f1;
    iterator I;
    @@
    
    x = alloc_pci_dev(...);
    <... when != x
         when != true (x == NULL || ...)
         when != if (...) { <+...x...+> }
         when != I (...) { <+...x...+> }
    (
     x == NULL
    |
     x == E
    |
     x->f1
    )
    ...>
    * return ...;
    // </smpl>
    
    Signed-off-by: Julia Lawall <julia@diku.dk>
    Dan Carpenter <error27@gmail.com>
    Dave Airlie <airlied@linux.ie>
    Cc: Helge Deller <deller@gmx.de>
    Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

