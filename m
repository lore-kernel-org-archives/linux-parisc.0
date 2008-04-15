From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Request for backport of [PARISC] futex: special case cmpxchg NULL
	in kernel space
Date: Tue, 15 Apr 2008 10:45:11 -0500
Message-ID: <1208274312.3131.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: stable@kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a fix for a bug introduced by tglx into 2.6.25 which we fixed
upstream.  However, he also got it backported to stable, so now 2.6.24.4
panics on boot on parisc.  The attached is the fix.

The upstream version of this patch is:

commit c20a84c91048c76c1379011c96b1a5cee5c7d9a0
Author: Kyle McMartin <kyle@shortfin.cabal.ca>
Date:   Sat Mar 1 10:25:52 2008 -0800

    [PARISC] futex: special case cmpxchg NULL in kernel space


James

---

From: Kyle McMartin <kyle@shortfin.cabal.ca>
Subject: [PARISC] futex: special case cmpxchg NULL in kernel space

Patch:

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

---
 include/asm-parisc/futex.h |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/asm-parisc/futex.h b/include/asm-parisc/futex.h
index dbee6e6..fdc6d05 100644
--- a/include/asm-parisc/futex.h
+++ b/include/asm-parisc/futex.h
@@ -56,6 +56,12 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
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
 
@@ -67,5 +73,5 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 	return uval;
 }
 
-#endif
-#endif
+#endif /*__KERNEL__*/
+#endif /*_ASM_PARISC_FUTEX_H*/
-- 
1.5.3.8



