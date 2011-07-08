From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Fri, 08 Jul 2011 17:27:00 -0400
Message-ID: <4E177624.1030500@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Implements futex op support and makes futex cmpxchg atomic.
Tested on 64-bit SMP kernel running on 2 x PA8700s.

Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>
---
 futex.h |   64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 67a33cc..94f2f4d 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -5,11 +5,14 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
+#include <asm/atomic.h>
 #include <asm/errno.h>
 
 static inline int
 futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 {
+	unsigned long int flags;
+	u32 val;
 	int op = (encoded_op >> 28) & 7;
 	int cmp = (encoded_op >> 24) & 15;
 	int oparg = (encoded_op << 8) >> 20;
@@ -23,16 +26,53 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 
 	pagefault_disable();
 
+	_atomic_spin_lock_irqsave (uaddr, flags);
+
 	switch (op) {
 	case FUTEX_OP_SET:
+		/* *(int *)UADDR2 = OPARG; */
+		ret = get_user (oldval, uaddr);
+		if (!ret)
+			ret = put_user (oparg, uaddr);
+		break;
 	case FUTEX_OP_ADD:
+		/* *(int *)UADDR2 += OPARG; */
+		ret = get_user (oldval, uaddr);
+		if (!ret) {
+			val = oldval + oparg;
+			ret = put_user (val, uaddr);
+		}
+		break;
 	case FUTEX_OP_OR:
+		/* *(int *)UADDR2 |= OPARG; */
+		ret = get_user (oldval, uaddr);
+		if (!ret) {
+			val = oldval | oparg;
+			ret = put_user (val, uaddr);
+		}
+		break;
 	case FUTEX_OP_ANDN:
+		/* *(int *)UADDR2 &= ~OPARG; */
+		ret = get_user (oldval, uaddr);
+		if (!ret) {
+			val = oldval & ~oparg;
+			ret = put_user (val, uaddr);
+		}
+		break;
 	case FUTEX_OP_XOR:
+		/* *(int *)UADDR2 ^= OPARG; */
+		ret = get_user (oldval, uaddr);
+		if (!ret) {
+			val = oldval ^ oparg;
+			ret = put_user (val, uaddr);
+		}
+		break;
 	default:
 		ret = -ENOSYS;
 	}
 
+	_atomic_spin_unlock_irqrestore (uaddr, flags);
+
 	pagefault_enable();
 
 	if (!ret) {
@@ -54,7 +94,9 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
+	int ret;
 	u32 val;
+	unsigned long flags;
 
 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -65,12 +107,24 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
 		return -EFAULT;
 
-	if (get_user(val, uaddr))
-		return -EFAULT;
-	if (val == oldval && put_user(newval, uaddr))
-		return -EFAULT;
+	/* HPPA has no cmpxchg in hardware and therefore the 
+	 * best we can do here is use an array of locks. The
+	 * lock selected is based on a hash of the userspace
+	 * address. This should scale to a couple of CPUs.
+	 */
+
+	_atomic_spin_lock_irqsave (uaddr, flags);
+
+	ret = get_user(val, uaddr);
+
+	if (!ret && val == oldval)
+		ret = put_user (newval, uaddr);
+
 	*uval = val;
-	return 0;
+
+	_atomic_spin_unlock_irqrestore (uaddr, flags);
+
+	return ret;
 }
 
 #endif /*__KERNEL__*/
