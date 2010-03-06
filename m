From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Sat, 06 Mar 2010 22:58:37 +0000
Message-ID: <201003062258.o26Mwb9x000577@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 6ee77658ce387ad6c85dcbda4a68bc33efd8de39
Author: Akinobu Mita <akinobu.mita@gmail.com>
Date:   Sun Feb 28 10:58:15 2010 +0000

    parisc: use __ratelimit in unaligned.c
    
    Replace open-coded rate limiting logic with __ratelimit().
    
    Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit c60185248fd1c7b777f08d3f3337836331da3d17
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
    Acked-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit eef83afbd6c2577c9fd07e1a280bb0beb603b293
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Thu Dec 31 20:43:55 2009 +0000

    parisc: Simplify param.h by including <asm-generic/param.h>
    
    Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 1d747c7e7b754cacb9bc8d31854bdc3a58d70597
Author: Helge Deller <deller@gmx.de>
Date:   Tue Feb 2 19:06:23 2010 +0000

    parisc: drop unnecessary cast in __ldcw_align() macro
    
    __ldcw_align() can directly access the slock member of struct arch_spinlock_t
    instead of using an ugly cast.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 888c31fc83ddc7fcd9947cb67c5718b4e3dd5e1b
Author: Helge Deller <deller@gmx.de>
Date:   Mon Feb 1 19:56:33 2010 +0000

    parisc: add strict copy size checks (v2)
    
    Add CONFIG_DEBUG_STRICT_USER_COPY_CHECKS, copied from the x86
    implementation. Tested with 32 and 64bit kernel.
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit a3bee03e718c9251456676b71a723a34c999e891
Author: Frans Pop <elendil@planet.nl>
Date:   Sat Feb 6 17:47:14 2010 +0000

    parisc: remove trailing space in messages
    
    Signed-off-by: Frans Pop <elendil@planet.nl>
    Cc: linux-parisc@vger.kernel.org
    Cc: Kyle McMartin <kyle@mcmartin.ca>
    Cc: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 81e4a5e3057740a625cf556879ae0becf6199f8c
Author: Kyle McMartin <kyle@mcmartin.ca>
Date:   Sat Dec 26 17:19:17 2009 +0000

    parisc: ditto sys_accept4
    
    tested with test_accept4.c from de11defebf00007677fb7ee91d9b089b78786fbb
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 9ceb38e6b691debe4bf04cb63165c503a8556177
Author: Helge Deller <deller@gmx.de>
Date:   Tue Dec 22 22:50:33 2009 +0000

    parisc: wire up sys_recvmmsg
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

