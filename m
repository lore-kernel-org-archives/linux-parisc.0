From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/next
Date: Sat, 14 Nov 2009 05:12:31 +0000
Message-ID: <200911140512.nAE5CVhw020161@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

New commits:
commit 933c58608e5987385409975d33ba8c65815f63a0
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Fri Nov 6 22:41:51 2009 +0000

    parisc: Replace old style lock init in smp.c
    
    SPIN_LOCK_UNLOCKED is deprecated. Init the per cpu locks at runtime
    instead.
    
    (Also kills the unused smp_lock --kyle)
    
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 5b1d9233f6e8c0a1d164bc8f1915dea070a34016
Author: Helge Deller <deller@gmx.de>
Date:   Fri Nov 6 23:07:42 2009 +0000

    parisc: use sort() instead of home-made implementation (v2)
    
    Signed-off-by: Helge Deller <deller@gmx.de>
    Signed-off-by: Randolph Chung <tausq@parisc-linux.org>
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 95c26d0060afd79557cc445944e292f068bb3ed8
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sat Nov 14 00:09:02 2009 -0500

    Revert "parisc: use sort() instead of home-made implementation"
    
    This reverts commit b8d46862d910c3be7c28c627204da968c174aa9a which contained
    a bug as documented by Helge in his follow-up mail.
    
    Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

