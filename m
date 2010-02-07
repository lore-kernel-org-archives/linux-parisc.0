From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next2
Date: Sun, 07 Feb 2010 00:25:47 +0000
Message-ID: <201002070025.o170Plut020951@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 2bf59ba67ddef9c1e9e87aa3fedcf6ceac8248f2
Author: john stultz <johnstul@us.ibm.com>
Date:   Wed Dec 23 04:14:03 2009 +0000

    parisc: Convert to read/update_persistent_clock
    
    This patch converts the parisc architecture to use the generic
    read_persistent_clock and update_persistent_clock interfaces, reducing
    the amount of arch specific code we have to maintain, and allowing for
    further cleanups in the future.
    
    I have not built or tested this patch, so help from arch maintainers
    would be appreciated.
    
    Signed-off-by: John Stultz <johnstul@us.ibm.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c08051ba9604b1a1d54644bc7f9feb8911fd226e
Author: James Bottomley <James.Bottomley@suse.de>
Date:   Fri Feb 5 15:50:57 2010 +0000

    xfs: fix xfs to work with Virtually Indexed architectures
    
    xfs_buf.c includes what is essentially a hand rolled version of
    blk_rq_map_kern().  In order to work properly with the vmalloc buffers
    that xfs uses, this hand rolled routine must also implement the flushing
    API for vmap/vmalloc areas.
    
    [style updates from hch@lst.de]
    Signed-off-by: James Bottomley <James.Bottomley@suse.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 5d5a78f63b99ad8e9ef0215593998ed8e6e4dd6c
Author: James Bottomley <James.Bottomley@suse.de>
Date:   Fri Feb 5 15:50:56 2010 +0000

    sh: add mm API for DMA to vmalloc/vmap areas
    
    Signed-off-by: James Bottomley <James.Bottomley@suse.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 12805df7794465ca243da0d4bf94358d292527a3
Author: James Bottomley <James.Bottomley@suse.de>
Date:   Fri Feb 5 15:50:55 2010 +0000

    arm: add mm API for DMA to vmalloc/vmap areas
    
    ARM cannot prevent cache movein, so this patch implements both the
    flush and invalidate pieces of the API.
    
    Signed-off-by: James Bottomley <James.Bottomley@suse.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit a2030dc9b328f4fa968677a3e5797f8dd35b7b31
Author: James Bottomley <James.Bottomley@suse.de>
Date:   Fri Feb 5 15:50:54 2010 +0000

    parisc: add mm API for DMA to vmalloc/vmap areas
    
    We already have an API to flush a kernel page along an alias
    address, so use it.  The TLB purge prevents the CPU from doing
    speculative moveins on the flushed address, so we don't need to
    implement and invalidate.
    
    Signed-off-by: James Bottomley <James.Bottomley@suse.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 874f257d4af720867cba996dafeead114e37ebbe
Author: James Bottomley <James.Bottomley@suse.de>
Date:   Fri Feb 5 15:50:53 2010 +0000

    mm: add coherence API for DMA to vmalloc/vmap areas
    
    On Virtually Indexed architectures (which don't do automatic alias
    resolution in their caches), we have to flush via the correct
    virtual address to prepare pages for DMA.  On some architectures
    (like arm) we cannot prevent the CPU from doing data movein along
    the alias (and thus giving stale read data), so we not only have to
    introduce a flush API to push dirty cache lines out, but also an invalidate
    API to kill inconsistent cache lines that may have moved in before
    DMA changed the data
    
    Signed-off-by: James Bottomley <James.Bottomley@suse.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 6f137c5a33a8a25e235d1f0f614c3f3b2d83e2c8
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Thu Dec 31 20:43:55 2009 +0000

    parisc: Simplify param.h by including <asm-generic/param.h>
    
    Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 59ff3c2f58932717031f0e42041eab294d1c2583
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 2 19:06:23 2010 +0000

    parisc: drop unnecessary cast in __ldcw_align() macro
    
    __ldcw_align() can directly access the slock member of struct arch_spinlock_t
    instead of using an ugly cast.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 081e56c8424d51663ed29e69c7d3393228c90764
Author: Helge Deller <deller@gmx.de>
Date:   Mon Feb 1 19:56:33 2010 +0000

    parisc: add strict copy size checks (v2)
    
    Add CONFIG_DEBUG_STRICT_USER_COPY_CHECKS, copied from the x86
    implementation. Tested with 32 and 64bit kernel.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 06ba2126d13589c5b4b7672abb9c74198dd84957
Author: Frans Pop <elendil@planet.nl>
Date:   Sat Feb 6 17:47:14 2010 +0000

    parisc: remove trailing space in messages
    
    Signed-off-by: Frans Pop <elendil@planet.nl>
    Cc: linux-parisc@vger.kernel.org
    Cc: Kyle McMartin <kyle@mcmartin.ca>
    Cc: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 19a8f5f7e1a516ff0ac5940e211165520d7caea1
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sat Dec 26 17:19:17 2009 +0000

    parisc: ditto sys_accept4
    
    tested with test_accept4.c from de11defebf00007677fb7ee91d9b089b78786fbb
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 53fc237b2a735e99acd043e9aabd7d9423164fdf
Author: Helge Deller <deller@gmx.de>
Date:   Tue Dec 22 22:50:33 2009 +0000

    parisc: wire up sys_recvmmsg
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

