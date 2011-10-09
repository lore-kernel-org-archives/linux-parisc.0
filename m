From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Sun, 9 Oct 2011 16:40:10 -0400
Message-ID: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, kyle@mcmartin.ca, deller@gmx.de,
	carlos@systemhalted.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In debugging the failure of the glibc tst-cond18 test on parisc, I realized
that futexes need to use the same locks the lws calls.  This fixes all the
pthread 'cond' tests.  Sadly, there are still problems with thread cancellation.

Signed-of-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 2388bdb..a8d0586 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -8,6 +8,29 @@
 #include <asm/atomic.h>
 #include <asm/errno.h>
 
+/* The following has to match the LWS code in syscall.S.  We have
+   sixteen four-word locks. */
+
+static inline void
+_futex_spin_lock_irqsave (u32 __user *uaddr, unsigned long int *flags)
+{
+  extern u32 lws_lock_start[];
+  long index = ((long)uaddr & 0xf0) >> 2;
+  arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+  local_irq_save(*flags);
+  arch_spin_lock(s);
+}
+
+static inline void
+_futex_spin_unlock_irqrestore (u32 __user *uaddr, unsigned long int *flags)
+{
+  extern u32 lws_lock_start[];
+  long index = ((long)uaddr & 0xf0) >> 2;
+  arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+  arch_spin_unlock(s);
+  local_irq_restore(*flags);
+}
+
 static inline int
 futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 {
@@ -26,7 +49,7 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 
 	pagefault_disable();
 
-	_atomic_spin_lock_irqsave(uaddr, flags);
+	_futex_spin_lock_irqsave(uaddr, &flags);
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -71,7 +94,7 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 		ret = -ENOSYS;
 	}
 
-	_atomic_spin_unlock_irqrestore(uaddr, flags);
+	_futex_spin_unlock_irqrestore(uaddr, &flags);
 
 	pagefault_enable();
 
@@ -113,7 +136,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	 * address. This should scale to a couple of CPUs.
 	 */
 
-	_atomic_spin_lock_irqsave(uaddr, flags);
+	_futex_spin_lock_irqsave(uaddr, &flags);
 
 	ret = get_user(val, uaddr);
 
@@ -122,7 +145,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	*uval = val;
 
-	_atomic_spin_unlock_irqrestore(uaddr, flags);
+	_futex_spin_unlock_irqrestore(uaddr, &flags);
 
 	return ret;
 }

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
