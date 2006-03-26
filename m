From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Fwd: hppa glibc clone() patch proposal (3/3)
Date: Sun, 26 Mar 2006 18:00:06 +0000
Message-ID: <4426D6A6.5050503@tiscali.be>
References: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>	
	<119aab440603241148k755eb8a1m10982b0538fc2cf3@mail.gmail.com>	
	<119aab440603241150p3e15057gc23e355732c1dea@mail.gmail.com>	
	<442467DF.8060309@tiscali.be>	
	<119aab440603241504m5f1f8a97tebe4110185d5ac4c@mail.gmail.com>	
	<4424F7EE.7020002@tiscali.be>
	<119aab440603251126s3a599718n32759d5ed0dcd8c0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440603251126s3a599718n32759d5ed0dcd8c0@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
>>PS: when I will revert this hunk, do you think reasonable that I send the patch to Aurelien to insert it in debian pkg?
> 
> 
> No, post again for review. The whole patch please.
> 
No pb here it is:
--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig2      2006-03-24 09:11:27.000000000 +0000
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S    2006-03-26 10:20:13.000000000 +0000
@@ -45,6 +45,14 @@

          .text
  ENTRY(__clone)
+    /* this proto do: stw rp, -20(sp) */
+       /* FIXME: I have no idea how profiling works on hppa. */
+
+       /* Sanity check arguments.  */
+       comib,=         0, %arg0, .Larg_error   /* no NULL function pointers */
+       ldi             -EINVAL, %ret0
+       comib,=         0, %arg1, .Larg_error   /* no NULL stack pointers */
+       nop

         /* Save the fn ptr and arg on the new stack.  */
         stwm            %arg0, 64(%arg1)
@@ -94,13 +102,35 @@
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

+.Larg_error:
+
+       /* Save arg0: the fn ptr.  */
+       stw             %arg0, -36(%sp)
+       /* Save the PIC register? */
+       stwm            %r3, 64(%sp)
+
+       /* Set errno */
+       copy            %ret0, %r3
+       bl              __syscall_error, %rp
+       sub             %r0, %ret0, %arg0
+
+       /* Restore arg0: the fn ptr.  */
+       ldw             -100(%sp), %arg0
+       /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
+       bv              %r0(%rp)
+       ldwm            -64(%sp), %r3
+
  thread_start:

         /* Load up the arguments.  */
===<>====

clone04 still works fine ;-)

mmm still have many questions (for so few insn):
     1/ what's the role of this mistery r3? (see comment)

     2/ is it the right palce to save 'stw %arg0, -36(%sp)' (I grab it from some other of your src)?

     3/ though, may be finaly better 'stw %arg0, -100(%sp)' after 'stwm %r3, 64(%sp)'?

     3/ can I get rid of save/restore of arg0?


Thanks again for your attention,
     Joel


PS: I still got the same 'Error' as buildd:
   # tail -f glibc-2.3.6-4.2 | grep Err
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
make[3]: *** [/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/tst-tls13.out] Error 1
make[2]: *** [elf/tests] Error 2
make[1]: *** [check] Error 2

So it doesn't seems to introduce regressions?

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
