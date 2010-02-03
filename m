From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Wed, 03 Feb 2010 23:03:49 +0100
Message-ID: <4B69F2C5.30802@gmx.de>
References: <20100108211733.852134EF4@hiauly1.hia.nrc.ca> <4B689634.8060408@gmx.de> <20100203034420.GA8520@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010104090504020303010203"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100203034420.GA8520@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------010104090504020303010203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2010 04:44 AM, John David Anglin wrote:
> On Tue, 02 Feb 2010, Helge Deller wrote:
>
>> I wonder if we have some problems with the LWS code path in the kernel
>> regarding atomic locking with futexes?
>>
>> In arch/parisc/kernel/syscall.S we use a lock table called lws_lock_start[]
>> to guard the LWS code against other competing userspace processes.
>> I wonder if this really enough, esp. since we do implement futex syscalls
>> (e.g. clone/exit calls uses futex functions to change userspace values
>> because of CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID).
>>
>> Do we maybe need to protect the LWS code path with the same locking table
>> as the
>> generic kernel? Atomicity of futexes writing to userspace are not in sync
>> with the locking of the LWS/lws_lock_start[] code.
>>
>> I tried to come up with a patch for that which I attached here, but sadly
>> it hangs as soon as the init process is started on a 64bit/SMP kernel.
>> So either my thinking here is stupid, or I do have a stupid coding bug.
>>
>> Furthermore, the coding for futex_atomic_op_inuser() in
>> arch/parisc/include/asm/futex.h seems to miss real functionality.
>> I didn't looked closer into this though.
>
> While locking may be a problem, it is not the main reason the minifail
> program fails.  The program fails on my c3750 with a 32-bit UP kernel.

Hmm, I can't reproduce it at the moment with a 32bit UP kernel on my
c3000. The minifail3 test program I currently use (to avoid glibc issues)
is attached.

> There is no locking in this kernel.  The LWS code relies on the scheduler
> for atomicity.

yep. This should then work an a UP kernel.

> I tried disabling interrupts around the crucial three instructions but
> it didn't help.

Ugh.

Anyway, my current patch which compiles and runs fine is attached here as
well. Maybe you want to try it on your SMP builds? It includes the syscall.S
changes you sent last time too.
In this version of the patch I added on own LWS locking hash table for user-space accesses,
which is used in the LWS code and when some (probably not all) put_user()/
get_user() calls are made in the futex code.

Feedback still welcome.

Helge

--------------010104090504020303010203
Content-Type: text/plain;
 name="minifail3.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="minifail3.c"

#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/*
 http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=561203

 gcc  minifail3.c -o minifail3 -O0 -pthread -g

 Run as: i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail3; done;

 */

static volatile int run;

void* thread_run(void* arg) {
	write(1,"Thread OK.\n",11);
	_exit(0);
}

int main(int argc, char** argv) {
	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, NULL);

	switch (fork()) {
		case -1:
			perror("fork() failed");
		case 0:
			write(1,"Child OK.\n",10);
			exit(0);
		default:
			break;
		
	}
	pthread_join(thread, NULL);
	return 0;
}

--------------010104090504020303010203
Content-Type: text/x-patch;
 name="parisc_lock_v2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="parisc_lock_v2.patch"

diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 716634d..18d57c8 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -24,29 +24,46 @@
  * Hash function to index into a different SPINLOCK.
  * Since "a" is usually an address, use one spinlock per cacheline.
  */
-#  define ATOMIC_HASH_SIZE 4
-#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_HASH_SIZE (4096/L1_CACHE_BYTES)  /* 4 */
+#  define ATOMIC_HASH(a)      (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_USER_HASH(a) (&(__atomic_user_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
 
 extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
+extern arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned;
 
 /* Can't use raw_spin_lock_irq because of #include problems, so
  * this is the substitute */
-#define _atomic_spin_lock_irqsave(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);		\
+#define _atomic_spin_lock_irqsave_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;		\
 	local_irq_save(f);			\
 	arch_spin_lock(s);			\
 } while(0)
 
-#define _atomic_spin_unlock_irqrestore(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);			\
+#define _atomic_spin_unlock_irqrestore_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;			\
 	arch_spin_unlock(s);				\
 	local_irq_restore(f);				\
 } while(0)
 
+/* kernel memory locks */
+#define _atomic_spin_lock_irqsave(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_HASH(l))
+
+/* userspace memory locks */
+#define _atomic_spin_lock_irqsave_user(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_USER_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore_user(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_USER_HASH(l))
 
 #else
 #  define _atomic_spin_lock_irqsave(l,f) do { local_irq_save(f); } while (0)
 #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
+#  define _atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave(l,f)
+#  define _atomic_spin_unlock_irqrestore_user(l,f) _atomic_spin_lock_irqsave_user(l,f)
 #endif
 
 /* This should get optimized out since it's never called.
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 0c705c3..7bc963e 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -55,6 +55,7 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 {
 	int err = 0;
 	int uval;
+	unsigned long flags;
 
 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -65,10 +66,15 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
 		return -EFAULT;
 
+	_atomic_spin_lock_irqsave_user(uaddr, flags);
+
 	err = get_user(uval, uaddr);
-	if (err) return -EFAULT;
-	if (uval == oldval)
-		err = put_user(newval, uaddr);
+	if (!err)
+		if (uval == oldval)
+			err = put_user(newval, uaddr);
+
+	_atomic_spin_unlock_irqrestore_user(uaddr, flags);
+
 	if (err) return -EFAULT;
 	return uval;
 }
diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
index d91357b..4653c77 100644
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -160,7 +160,7 @@ static inline void set_eiem(unsigned long val)
    ldcd). */
 
 #define __PA_LDCW_ALIGNMENT	4
-#define __ldcw_align(a) ((volatile unsigned int *)a)
+#define __ldcw_align(a) (&(a)->slock)
 #define __LDCW	"ldcw,co"
 
 #endif /*!CONFIG_PA20*/
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index ec787b4..50353bd 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -290,5 +290,11 @@ int main(void)
 	BLANK();
 	DEFINE(ASM_PDC_RESULT_SIZE, NUM_PDC_RESULT * sizeof(unsigned long));
 	BLANK();
+
+#ifdef CONFIG_SMP
+	DEFINE(ASM_ATOMIC_HASH_SIZE_SHIFT, __builtin_ffs(ATOMIC_HASH_SIZE)-1);
+	DEFINE(ASM_ATOMIC_HASH_ENTRY_SHIFT, __builtin_ffs(sizeof(__atomic_hash[0]))-1);
+#endif
+
 	return 0;
 }
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cb71f3d..878f42c 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -128,6 +131,14 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "The 32-bit Kernel has started...\n");
 #endif
 
+	/* Consistency check on the size and alignments of our spinlocks */
+#ifdef CONFIG_SMP
+	BUILD_BUG_ON(sizeof(arch_spinlock_t) != __PA_LDCW_ALIGNMENT);
+	BUG_ON((unsigned long)&__atomic_hash[0] & (__PA_LDCW_ALIGNMENT-1));
+	BUG_ON((unsigned long)&__atomic_hash[1] & (__PA_LDCW_ALIGNMENT-1));
+#endif
+	BUILD_BUG_ON((1<<L1_CACHE_SHIFT) != L1_CACHE_BYTES);
+
 	pdc_console_init();
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f5f9602..1f12418 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -11,6 +11,7 @@
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <asm/page.h>
+#include <asm/cache.h>
 #include <asm/psw.h>
 #include <asm/thread_info.h>
 #include <asm/assembly.h>
@@ -47,18 +48,17 @@ ENTRY(linux_gateway_page)
 	KILL_INSN
 	.endr
 
-	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
 #define __NR_lws_entries (2)
 
 lws_entry:
-	/* Unconditional branch to lws_start, located on the 
-	   same gateway page */
-	b,n	lws_start
+	gate	lws_start, %r0		/* increase privilege */
+	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 
-	/* Fill from 0xb4 to 0xe0 */
-	.rept 11
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	KILL_INSN
 	.endr
 
@@ -423,9 +423,6 @@ tracesys_sigexit:
 
 	*********************************************************/
 lws_start:
-	/* Gate and ensure we return to userspace */
-	gate	.+8, %r0
-	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
 
 #ifdef CONFIG_64BIT
 	/* FIXME: If we are a 64-bit kernel just
@@ -473,7 +470,7 @@ lws_exit:
 	/* now reset the lowest bit of sp if it was set */
 	xor	%r30,%r1,%r30
 #endif
-	be,n	0(%sr3, %r31)
+	be,n	0(%sr7, %r31)
 
 
 	
@@ -530,18 +527,17 @@ lws_compare_and_swap32:
 
 lws_compare_and_swap:
 #ifdef CONFIG_SMP
-	/* Load start of lock table */
-	ldil	L%lws_lock_start, %r20
-	ldo	R%lws_lock_start(%r20), %r28
+	/* Calculate lock table entry via ATOMIC_HASH(%r26) */
+	ldil	L%__atomic_user_hash, %r20
+	ldo	R%__atomic_user_hash(%r20), %r28
 
-	/* Extract four bits from r26 and hash lock (Bits 4-7) */
-	extru  %r26, 27, 4, %r20
+#ifdef CONFIG_64BIT
+	extrd,u %r26, 63-L1_CACHE_SHIFT, ASM_ATOMIC_HASH_SIZE_SHIFT, %r20
+#else
+	extru	%r26, 31-L1_CACHE_SHIFT, ASM_ATOMIC_HASH_SIZE_SHIFT, %r20
+#endif
+	shladd,l %r20, ASM_ATOMIC_HASH_ENTRY_SHIFT, %r28, %r20
 
-	/* Find lock to use, the hash is either one of 0 to
-	   15, multiplied by 16 (keep it 16-byte aligned)
-	   and add to the lock table offset. */
-	shlw	%r20, 4, %r20
-	add	%r20, %r28, %r20
 
 # if ENABLE_LWS_DEBUG
 	/*	
@@ -672,31 +668,6 @@ ENTRY(sys_call_table64)
 END(sys_call_table64)
 #endif
 
-#ifdef CONFIG_SMP
-	/*
-		All light-weight-syscall atomic operations 
-		will use this set of locks 
-
-		NOTE: The lws_lock_start symbol must be
-		at least 16-byte aligned for safe use
-		with ldcw.
-	*/
-	.section .data
-	.align	PAGE_SIZE
-ENTRY(lws_lock_start)
-	/* lws locks */
-	.rept 16
-	/* Keep locks aligned at 16-bytes */
-	.word 1
-	.word 0 
-	.word 0
-	.word 0
-	.endr
-END(lws_lock_start)
-	.previous
-#endif
-/* CONFIG_SMP for lws_lock_start */
-
 .end
 
 
diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 353963d..bae6a86 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -15,6 +15,9 @@
 arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
 };
+arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
+	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
+};
 #endif
 
 #ifdef CONFIG_64BIT
diff --git a/kernel/fork.c b/kernel/fork.c
index f88bd98..108b1ed 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -608,7 +608,10 @@ void mm_release(struct task_struct *tsk, struct mm_struct *mm)
 			 * We don't check the error code - if userspace has
 			 * not set up a proper pointer then tough luck.
 			 */
+			unsigned long flags;
+			_atomic_spin_lock_irqsave_user(tsk->clear_child_tid, flags);
 			put_user(0, tsk->clear_child_tid);
+			_atomic_spin_unlock_irqrestore_user(tsk->clear_child_tid, flags);
 			sys_futex(tsk->clear_child_tid, FUTEX_WAKE,
 					1, NULL, NULL, 0);
 		}
@@ -1432,8 +1435,12 @@ long do_fork(unsigned long clone_flags,
 
 		nr = task_pid_vnr(p);
 
-		if (clone_flags & CLONE_PARENT_SETTID)
+		if (clone_flags & CLONE_PARENT_SETTID) {
+			unsigned long flags;
+			_atomic_spin_lock_irqsave_user(parent_tidptr, flags);
 			put_user(nr, parent_tidptr);
+			_atomic_spin_unlock_irqrestore_user(parent_tidptr, flags);
+		}
 
 		if (clone_flags & CLONE_VFORK) {
 			p->vfork_done = &vfork;

--------------010104090504020303010203--
