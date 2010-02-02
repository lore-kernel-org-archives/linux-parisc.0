From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Tue, 02 Feb 2010 22:16:36 +0100
Message-ID: <4B689634.8060408@gmx.de>
References: <20100108211733.852134EF4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080806060407050402090501"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100108211733.852134EF4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------080806060407050402090501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I wonder if we have some problems with the LWS code path in the kernel
regarding atomic locking with futexes?

In arch/parisc/kernel/syscall.S we use a lock table called lws_lock_start[]
to guard the LWS code against other competing userspace processes.
I wonder if this really enough, esp. since we do implement futex syscalls
(e.g. clone/exit calls uses futex functions to change userspace values
because of CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID).

Do we maybe need to protect the LWS code path with the same locking table as the
generic kernel? Atomicity of futexes writing to userspace are not in sync
with the locking of the LWS/lws_lock_start[] code.

I tried to come up with a patch for that which I attached here, but sadly
it hangs as soon as the init process is started on a 64bit/SMP kernel.
So either my thinking here is stupid, or I do have a stupid coding bug.

Furthermore, the coding for futex_atomic_op_inuser() in
arch/parisc/include/asm/futex.h seems to miss real functionality.
I didn't looked closer into this though.

Helge

--------------080806060407050402090501
Content-Type: text/plain;
 name="z1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="z1"

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
index f5f9602..7925a68 100644
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
@@ -530,18 +527,17 @@ lws_compare_and_swap32:
 
 lws_compare_and_swap:
 #ifdef CONFIG_SMP
-	/* Load start of lock table */
-	ldil	L%lws_lock_start, %r20
-	ldo	R%lws_lock_start(%r20), %r28
+	/* Calculate lock table entry via ATOMIC_HASH(%r26) */
+	ldil	L%__atomic_hash, %r20
+	ldo	R%__atomic_hash(%r20), %r28
 
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
--------------080806060407050402090501--
