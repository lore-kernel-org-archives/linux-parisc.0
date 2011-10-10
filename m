From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 10 Oct 2011 16:27:41 -0400
Message-ID: <BLU0-SMTP4016B341D99CEA04B6902197FD0@phx.gbl>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <c8d367ff965bc196cc6964ad56d64d72.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-6-668844961"
Cc: linux-parisc@vger.kernel.org
To: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c8d367ff965bc196cc6964ad56d64d72.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-6-668844961
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 10-Oct-11, at 10:30 AM, Rolf Eike Beer wrote:

> This needs tabs.

Sorry, linux style isn't what I normally use.  Change has been updated  
with tabs.

Signed-off-by:  John David Anglin  <dave.anglin@bell.net>


--Apple-Mail-6-668844961
Content-Disposition: attachment; filename="futex.h.d.1"
Content-Type: application/octet-stream; x-unix-mode=0644; name="futex.h.d.1"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 2388bdb..7839285 100644
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
+	extern u32 lws_lock_start[];
+	long index = ((long)uaddr & 0xf0) >> 2;
+	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	local_irq_save(*flags);
+	arch_spin_lock(s);
+}
+
+static inline void
+_futex_spin_unlock_irqrestore (u32 __user *uaddr, unsigned long int *flags)
+{
+	extern u32 lws_lock_start[];
+	long index = ((long)uaddr & 0xf0) >> 2;
+	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
+	arch_spin_unlock(s);
+	local_irq_restore(*flags);
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

--Apple-Mail-6-668844961
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit




Dave
--
John David Anglin	dave.anglin@bell.net




--Apple-Mail-6-668844961--
