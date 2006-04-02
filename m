From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Any good rules of pratice about branching insn into
 the delay slot of another one?
Date: Sun, 02 Apr 2006 11:46:53 +0000
Message-ID: <442FB9AD.3000800@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@parisc-linux.org
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

Hello all,

This question about latest test related to some glibc clone().

This patch:
   # diff -Nau clone.S.orig2 clone.S.New4
--- clone.S.orig2       2006-03-24 09:11:27.000000000 +0000
+++ clone.S.New4        2006-03-31 17:42:25.000000000 +0000
@@ -45,7 +45,31 @@

          .text
  ENTRY(__clone)
+    /* this ENTRY() macro do: stw rp, -20(sp)
+       and "FIXME: I have no idea how profiling works on hppa." */

+       /* Sanity check arguments.  */
+       comib,=         0, %arg0, .Larg_error           /* no NULL function pointers */
+       nop
+       comib,<>,n      0, %arg1, .Lno_arg_error        /* no NULL stack pointers */
+       nop
+
+.Larg_error:
+       /* Create a stack frame */
+/*     stwm            %r3, 64(%sp) */
+       ldo             64(%sp), %sp
+       /* Set errno */
+       bl              __syscall_error, %rp
+       ldi             EINVAL, %arg0
+
+       /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
+       bv              %r0(%rp)
+/*     ldwm            -64(%sp), %r3 */
+       ldo             -64(%sp), %sp
+
+.Lno_arg_error:
         /* Save the fn ptr and arg on the new stack.  */
         stwm            %arg0, 64(%arg1)
         stw             %arg3, -60(%arg1)
@@ -75,8 +99,10 @@
         ldi             -4096, %r1
         comclr,>>=      %r1, %ret0, %r0         /* Note: unsigned compare. */
         b,n             .Lerror
+       nop

         comib,=,n       0, %ret0, thread_start
+       nop                                     /* to avoid bv in the delay slot? */

         /* Successful return from the parent
            No need to restore the PIC register,
@@ -94,10 +120,12 @@
  #endif
         /* Set errno */
         copy            %ret0, %r3
-       b               __syscall_error
+       bl              __syscall_error, %rp
         sub             %r0, %ret0, %arg0
         copy            %r3, %ret0
         /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
         bv              %r0(%rp)
         ldwm            -64(%sp), %r3

====<>====

seems to works seems to be ok:
# grep Err glibc-2.3.6-4.3.1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/localedata/sort-test.out] Error 1
make[2]: *** [localedata/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-double.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble.out] Error 1
make[2]: *** [math/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/tst-rxspencer.out] Error 139
make[3]: [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [posix/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxthreads/tst-attr1.out] Error 1
make[2]: *** [linuxthreads/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer.out] Error 137
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-aio4.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer4.out] Error 1
make[2]: *** [rt/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-execstack-needed.out] Error 1
make[2]: *** [elf/tests] Error 2
make[1]: *** [check] Error 2

(well doesn't seems to introduce regression in test)

OTOH if I remove the nop I added in delay slot of 'b,n .Lerror' and 'comib,=,n 0, %ret0, thread_start' i.e. rm hunk:
@@ -75,8 +99,10 @@
         ldi             -4096, %r1
         comclr,>>=      %r1, %ret0, %r0         /* Note: unsigned compare. */
         b,n             .Lerror
+       nop

         comib,=,n       0, %ret0, thread_start
+       nop                                     /* to avoid bv in the delay slot? */

         /* Successful return from the parent
            No need to restore the PIC register,

test became very regressive:
# grep Err glibc-2.3.6-4.3.2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/iconvdata/tst-iconv4.out] Error 1
make[2]: *** [iconvdata/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/localedata/sort-test.out] Error 1
make[2]: *** [localedata/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-double.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble.out] Error 1
make[2]: *** [math/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/stdio-common/tst-rndseek.out] Error 1
make[2]: *** [stdio-common/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/libio/bug-mmap-fflush.out] Error 1
make[2]: *** [libio/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/tst-chmod.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/bug-regex24.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/tst-regex2.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/tst-rxspencer.out] Error 139
make[3]: [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/annexc.out] Error 1 (ignored)
make[2]: *** [posix/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxthreads/tst-attr1.out] Error 1
make[2]: *** [linuxthreads/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-clock.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer.out] Error 139
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-aio4.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-aio5.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-aio6.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer3.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/rt/tst-timer4.out] Error 1
make[2]: *** [rt/tests] Error 2
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-tls13.out] Error 1
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-execstack-prog.out] Error 1
make[2]: *** [elf/tests] Error 2
make[1]: *** [check] Error 2

Thanks in advance for advise,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
