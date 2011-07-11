From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Mon, 11 Jul 2011 18:46:29 -0400
Message-ID: <13AFD499-CFA5-407A-B15D-F6A8AA38FA26@bell.net>
References: <4E177624.1030500@systemhalted.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary=Apple-Mail-1--742775489
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E177624.1030500@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-1--742775489
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Tested on rp3440 with 3.0.0-rc6+.  Two full builds and checks of GCC  
have been done with
make -j6.  No anomalous behaviour was observed (i.e., this change may  
fix the gnat1 bug
that I previously reported).  Attached is full patch set used in  
testing.

Tested-by: John David Anglin <dave.anglin@bell.net>

On 8-Jul-11, at 5:27 PM, Carlos O'Donell wrote:

> Implements futex op support and makes futex cmpxchg atomic.
> Tested on 64-bit SMP kernel running on 2 x PA8700s.
>
> Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>
> ---
> futex.h |   64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
> +++++-----
> 1 file changed, 59 insertions(+), 5 deletions(-)
>
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/ 
> asm/futex.h
> index 67a33cc..94f2f4d 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
> @@ -5,11 +5,14 @@
>
> #include <linux/futex.h>
> #include <linux/uaccess.h>
> +#include <asm/atomic.h>
> #include <asm/errno.h>
>
> static inline int
> futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
> {
> +	unsigned long int flags;
> +	u32 val;
> 	int op = (encoded_op >> 28) & 7;
> 	int cmp = (encoded_op >> 24) & 15;
> 	int oparg = (encoded_op << 8) >> 20;
> @@ -23,16 +26,53 @@ futex_atomic_op_inuser (int encoded_op, u32  
> __user *uaddr)
>
> 	pagefault_disable();
>
> +	_atomic_spin_lock_irqsave (uaddr, flags);
> +
> 	switch (op) {
> 	case FUTEX_OP_SET:
> +		/* *(int *)UADDR2 = OPARG; */
> +		ret = get_user (oldval, uaddr);
> +		if (!ret)
> +			ret = put_user (oparg, uaddr);
> +		break;
> 	case FUTEX_OP_ADD:
> +		/* *(int *)UADDR2 += OPARG; */
> +		ret = get_user (oldval, uaddr);
> +		if (!ret) {
> +			val = oldval + oparg;
> +			ret = put_user (val, uaddr);
> +		}
> +		break;
> 	case FUTEX_OP_OR:
> +		/* *(int *)UADDR2 |= OPARG; */
> +		ret = get_user (oldval, uaddr);
> +		if (!ret) {
> +			val = oldval | oparg;
> +			ret = put_user (val, uaddr);
> +		}
> +		break;
> 	case FUTEX_OP_ANDN:
> +		/* *(int *)UADDR2 &= ~OPARG; */
> +		ret = get_user (oldval, uaddr);
> +		if (!ret) {
> +			val = oldval & ~oparg;
> +			ret = put_user (val, uaddr);
> +		}
> +		break;
> 	case FUTEX_OP_XOR:
> +		/* *(int *)UADDR2 ^= OPARG; */
> +		ret = get_user (oldval, uaddr);
> +		if (!ret) {
> +			val = oldval ^ oparg;
> +			ret = put_user (val, uaddr);
> +		}
> +		break;
> 	default:
> 		ret = -ENOSYS;
> 	}
>
> +	_atomic_spin_unlock_irqrestore (uaddr, flags);
> +
> 	pagefault_enable();
>
> 	if (!ret) {
> @@ -54,7 +94,9 @@ static inline int
> futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> 			      u32 oldval, u32 newval)
> {
> +	int ret;
> 	u32 val;
> +	unsigned long flags;
>
> 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
> 	 * our gateway page, and causes no end of trouble...
> @@ -65,12 +107,24 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32  
> __user *uaddr,
> 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
> 		return -EFAULT;
>
> -	if (get_user(val, uaddr))
> -		return -EFAULT;
> -	if (val == oldval && put_user(newval, uaddr))
> -		return -EFAULT;
> +	/* HPPA has no cmpxchg in hardware and therefore the
> +	 * best we can do here is use an array of locks. The
> +	 * lock selected is based on a hash of the userspace
> +	 * address. This should scale to a couple of CPUs.
> +	 */
> +
> +	_atomic_spin_lock_irqsave (uaddr, flags);
> +
> +	ret = get_user(val, uaddr);
> +
> +	if (!ret && val == oldval)
> +		ret = put_user (newval, uaddr);
> +
> 	*uval = val;
> -	return 0;
> +
> +	_atomic_spin_unlock_irqrestore (uaddr, flags);
> +
> +	return ret;
> }
>
> #endif /*__KERNEL__*/
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Dave
--Apple-Mail-1--742775489
Content-Disposition: attachment;
	filename=linux-3.0-20110711.d
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="linux-3.0-20110711.d"
Content-Transfer-Encoding: 7bit

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
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 83335f3..1449259 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -75,14 +75,16 @@ EXPORT_SYMBOL(flush_cache_all_local);
 void
 update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
-	struct page *page = pte_page(*ptep);
+        unsigned long pfn = pte_pfn(*ptep);
+        struct page *page;
 
-	if (pfn_valid(page_to_pfn(page)) && page_mapping(page) &&
-	    test_bit(PG_dcache_dirty, &page->flags)) {
+        if (!pfn_valid(pfn))
+                return;
 
-		flush_kernel_dcache_page(page);
-		clear_bit(PG_dcache_dirty, &page->flags);
-	} else if (parisc_requires_coherency())
+        page = pfn_to_page(pfn);
+
+        if (test_and_clear_bit(PG_dcache_dirty, &page->flags)
+	    || parisc_requires_coherency())
 		flush_kernel_dcache_page(page);
 }
 
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index c0b1aff..0299d63 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -410,11 +410,13 @@ void __init init_IRQ(void)
 {
 	local_irq_disable();	/* PARANOID - should already be disabled */
 	mtctl(~0UL, 23);	/* EIRR : clear all pending external intr */
-	claim_cpu_irqs();
 #ifdef CONFIG_SMP
-	if (!cpu_eiem)
+	if (!cpu_eiem) {
+		claim_cpu_irqs();
 		cpu_eiem = EIEM_MASK(IPI_IRQ) | EIEM_MASK(TIMER_IRQ);
+	}
 #else
+	claim_cpu_irqs();
 	cpu_eiem = EIEM_MASK(TIMER_IRQ);
 #endif
         set_eiem(cpu_eiem);	/* EIEM : enable all external intr */
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index c9b9322..f0cb56e 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -92,11 +92,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	/* Might want to check for cache aliasing issues for MAP_FIXED case
-	 * like ARM or MIPS ??? --BenH.
-	 */
-	if (flags & MAP_FIXED)
+	if (flags & MAP_FIXED) {
+		if ((flags & MAP_SHARED) &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
 		return addr;
+	}
 	if (!addr)
 		addr = TASK_UNMAPPED_BASE;
 
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index d5a3009..0e6d33d 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -531,6 +531,7 @@ out_eoi:
 void
 handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 {
+	struct irqaction *action;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	kstat_incr_irqs_this_cpu(irq, desc);
@@ -538,7 +539,9 @@ handle_percpu_irq(unsigned int irq, struct irq_desc *desc)
 	if (chip->irq_ack)
 		chip->irq_ack(&desc->irq_data);
 
-	handle_irq_event_percpu(desc, desc->action);
+	action = desc->action;
+	if (action)
+		handle_irq_event_percpu(desc, action);
 
 	if (chip->irq_eoi)
 		chip->irq_eoi(&desc->irq_data);

--Apple-Mail-1--742775489
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7bit


--
John David Anglin	dave.anglin@bell.net




--Apple-Mail-1--742775489--
