From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [GIT PULL] parisc fixes for 3.0
Date: Thu, 04 Aug 2011 10:52:37 -0500
Message-ID: <1312473157.3034.50.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is basically three bug fixes that turned up recently (one wire up
of a syscall, a futex fix and an atomic problem with variable size)

The patches are here:

master.kernel.org:/pub/scm/linux/kernel/git/jejb/parisc-2.6.git#fixes

The short changelog is:

Carlos O'Donell (1):
      [PARISC] Fix futex support

James Bottomley (1):
      [PARISC] wire up sendmmsg syscall

John David Anglin (1):
      [PARISC] fix return type of __atomic64_add_return

The diffstat is:

 arch/parisc/include/asm/atomic.h   |    4 +-
 arch/parisc/include/asm/futex.h    |   66 ++++++++++++++++++++++++++++++++---
 arch/parisc/include/asm/unistd.h   |    3 +-
 arch/parisc/kernel/syscall_table.S |    1 +
 4 files changed, 65 insertions(+), 9 deletions(-)

And the full diff is attached below.

James

---

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index f819559..26fd114 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -259,10 +259,10 @@ static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
 
 #define ATOMIC64_INIT(i) ((atomic64_t) { (i) })
 
-static __inline__ int
+static __inline__ s64
 __atomic64_add_return(s64 i, atomic64_t *v)
 {
-	int ret;
+	s64 ret;
 	unsigned long flags;
 	_atomic_spin_lock_irqsave(v, flags);
 
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 67a33cc..2388bdb 100644
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
@@ -18,21 +21,58 @@ futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 	if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28))
 		oparg = 1 << oparg;
 
-	if (! access_ok (VERIFY_WRITE, uaddr, sizeof(u32)))
+	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(*uaddr)))
 		return -EFAULT;
 
 	pagefault_disable();
 
+	_atomic_spin_lock_irqsave(uaddr, flags);
+
 	switch (op) {
 	case FUTEX_OP_SET:
+		/* *(int *)UADDR2 = OPARG; */
+		ret = get_user(oldval, uaddr);
+		if (!ret)
+			ret = put_user(oparg, uaddr);
+		break;
 	case FUTEX_OP_ADD:
+		/* *(int *)UADDR2 += OPARG; */
+		ret = get_user(oldval, uaddr);
+		if (!ret) {
+			val = oldval + oparg;
+			ret = put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_OR:
+		/* *(int *)UADDR2 |= OPARG; */
+		ret = get_user(oldval, uaddr);
+		if (!ret) {
+			val = oldval | oparg;
+			ret = put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_ANDN:
+		/* *(int *)UADDR2 &= ~OPARG; */
+		ret = get_user(oldval, uaddr);
+		if (!ret) {
+			val = oldval & ~oparg;
+			ret = put_user(val, uaddr);
+		}
+		break;
 	case FUTEX_OP_XOR:
+		/* *(int *)UADDR2 ^= OPARG; */
+		ret = get_user(oldval, uaddr);
+		if (!ret) {
+			val = oldval ^ oparg;
+			ret = put_user(val, uaddr);
+		}
+		break;
 	default:
 		ret = -ENOSYS;
 	}
 
+	_atomic_spin_unlock_irqrestore(uaddr, flags);
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
+	_atomic_spin_lock_irqsave(uaddr, flags);
+
+	ret = get_user(val, uaddr);
+
+	if (!ret && val == oldval)
+		ret = put_user(newval, uaddr);
+
 	*uval = val;
-	return 0;
+
+	_atomic_spin_unlock_irqrestore(uaddr, flags);
+
+	return ret;
 }
 
 #endif /*__KERNEL__*/
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index 3392de3..d61de64 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -821,8 +821,9 @@
 #define __NR_open_by_handle_at	(__NR_Linux + 326)
 #define __NR_syncfs		(__NR_Linux + 327)
 #define __NR_setns		(__NR_Linux + 328)
+#define __NR_sendmmsg		(__NR_Linux + 329)
 
-#define __NR_Linux_syscalls	(__NR_setns + 1)
+#define __NR_Linux_syscalls	(__NR_sendmmsg + 1)
 
 
 #define __IGNORE_select		/* newselect */
diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index 34a4f5a..e66366f 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -427,6 +427,7 @@
 	ENTRY_COMP(open_by_handle_at)
 	ENTRY_SAME(syncfs)
 	ENTRY_SAME(setns)
+	ENTRY_COMP(sendmmsg)
 
 	/* Nothing yet */
 


