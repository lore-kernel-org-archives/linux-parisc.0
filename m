From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] Light-Weight-Syscalls on hppa (atomic CAS,
	maybe fast timing stuff later)!
Date: Sat, 31 Jul 2004 18:07:34 -0400
Message-ID: <20040731220734.GC31520@baldric.uwo.ca>
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


pa,

I need some help:

a. Where do I put the locks for the LWS functions?
b. It currently doesn't work. Crashes trying to load the lws table.
c. Haven't tracked down all the issues wrt user virtual address pointing
   to a page that has been swapped out and what happens on a load of
   that address from kernel priority with interrupts disabled.
   Need to work on this bit.
d. Need to fix CAS to return two values, the CAS return and the status
   return if something went wrong.

Here is the code for all eyes to see, maybe someone catches something I
goofed.

---
#include <stdio.h>
#include <stdlib.h>

#define LWS "0xb0"
#define LWS_CAS 0x0

#define LWS_CLOBBER "r26", "r25", "r24", "r23", "r22", "r20"
#define LWS_INPUT "r" (lwsnum), "r" (in0), "r" (in1), "r" (in2), "r" (in3), "r" (in4)

int lws(int lwsnum, int in0, int in1, int in2, int in3, int in4)
{
  register int retval __asm__ ("%r28");
  register int error __asm__ ("%r21");
        
  asm(
       "copy   %1, %%r26\n"
       "copy   %2, %%r25\n"
       "copy   %3, %%r24\n"
       "copy   %4, %%r23\n"
       "copy   %5, %%r22\n"
       "ble    " LWS "(%%sr2, %%r0)\n"
       "copy   %0, %%r20\n"
       : : LWS_INPUT : LWS_CLOBBER
     );

  if (error != 0)
    {
      printf("Error %d\n", error);
    }
  return retval;
}
	
int main(void)
{
  int ret;
  int casval = 12;
  
  printf("casval = %d\n", casval);	
  printf("calling lws %d\n", LWS_CAS);
  /* Address, Old value, New value */
  ret = lws(LWS_CAS, (int)&casval, 12, 34, -1, -1);
  printf("ret = %d, casval = %d\n", ret, casval);
  exit(0);

}
---
Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.12
diff -u -p -r1.12 syscall.S
--- arch/parisc/kernel/syscall.S	26 Apr 2004 15:57:53 -0000	1.12
+++ arch/parisc/kernel/syscall.S	31 Jul 2004 22:03:12 -0000
@@ -16,6 +16,8 @@
 #include <asm/assembly.h>
 #include <asm/processor.h>
 
+#include <linux/config.h> /* for CONFIG_SMP */
+
 #ifdef __LP64__
 	.level          2.0w
 #else
@@ -38,21 +40,79 @@
 	.align 4096
 linux_gateway_page:
 
-	.rept 56
+        /* ADDRESS 0x00 to 0xb0 = 176 bytes / 4 bytes per insn = 44 insns */
+	.rept 44
 	break   0,0
 	.endr
 
+        /* ADDRESS 0xb0 to 0xd8, lws uses 10 insns for entry */
+        /* Light-weight-syscall entry must always be located at 0xb0 
+
+                r20 - lws number
+                r26,r25,r24,r23,r22 - Input registers
+                r28,r21 - Return register
+
+                Scracth: r1, r28, r21
+
+                Return pointer: r31 (Not usable)
+         */
+
+/* WARNING: Keep this number updated with table size changes */
+#define __NR_lws_entries (2)
+#define __lws_size (lws_end_table - lws_table)
+#if defined(__LP64__)
+#  define LWS_ENTRY(_name_) .dword lws_##_name_
+#else
+#  define LWS_ENTRY(_name_) .word lws_##_name_
+#endif
+
+lws_entry:
+        /* Gate and ensure we return to userspace */
+        gate   .+8, %r0
+        depi   3, 31, 2, %r31
+
+        /* Is the lws entry number valid? */
+	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	b,n	.Llws_nosys
+
+        /* Load table start */
+	ldil	L%lws_table, %r1
+	ldo     R%lws_table(%r1), %r28  /* Scratch use of r28 */
+
+#if defined(__LP64__)
+	ldd,s   %r20(%r28), %r20
+#else
+	ldwx,s  %r20(%r28), %r20
+#endif
+        /* Jump to lws */
+	be,n    0(%sr7,%r20)
+        /* WARNING: lws must issue the return to userspace! */
+
+.Llws_nosys:
+        /* Return to userspace */
+        be      0(%sr7, %r31)
+	ldo	-ENOSYS(%r0),%r28		   /* set errno */
+        
+        /* Fill from 0xd8 to 0xe0 */
+        .rept 2
+        break   0,0
+        .endr
+
+        /* This function MUST be located at 0xe0 for glibc's threading 
+           mechanism to work. DO NOT MOVE THIS CODE EVER! */
 set_thread_pointer:
 	gate	.+8, %r0		/* increase privilege */
 	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 	be	0(%sr7,%r31)		/* return to user space */
 	mtctl	%r26, %cr27		/* move arg0 to the control register */
 
+        /* Increase the chance of trapping if random jumps occur to this
+           address, fill from 0xf0 to 0x100 */
 	.rept 4
 	break   0,0
 	.endr
 
-/* This address must remain fixed, or user binaries go splat. */
+/* This address must remain fixed at 0x100 for glibc's syscalls to work */
 	.align 256
 linux_gateway_entry:
 	gate	.+8, %r0			/* become privileged */
@@ -344,6 +404,134 @@ tracesys_sigexit:
 	ldil	L%syscall_exit_rfi,%r1
 	be,n	R%syscall_exit_rfi(%sr7,%r1)
 
+
+        /* Light-weight-syscall table */
+
+
+/* Start of lws table */
+lws_table:
+        LWS_ENTRY(compare_and_swap)     /* 0 - Atomic compare and swap */
+lws_end_table:
+/* End of lws table */
+
+
+lws_compare_and_swap:
+        /*
+                Implementing CAS as an atomic operation:
+
+                %r26 - Address to examine
+                %r25 - Old value to check (old)
+                %r24 - New value to set (new)
+                %r28 - Return prev through this register.
+        
+                Scratch: r20, r28, r1
+        */
+       
+
+        /* Test for permission to read from the address */
+
+        ldo    3(%r0), %r20
+#if defined(__LP64__)
+        probe,r  (%sr0,%r26), %r20, %r28
+#else
+        prober  (%sr0,%r26), %r20, %r28
+#endif
+        cmpb,<>,n %r0, %r28, cas_testwrite
+        be     0(%sr7, %r31)                       /* return to userspace */
+	ldo    -EINVAL(%r0),%r28		   /* set errno */
+
+cas_testwrite:
+
+        /* Test for permission to write to the address */
+
+#if defined(__LP64__)
+        probe,w  (%sr0,%r26), %r20, %r28
+#else
+        probew  (%sr0,%r26), %r20, %r28
+#endif
+        cmpb,<>,n %r0, %r28, cas_continue
+        be     0(%sr7, %r31)                       /* return to userspace */
+	ldo    -EINVAL(%r0),%r28		   /* set errno */
+
+cas_continue:
+
+#ifdef CONFIG_SMP
+        /* Load start of lock table */
+        ldil   L%lock_start, %r20
+        ldo    R%lock_start(%r20), %r28
+
+        /* Extract four bits from r26 and hash lock (Bits 4-7) */
+        extru  %r26, 27, 4, %r20
+
+        /* Find lock to use, the hash is either one of 0 to
+           15, multiplied by 16 (keep it 16-byte aligned)
+           and add to the lock table offset. */
+        shlw   %r20, 4, %r20
+        add    %r20, %r28, %r20
+#endif
+
+cas_lock_loop:
+        rsm   PSW_SM_I, %r0
+
+
+#ifdef CONFIG_SMP
+        ldcw  0(%r20), %r28
+        cmpb,<>,n %r0, %r28, cas_action
+        ssm   PSW_SM_I, %r0
+        ldw   0(%r20), %r28
+cas_read_loop:
+        cmpb,=,n %r0, %r28, cas_read_loop
+        ldw   0(%r20), %r28
+        b     cas_lock_loop
+#endif
+
+        /*
+                prev = *addr;
+                if ( prev == old )
+                        *addr = new;
+                return prev;
+        */
+
+cas_action:
+        ldw   0(%r26), %r28
+        sub,<>   %r28, %r25, %r0
+        stw   %r24, 0(%r26)
+
+#ifdef CONFIG_SMP
+        /* Store ANY non-zero value to the lock */
+        stw   %r20, 0(%r20)
+#endif
+
+end_compare_and_swap:
+        /* Return to userspace */
+        be    0(%sr7, %r31)
+        /* Privelege decrease occurs at the branch target. */
+        ssm   PSW_SM_I, %r0
+
+
+	/* Make sure nothing else is placed on this page */
+
+	.align 4096
+	.export end_linux_gateway_page
+end_linux_gateway_page:
+
+        .align 4096
+lock_start:
+        /*
+                All light-weight-syscall atomic operations 
+                will use this set of locks 
+        */
+
+        /* lws locks */
+        .align 16
+        .rept 16
+        /* Keep locks aligned at 16-bytes */
+        .word 1
+        .word 1
+        .word 1
+        .word 1
+        .endr
+
 	.align 4096
 	.export sys_call_table
 .Lsys_call_table:
@@ -359,10 +547,4 @@ sys_call_table64:
 #include "syscall_table.S"
 #endif
 
-
-	/* Make sure nothing else is placed on this page */
