From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] hppa light-weight-syscall CAS working! or "The
	meaning of probew"
Date: Thu, 5 Aug 2004 02:20:00 -0400
Message-ID: <20040805062000.GA24775@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: LaMont Jones <lamont@debian.org>
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

Success. LWS CAS is working, but don't do anything naughty or it
crashes. I'm trying to determine why I get an HPMC when I probew an
address that probably has no mapping? It should be nullifying the insn
in question and returning zero?

Here is an updated working patch for light-weight-syscalls. The todo
list includes:

Things I still have to fix:
- User passes in a bogus address.
        = Unaligned? No mapping exists?
        = probew crashes the kernel in the latter (HPMC).
- User can read to address, but not write.
        = probew crashes the kernel.
- Take a tlb miss during the main CAS operation.
        = Need to add the load to the exceptions list
        = and work out a method where I can wait for the
        = page to migrate back from swap->memory->cache
        = and then try again. In the mean time I can't take
        = a signal or be scheduled off that CPU. I plan to do
        = the later by making sure that the return path back
        = from the scheduler double checks the return priority
        = and if it's not user priority it shouldn't be sending
        = pending signals.
- SMP locking is untested.
- Add more test cases to userspace tester.
                                                                                                 
Things to optimize:
- Remove some jumps
- Don't shuffle around the space registers so much.
- Ask smarter people to optimize the insn sequences.

I'm timing the lws calls and on a 712/100 it's pipelined and read from
the cache, so cr16 doesn't even register a single click for the lws :)

Any input would be much appreciated! Lamont you've always been a great
source of insightful information when it comes to low level coding!

Cheers,
Carlos.

Index: arch/parisc/kernel/syscall.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/syscall.S,v
retrieving revision 1.12
diff -u -p -r1.12 syscall.S
--- arch/parisc/kernel/syscall.S	26 Apr 2004 15:57:53 -0000	1.12
+++ arch/parisc/kernel/syscall.S	5 Aug 2004 06:00:21 -0000
@@ -16,6 +16,8 @@
 #include <asm/assembly.h>
 #include <asm/processor.h>
 
+#include <linux/config.h> /* for CONFIG_SMP */
+
 #ifdef __LP64__
 	.level          2.0w
 #else
@@ -38,21 +40,56 @@
 	.align 4096
 linux_gateway_page:
 
-	.rept 56
+        /* ADDRESS 0x00 to 0xb0 = 176 bytes / 4 bytes per insn = 44 insns */
+	.rept 44
 	break   0,0
 	.endr
 
+        /* ADDRESS 0xb0 to 0xd8, lws uses 2 insns for entry */
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
+        b lws_start
+        nop
+
+        /* Fill from 0xb8 to 0xe0 */
+        .rept 10
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
@@ -344,6 +381,175 @@ tracesys_sigexit:
 	ldil	L%syscall_exit_rfi,%r1
 	be,n	R%syscall_exit_rfi(%sr7,%r1)
 
+
+        /* Light-weight-syscall code */
+
+lws_start:
+        /* Gate and ensure we return to userspace */
+        gate   .+8, %r0
+        depi   3, 31, 2, %r31
+
+        /* Is the lws entry number valid? */
+	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	b,n	lws_exit_nosys
+
+	mtsp	%r0,%sr4			/* get kernel space into sr4 */
+	mtsp	%r0,%sr5			/* get kernel space into sr5 */
+	mtsp	%r0,%sr6			/* get kernel space into sr6 */
+	mfsp    %sr7,%r1                        /* save user sr7 */
+	mtsp    %r1,%sr3                        /* and store it in sr3 */
+	mtsp	%r0,%sr7			/* get kernel space into sr7 */
+
+        /* Load table start */
+	ldil	L%lws_table, %r1
+	ldo     R%lws_table(%r1), %r28  /* Scratch use of r28 */
+#if defined(__LP64__)
+	ldd,s   %r20(%r28), %r20
+#else
+	ldwx,s  %r20(%r28), %r20
+#endif
+
+
+        /* Jump to lws */
+	be,n    0(%sr7,%r20)
+        /* WARNING: lws must issue the return to userspace! */
+
+lws_exit:
+        mfsp    %sr3,%r1                        /* get user space id */
+        mtsp    %r1,%sr4                        /* get user space into sr4 */
+        mtsp    %r1,%sr5                        /* get user space into sr5 */
+        mtsp    %r1,%sr6                        /* get user space into sr6 */
+        mtsp    %r1,%sr7                        /* get user space into sr7 */
+        be,n      0(%sr7, %r31)
+
+lws_exit_nosys:
+        /* Return to userspace */
+        be      0(%sr7, %r31)
+	ldo	-ENOSYS(%r0),%r21		   /* set errno */
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
+#ifdef __LP64__
+	ldd,s   0(%sr3,%r26), %r20
+#else
+	ldwx,s  0(%sr3,%r26), %r20
+#endif
+        
+cas_testwrite:
+
+        /* Test for permission to write to the address */
+#if defined(__LP64__)
+        probe,w  (%sr3,%r26), %r20, %r28
+#else
+        probew  (%sr3,%r26), %r20, %r28
+#endif
+        cmpb,<>,n %r0, %r28, cas_continue
+	ldo    -EINVAL(%r0),%r21
+        b,n    lws_exit
+
+cas_continue:
+
+#ifdef CONFIG_SMP
+        /* Load start of lock table */
+        ldil   L%lws_lock_start, %r20
+        ldo    R%lws_lock_start(%r20), %r28
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
+        ldw   0(%sr3,%r26), %r28
+        sub,<>   %r28, %r25, %r0
+        stw   %r24, 0(%sr3,%r26)
+
+#ifdef CONFIG_SMP
+        /* Store ANY non-zero value to the lock */
+        stw   %r20, 0(%r20)
+#endif
+
+        /* No errors */
+        copy  %r0, %r21
+
+end_compare_and_swap:
+        /* Return to userspace */
+        b     lws_exit
+        ssm   PSW_SM_I, %r0
+
+
+	/* Make sure nothing else is placed on this page */
+
+	.align 4096
+	.export end_linux_gateway_page
+end_linux_gateway_page:
+
+        /*
+                All light-weight-syscall atomic operations 
+                will use this set of locks 
+        */
+        .align 4096
+        .export lws_lock_start
+.Llws_lock_start:
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
+        .align 4096
+        /* Light-weight-syscall table */
+        /* Start of lws table. */
+        /* FIXME: global symbol */
+lws_table:
+        LWS_ENTRY(compare_and_swap)     /* 0 - Atomic compare and swap */
+lws_end_table:
+        /* End of lws table */
+
 	.align 4096
 	.export sys_call_table
 .Lsys_call_table:
@@ -359,10 +565,4 @@ sys_call_table64:
 #include "syscall_table.S"
 #endif
 
-
-	/* Make sure nothing else is placed on this page */
-
-	.align 4096
-	.export end_linux_gateway_page
-end_linux_gateway_page:
 
-----8<----- Userspace test-lws -----8<-----
#include <stdio.h>
#include <stdlib.h>

#define LWS "0xb0"
#define LWS_CAS 0x0

#define LWS_CLOBBER "r26", "r25", "r24", "r23", "r22", "r20"
#define LWS_INPUT "r" (lwsnum), "r" (in0), "r" (in1), "r" (in2), "r" (in3), "r" (in4)
#define LWS_OUTPUT "=m" (retval), "=m" (error)

int lws_errno;

int lws(int lwsnum, int in0, int in1, int in2, int in3, int in4)
{
  int retval;
  int error;

  asm(
       "copy   %3, %%r26\n"
       "copy   %4, %%r25\n"
       "copy   %5, %%r24\n"
       "copy   %6, %%r23\n"
       "copy   %7, %%r22\n"
       "ble    " LWS "(%%sr2, %%r0)\n"
       "copy   %2, %%r20\n"
       "stw   %%r28, %0\n"
       "stw   %%r21, %1\n"
       : LWS_OUTPUT : LWS_INPUT : LWS_CLOBBER
     );

  if (error != 0)
    {
      printf("lws syscall error %d\n", error);
      lws_errno = error;
    }
  return retval;
}
	
#define CAS_OLD 12
#define CAS_NEW 34
#define LWS_BAD 666

int main(void)
{
  int ret;
  int casval = CAS_OLD;
  unsigned int t1,t2;
  
  printf("Testing lws CAS (syscall #%d)\n", LWS_CAS);
  
  /***** Test *****/
  /* cas(addr, old, new)
     {
       prev = *addr;
       if ( prev == old )
         *addr = new;
       return prev;
     } */
  lws_errno = 0;
  asm ("mfctl %%cr16,%0\n" : "=r" (t1) :);
  ret = lws(LWS_CAS, (int)&casval, CAS_OLD, CAS_NEW, -1, -1);
  asm ("mfctl %%cr16,%0\n" : "=r" (t2) :);
  if ((casval == CAS_NEW) && (lws_errno == 0))
    {
      printf("PASSED: CAS worked correctly.\n");
    }
  else
    {
      printf("FAILED: CAS did not work.\n");
    }
  printf("Time: %u %u (Diff %u)\n",t1,t2,t2-t1);
  
  /***** Test *****/
  lws_errno = 0;
  printf("Testing lws with invalid number (syscall #%d)\n", LWS_BAD);
  asm ("mfctl %%cr16,%0\n" : "=r" (t1) :);
  ret = lws(LWS_BAD, 0, 0, 0, 0, 0);
  asm ("mfctl %%cr16,%0\n" : "=r" (t2) :);
  if (lws_errno != 0)
    {
      printf("PASSED: lws returned error on invalid syscall number.\n");
    }
  else
    {
      printf("FAILED: lws didn't error on invalid syscall number!\n");
    }
  printf("Time: %u %u (Diff %u)\n",t1,t2,t2-t1);
  
  /***** Test *****/
  lws_errno = 0;
  printf("Testing lws CAS with NULL address (syscall #%d)\n", LWS_CAS);
  /* Pass a bogus address and see what happens? */
  asm ("mfctl %%cr16,%0\n" : "=r" (t1) :);
  ret = lws(LWS_CAS, 0, 0, 0, 0, 0);
  asm ("mfctl %%cr16,%0\n" : "=r" (t2) :);
  if (lws_errno != 0)
    {
      printf("PASSED: lws CAS returned error on invalid address.\n");
    }
  else
    {
      printf("FAILED: lws CAS operated on an invalid address!\n");
    }
  printf("Time: %u %u (Diff %u)\n",t1,t2,t2-t1);
  
  exit(0);

}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
