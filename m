From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] LWS Ready for use.
Date: Sat, 21 Aug 2004 02:31:21 -0400
Message-ID: <20040821063120.GR5207@baldric.uwo.ca>
References: <20040821062256.C852D4946B7@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040821062256.C852D4946B7@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 21, 2004 at 12:22:56AM -0600, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/08/21 00:22:56
> 
> Modified files:
> 	arch/parisc/kernel: syscall.S 
> 
> Log message:
> Add light-weight-syscall suppor to parisc. The first LWS is
> atomic CAS.

Light-Weight-Syscalls:

Are ready for use.

If you want to learn how they work, checkout the code in test-lws, I've
even provided a simple stub setup to see what a CAS call from userspace
would be like.

http://cvs.parisc-linux.org/userspace/test-lws/

Provided in the patch is two CAS functions, one for ELF32 processes to
call, the other for ELF64 processes to call. This way I get ready for a
64-bit userspace and I don't have to go changing anything. The reason
they need different entry points is that a wide kernel needs to clear
the upper part of the 64-bit registers when called by an ELF32 process.

Pro:

Lower cost to call an LWS! Faster! Atomic operation! No signals while on
the gateway page.

Con:

Written in assembly. Only supported in newer kernels. Old kernels will
crash if you try to call an LWS.

Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.12
diff -u -p -r1.12 syscall.S
--- arch/parisc/kernel/syscall.S	26 Apr 2004 15:57:53 -0000	1.12
+++ arch/parisc/kernel/syscall.S	21 Aug 2004 06:21:09 -0000
@@ -16,6 +16,14 @@
 #include <asm/assembly.h>
 #include <asm/processor.h>
 
+	/* We fill the empty parts of the gateway page with
+ 	 * something that will kill the kernel or a
+ 	 * userspace application.
+	 */
+#define KILL_INSN	break	0,0
+
+#include <linux/config.h> /* for CONFIG_SMP */
+
 #ifdef __LP64__
 	.level          2.0w
 #else
@@ -38,21 +46,41 @@
 	.align 4096
 linux_gateway_page:
 
-	.rept 56
-	break   0,0
+        /* ADDRESS 0x00 to 0xb0 = 176 bytes / 4 bytes per insn = 44 insns */
+	.rept 44
+	KILL_INSN
 	.endr
 
+	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* Light-weight-syscall entry must always be located at 0xb0 */
+	/* WARNING: Keep this number updated with table size changes */
+#define __NR_lws_entries (2)
+
+lws_entry:
+	/* Unconditional branch to lws_start, located on the 
+	   same gateway page */
+	b,n	lws_start
+
+	/* Fill from 0xb4 to 0xe0 */
+	.rept 11
+	KILL_INSN
+	.endr
+
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
-	break   0,0
+	KILL_INSN
 	.endr
 
-/* This address must remain fixed, or user binaries go splat. */
+/* This address must remain fixed at 0x100 for glibc's syscalls to work */
 	.align 256
 linux_gateway_entry:
 	gate	.+8, %r0			/* become privileged */
@@ -177,11 +205,8 @@ linux_gateway_entry:
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
@@ -291,11 +316,8 @@ tracesys_next:	
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
@@ -344,12 +366,295 @@ tracesys_sigexit:
 	ldil	L%syscall_exit_rfi,%r1
 	be,n	R%syscall_exit_rfi(%sr7,%r1)
 
+
+	/*********************************************************
+		Light-weight-syscall code
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
+
+		Error codes returned by entry path:
+
+		ENOSYS - r20 was an invalid LWS number.
+
+	*********************************************************/
+lws_start:
+	/* Gate and ensure we return to userspace */
+	gate	.+8, %r0
+	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
+
+#ifdef __LP64__
+	/* FIXME: If we are a 64-bit kernel just
+	 *        turn this on unconditionally.
+	 */
+	ssm	PSW_SM_W, %r1
+	extrd,u	%r1,PSW_W_BIT,1,%r1
+	/* sp must be aligned on 4, so deposit the W bit setting into
+	 * the bottom of sp temporarily */
+	or,ev	%r1,%r30,%r30
+
+	/* Clip LWS number to a 32-bit value always */
+	depdi	0, 31, 32, %r20
+#endif	
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
+	LDREGX	%r20(%sr2,r28), %r21	/* Scratch use of r21 */
+
+	/* Jump to lws, lws table pointers already relocated */
+	be,n	0(%sr2,%r21)
+
+lws_exit_nosys:
+	ldo	-ENOSYS(%r0),%r21		   /* set errno */
+	/* Fall through: Return to userspace */
+
+lws_exit:
+#ifdef __LP64__
+	/* decide whether to reset the wide mode bit
+	 *
+	 * For a syscall, the W bit is stored in the lowest bit
+	 * of sp.  Extract it and reset W if it is zero */
+	extrd,u,*<>	%r30,63,1,%r1
+	rsm	PSW_SM_W, %r0
+	/* now reset the lowest bit of sp if it was set */
+	xor	%r30,%r1,%r30
+#endif
+	be,n	0(%sr3, %r31)
+
+
+	
+	/***************************************************
+		Implementing CAS as an atomic operation:
+
+		%r26 - Address to examine
+		%r25 - Old value to check (old)
+		%r24 - New value to set (new)
+		%r28 - Return prev through this register.
+		%r21 - Kernel error code
+
+		If debugging is DISabled:
+
+		%r21 has the following meanings:
+
+		EAGAIN - CAS is busy, ldcw failed, try again.
+		EFAULT - Read or write failed.		
+
+		If debugging is enabled:
+
+		EDEADLOCK - CAS called recursively.
+		EAGAIN && r28 == 1 - CAS is busy. Lock contended.
+		EAGAIN && r28 == 2 - CAS is busy. ldcw failed.
+		EFAULT - Read or write failed.
+
+		Scratch: r20, r28, r1
+
+	****************************************************/
+
+	/* Do not enable LWS debugging */
+#define ENABLE_LWS_DEBUG 0 
+
+	/* ELF64 Process entry path */
+lws_compare_and_swap64:
+#ifdef __LP64__
+	b,n	lws_compare_and_swap
+#else
+	/* If we are not a 64-bit kernel, then we don't
+	 * implement having 64-bit input registers
+	 */
+	b,n	lws_exit_nosys
+#endif
+
+	/* ELF32 Process entry path */
+lws_compare_and_swap32:
+#ifdef __LP64__
+	/* Clip all the input registers */
+	depdi	0, 31, 32, %r26
+	depdi	0, 31, 32, %r25
+	depdi	0, 31, 32, %r24
+#endif
+
+lws_compare_and_swap:
+#ifdef CONFIG_SMP
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
+
+# ifdef ENABLE_LWS_DEBUG
+	/*	
+		DEBUG, check for deadlock! 
+		If the thread register values are the same
+		then we were the one that locked it last and
+		this is a recurisve call that will deadlock.
+		We *must* giveup this call and fail.
+	*/
+	ldw	4(%sr2,%r20), %r28			/* Load thread register */
+	mfctl	%cr27, %r21				/* Get current thread register */
+	cmpb,<>,n	%r21, %r28, cas_lock		/* Called recursive? */
+	b	lws_exit				/* Return error! */
+	ldo	-EDEADLOCK(%r0), %r21
+cas_lock:
+	/* FIXME: This check is required! */
+	cmpb,=,n	%r0, %r28, cas_nocontend	/* Is nobody using it? */
+	ldo	1(%r0), %r28				/* 1st case */
+	b	lws_exit				/* Contended... */
+	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+cas_nocontend:
+# endif
+/* ENABLE_LWS_DEBUG */
+
+	ldcw	0(%sr2,%r20), %r28			/* Try to acquire the lock */
+	cmpb,<>,n	%r0, %r28, cas_action		/* Did we get it? */
+cas_wouldblock:
+	ldo	2(%r0), %r28				/* 2nd case */
+	b	lws_exit				/* Contended... */
+	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
+#endif
+/* CONFIG_SMP */
+
+	/*
+		prev = *addr;
+		if ( prev == old )
+		  *addr = new;
+		return prev;
+	*/
+
+	/* NOTES:
+		This all works becuse intr_do_signal
+		and schedule both check the return iasq
+		and see that we are on the kernel page
+		so this process is never scheduled off
+		or is ever sent any signal of any sort,
+		thus it is wholly atomic from usrspaces
+		perspective
+	*/
+cas_action:
+#if defined CONFIG_SMP && defined ENABLE_LWS_DEBUG
+	/* DEBUG */
+	mfctl	%cr27, %r1
+	stw	%r1, 4(%sr2,%r20)
+#endif
+	/* The load and store could fail */
+1:	ldw	0(%sr3,%r26), %r28
+	sub,<>	%r28, %r25, %r0
+2:	stw	%r24, 0(%sr3,%r26)
+#ifdef CONFIG_SMP
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+# ifdef ENABLE_LWS_DEBUG
+	/* Clear thread register indicator */
+	stw	%r0, 4(%sr2,%r20)
+# endif
+#endif
+	/* Return to userspace, set no error */
+	b	lws_exit
+	copy	%r0, %r21
+	nop	/* Add some visual space in objdump */
+	nop
+	nop
+	nop
+3:		
+	/* Error occured on load or store */
+#ifdef CONFIG_SMP
+	/* Free lock */
+	stw	%r20, 0(%sr2,%r20)
+# ifdef ENABLE_LWS_DEBUG
+	stw	%r0, 4(%sr2,%r20)
+# endif
+#endif
+	b	lws_exit
+	ldo	-EFAULT(%r0),%r21	/* set errno */
+	nop
+	nop
+	nop
+	nop
+
+	/* Two exception table entries, one for the load,
+	   the other for the store. Either return -EFAULT */
+	.section __ex_table,"aw"
+#ifdef __LP64__
+	/* Pad the address calculation */
+	.word	0,(2b - linux_gateway_page)
+	.dword	(3b - 2b) 
+#else
+	.word	2b - linux_gateway_page
+	.word	(3b - 2b) 
+#endif
+	.previous
+
+	.section __ex_table,"aw"
+#ifdef __LP64__
+	/* Pad the address calculation */
+	.word	0,(1b - linux_gateway_page)
+	.dword	(3b - 1b) 
+#else
+	.word	1b - linux_gateway_page
+	.word	(3b - 1b) 
+#endif
+	.previous
+
+end_compare_and_swap:
+
+	/* Make sure nothing else is placed on this page */
+	.align 4096
+	.export end_linux_gateway_page
+end_linux_gateway_page:
+
+	/* Relocate symbols assuming linux_gateway_page is mapped
+	   to virtual address 0x0 */
+#ifdef __LP64__
+	/* FIXME: The code will always be on the gateay page
+		  and thus it will be on the first 4k, the
+		  assembler seems to think that the final
+		  subtraction result is only a word in
+		  length, so we pad the value.
+	*/
+#define LWS_ENTRY(_name_) .word 0,(lws_##_name_ - linux_gateway_page)
+#else
+#define LWS_ENTRY(_name_) .word  (lws_##_name_ - linux_gateway_page)
+#endif
+
+	.align 4096
+	/* Light-weight-syscall table */
+	/* Start of lws table. */
+	.export lws_table
+.Llws_table:
+lws_table:
+	LWS_ENTRY(compare_and_swap32)	/* 0 - ELF32 Atomic compare and swap */
+	LWS_ENTRY(compare_and_swap64)	/* 1 - ELF64 Atomic compare and swap */
+	/* End of lws table */
+
 	.align 4096
 	.export sys_call_table
 .Lsys_call_table:
 sys_call_table:
 #include "syscall_table.S"
-.end
+
 #ifdef __LP64__
 	.align 4096
 	.export sys_call_table64
@@ -359,10 +664,29 @@ sys_call_table64:
 #include "syscall_table.S"
 #endif
 
+#ifdef CONFIG_SMP
+	/*
+		All light-weight-syscall atomic operations 
+		will use this set of locks 
+	*/
+	.section .data
+	.align 4096
+	.export lws_lock_start
+.Llws_lock_start:
+lws_lock_start:
+	/* lws locks */
+	.align 16
+	.rept 16
+	/* Keep locks aligned at 16-bytes */
+	.word 1
+	.word 0 
+	.word 0
+	.word 0
+	.endr
+	.previous
+#endif
+/* CONFIG_SMP for lws_lock_start */
 
-	/* Make sure nothing else is placed on this page */
+.end
 
-	.align 4096
-	.export end_linux_gateway_page
-end_linux_gateway_page:
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
