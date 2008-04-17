From: chrisw@sous-sol.org
Subject: patch parisc-futex-special-case-cmpxchg-null-in-kernel-space.patch queued to 2.6.24-stable tree
Date: Wed, 16 Apr 2008 17:29:30 -0700
Message-ID: <200804170029.m3H0TU5u009587@sous-sol.org>
References: <1208274312.3131.11.camel@localhost.localdomain>
Cc: stable@kernel.org, stable-commits@vger.kernel.org
To: James.Bottomley@HansenPartnership.com, chrisw@sous-sol.org,
	kyle@mcmartin.ca, kyle@shortfin.cabal.ca,
	linux-parisc@vger.kernel.org, tglx@linutronix.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1208274312.3131.11.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


This is a note to let you know that we have just queued up the patch titled

     Subject: PARISC futex: special case cmpxchg NULL in kernel space

to the 2.6.24-stable tree.  Its filename is

     parisc-futex-special-case-cmpxchg-null-in-kernel-space.patch

A git repo of this tree can be found at 
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary


>From stable-bounces@linux.kernel.org  Wed Apr 16 16:44:42 2008
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: stable@kernel.org
Date: Tue, 15 Apr 2008 10:45:11 -0500
Message-Id: <1208274312.3131.11.camel@localhost.localdomain>
Cc: Parisc List <linux-parisc@vger.kernel.org>
Subject: PARISC futex: special case cmpxchg NULL in kernel space

From: Kyle McMartin <kyle@shortfin.cabal.ca>

upstream commit: c20a84c91048c76c1379011c96b1a5cee5c7d9a0

commit f9e77acd4060fefbb60a351cdb8d30fca27fe194
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Sun Feb 24 02:10:05 2008 +0000

    futex: runtime enable pi and robust functionality
 

which was backported to stable based on mainline Commit
a0c1e9073ef7428a14309cba010633a6cd6719ea added code to futex.c
to detect whether futex_atomic_cmpxchg_inatomic was implemented at run
time:

+       curval = cmpxchg_futex_value_locked(NULL, 0, 0);
+       if (curval == -EFAULT)
+               futex_cmpxchg_enabled = 1;

This is bogus on parisc, since page zero in kernel virtual space is the
gateway page for syscall entry, and should not be read from the kernel.
(That, and we really don't like the kernel faulting on its own address
 space...)

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Chris Wright <chrisw@sous-sol.org>
---
 include/asm-parisc/futex.h |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/include/asm-parisc/futex.h
+++ b/include/asm-parisc/futex.h
@@ -56,6 +56,12 @@ futex_atomic_cmpxchg_inatomic(int __user
 	int err = 0;
 	int uval;
 
+	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
+	 * our gateway page, and causes no end of trouble...
+	 */
+	if (segment_eq(KERNEL_DS, get_fs()) && !uaddr)
+		return -EFAULT;
+
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
 		return -EFAULT;
 
@@ -67,5 +73,5 @@ futex_atomic_cmpxchg_inatomic(int __user
 	return uval;
 }
 
-#endif
-#endif
+#endif /*__KERNEL__*/
+#endif /*_ASM_PARISC_FUTEX_H*/


Patches currently in stable-queue which might be from James.Bottomley@HansenPartnership.com are

queue-2.6.24/parisc-pdc_console-fix-bizarre-panic-on-boot.patch
queue-2.6.24/parisc-futex-special-case-cmpxchg-null-in-kernel-space.patch
