From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] Add LWS, Add atomic CAS. Please review! :)
Date: Sun, 15 Aug 2004 17:11:47 -0400
Message-ID: <20040815211147.GC27047@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


parisc,

Skip to the bottom and review the patch please :)

The following code adds light-weight-syscall infrastructure to parisc.
There are a couple of issues one should understand:

a. The user calls an LWS by a similar method to making a syscall,
   you jump to an entry point on the gateway page. I merely took 
   one of those addresses and made it the LWS entry.

b. All the code for the LWS runs with the users space ids in every
   sr except sr2, which is used to access all kernel data. The only 
   kernel data we currently access is a set of SMP locks for CAS.
   We do not load the kernel space because we want the exception
   handlers to *think* it's just a userspace program and kill it 
   when it does bad things (as opposed to killing the kernel).

c. The fast path is very fast. The slow path is *very* slow.
   I've provided code to test LWS with cr16 timing, please examine

        http://cvs.parisc-linux.org/userspace/test-lws/

The following is the list of testing I've done:

0. Tested on two 32-bit systems, 712/100 and C3000, UP and SMP.
   Userspace test completes without issue.

1. Build tested the 64-bit changes, haven't been able to boot
   a 64-bit box with a new kernel. If someone wants to build a 64-bit
   kernel and run the userspace test I would be appreciated!

The tests covers the following:

a. Testing CAS.
b. Testing calling LWS with invalid LWS #.
c. Testing CAS with invalid addresses.
d. Testing CAS with unaligned addresses.
e. Testing CAS over swapped out pages under high memory pressure.

Tests I want to write:

a. Multithreaded, attempting to deliver kills to children while
   they try to CAS. Here I attempt to show that you *can not* deliver a
   kill signal to a thread while it is in the middle of CAS. The only
   way to prove this is to compile with SMP and show that the locks are
   not being unlocked. Usually you prove this by having a signal handler
   that tries CAS again on the same adress, which will deadlock because
   the handler is in the middle of the mutex we try to make in CAS.

Here is the patch, ok to apply?

Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.12
diff -u -p -r1.12 syscall.S
--- arch/parisc/kernel/syscall.S	26 Apr 2004 15:57:53 -0000	1.12
+++ arch/parisc/kernel/syscall.S	15 Aug 2004 20:55:46 -0000
@@ -16,6 +16,8 @@
 #include <asm/assembly.h>
 #include <asm/processor.h>
 
+#include <linux/config.h> /* for CONFIG_SMP */
+
 #ifdef __LP64__
 	.level          2.0w
 #else
@@ -38,21 +40,62 @@
 	.align 4096
 linux_gateway_page:
 
-	.rept 56
+        /* ADDRESS 0x00 to 0xb0 = 176 bytes / 4 bytes per insn = 44 insns */
+	.rept 44
+	break   0,0
+	.endr
+
+	/* ADDRESS 0xb0 to 0xd8, lws uses 2 insns for entry */
+	/* Light-weight-syscall entry must always be located at 0xb0 
+
+		r20 - lws number
+		r26,r25,r24,r23,r22 - Input registers
+		r28 - Function return register
+		r21 - Error code.
+
+		Scracth: Any of the above that aren't being
+		currently used, including r1. 
+
+		Return pointer: r31 (Not usable)
+	*/
+
+/* WARNING: Keep this number updated with table size changes */
+#define __NR_lws_entries (1)
+
+/* Relocate symbols assuming linux_gateway_page is mapped
+   to virtual address 0x0 */
+#if defined(__LP64__)
+#  define LWS_ENTRY(_name_) .dword lws_##_name_ - linux_gateway_page
+#else
+#  define LWS_ENTRY(_name_) .word  lws_##_name_ - linux_gateway_page
+#endif
+
+lws_entry:
+	/* Unconditional branch to lws_start, located on the 
+	   same gateway page */
+	b lws_start
+	nop
+
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	break   0,0
 	.endr
 
+	/* This function MUST be located at 0xe0 for glibc's threading 
+	mechanism to work. DO NOT MOVE THIS CODE EVER! */
 set_thread_pointer:
 	gate	.+8, %r0		/* increase privilege */
 	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 	be	0(%sr7,%r31)		/* return to user space */
 	mtctl	%r26, %cr27		/* move arg0 to the control register */
 
+	/* Increase the chance of trapping if random jumps occur to this
+	address, fill from 0xf0 to 0x100 */
 	.rept 4
 	break   0,0
 	.endr
 
-/* This address must remain fixed, or user binaries go splat. */
+/* This address must remain fixed at 0x100 for glibc's syscalls to work */
 	.align 256
 linux_gateway_entry:
 	gate	.+8, %r0			/* become privileged */
@@ -177,11 +220,8 @@ linux_gateway_entry:
 	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 	
-#ifdef __LP64__
-	ldd,s   %r20(%r19), %r19
-#else
-	ldwx,s  %r20(%r19), %r19
-#endif
+	LDREGX  %r20(%r19), %r19
+
 	/* If this is a sys_rt_sigreturn call, and the signal was received
 	 * when not in_syscall, then we want to return via syscall_exit_rfi,
 	 * not syscall_exit.  Signal no. in r20, in_syscall in r25 (see
@@ -291,11 +331,8 @@ tracesys_next:	
 	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 
-#ifdef __LP64__
-	ldd,s   %r20(%r19), %r19
-#else
-	ldwx,s  %r20(%r19), %r19
-#endif
+	LDREGX  %r20(%r19), %r19
+
 	/* If this is a sys_rt_sigreturn call, and the signal was received
 	 * when not in_syscall, then we want to return via syscall_exit_rfi,
 	 * not syscall_exit.  Signal no. in r20, in_syscall in r25 (see
@@ -344,6 +381,172 @@ tracesys_sigexit:
 	ldil	L%syscall_exit_rfi,%r1
 	be,n	R%syscall_exit_rfi(%sr7,%r1)
 
+
+	/* Light-weight-syscall code */
+
+lws_start:
+	/* Gate and ensure we return to userspace */
+	gate	.+8, %r0
+	depi	3, 31, 2, %r31
+
+        /* Is the lws entry number valid? */
+	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	b,n	lws_exit_nosys
+
+	/* WARNING: Trashing sr2 and sr3 */
+	mfsp	%sr7,%r1			/* get userspace into sr3 */
+	mtsp	%r1,%sr3
+	mtsp	%r0,%sr2			/* get kernel space into sr2 */
+
+	/* Load table start */
+	ldil	L%lws_table, %r1
+	ldo	R%lws_table(%r1), %r28	/* Scratch use of r28 */
+	LDREGX	%r20(%sr2,r28), %r20
+
+	/* Jump to lws, lws table pointers already relocated */
+	be,n	0(%sr2,%r20)
+	/* WARNING: lws must issue the return to userspace! */
+
+lws_exit_nosys:
+	/* Return to userspace */
+	be	0(%sr3, %r31)
+	ldo	-ENOSYS(%r0),%r21		   /* set errno */
+
+lws_compare_and_swap:
+	/*
+		Implementing CAS as an atomic operation:
+
+		%r26 - Address to examine
+		%r25 - Old value to check (old)
+		%r24 - New value to set (new)
+		%r28 - Return prev through this register.
+
+		Scratch: r20, r28, r1
+	*/
+
+#ifdef CONFIG_SMP
+	.import lws_lock_start
+	/* Load start of lock table */
+	ldil	L%lws_lock_start, %r20
+	ldo	R%lws_lock_start(%r20), %r28
+
+	/* Extract four bits from r26 and hash lock (Bits 4-7) */
+	extru  %r26, 27, 4, %r20
+
+	/* Find lock to use, the hash is either one of 0 to
+	   15, multiplied by 16 (keep it 16-byte aligned)
+	   and add to the lock table offset. */
+	shlw	%r20, 4, %r20
+	add	%r20, %r28, %r20
+#endif
+
+cas_lock_loop:
+	rsm	PSW_SM_I, %r0
+
+#ifdef CONFIG_SMP
+	ldcw	0(%sr2,%r20), %r28
+	cmpb,<>,n	%r0, %r28, cas_action
+	ssm	PSW_SM_I, %r0
+	ldw	0(%sr2,%r20), %r28
+cas_read_loop:
+	cmpb,=,n	%r0, %r28, cas_read_loop
+	ldw	0(%sr2,%r20), %r28
+	b	cas_lock_loop
+#endif
+
+	/*
+		prev = *addr;
+		if ( prev == old )
+		  *addr = new;
+		return prev;
+	*/
+
+cas_action:
+	/* The load and store could fail */
+1:	ldw	0(%sr3,%r26), %r28
+	sub,<>	%r28, %r25, %r0
+2:	stw	%r24, 0(%sr3,%r26)
+	/* No errors */
+	copy	%r0, %r21
+#ifdef CONFIG_SMP
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+#endif
+	/* Return to userspace */
+	be	0(%sr3, %r31)
+	/* Turn I-bit back on */
+	ssm	PSW_SM_I, %r0
+
+3:		
+	/* Error occured on load or store */
+#ifdef CONFIG_SMP
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+#endif
+	/* Turn I-bit back on */
+	ssm	PSW_SM_I, %r0
+	be	0(%sr3, %r31)
+	ldo	-EFAULT(%r0),%r21		   /* set errno */
+
+	/* Two exception table entries, one for the load,
+	   the other for the store. Either return -EFAULT */
+	.section __ex_table,"aw"
+#ifdef __LP64__
+	.dword	2b - linux_gateway_page
+	.dword	(3b - 2b) 
+#else
+	.word	2b - linux_gateway_page
+	.word	(3b - 2b) 
+#endif
+	.previous
+
+	.section __ex_table,"aw"
+#ifdef __LP64__
+	.dword	1b - linux_gateway_page
+	.dword	(3b - 1b) 
+#else
+	.word	1b - linux_gateway_page
+	.word	(3b - 1b) 
+#endif
+	.previous
+
+end_compare_and_swap:
+
+
+	/* Make sure nothing else is placed on this page */
+
+	.align 4096
+	.export end_linux_gateway_page
+end_linux_gateway_page:
+
+	/*
+		All light-weight-syscall atomic operations 
+		will use this set of locks 
+	*/
+	.section .data
+	.align 4096
+	.export lws_lock_start
+lws_lock_start:
+	/* lws locks */
+	.align 16
+	.rept 16
+	/* Keep locks aligned at 16-bytes */
+	.word 1
+	.word 1
+	.word 1
+	.word 1
+	.endr
+	.previous
+
+	.align 4096
+	/* Light-weight-syscall table */
+	/* Start of lws table. */
+	/* FIXME: global symbol */
+lws_table:
+	LWS_ENTRY(compare_and_swap)	/* 0 - Atomic compare and swap */
+lws_end_table:
+	/* End of lws table */
+
 	.align 4096
 	.export sys_call_table
 .Lsys_call_table:
@@ -359,10 +562,4 @@ sys_call_table64:
 #include "syscall_table.S"
 #endif
 
-
-	/* Make sure nothing else is placed on this page */
