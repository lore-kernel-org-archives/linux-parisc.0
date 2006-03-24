From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] hppa glibc clone() patch proposal (3/3)
Date: Fri, 24 Mar 2006 11:18:25 +0100
Message-ID: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Kyle McMartin" <kyle@parisc-linux.org>,
 "Parisc List" <parisc-linux@lists.parisc-linux.org>,
 carlos@systemhalted.org,
 "Randolph Chung" <randolph@tausq.org>
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

Hello Mike, pa*,

And this last step is my actual fix proposal:

--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig2      2006-03-2=
4
10:11:27.000000000 +0100
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S    2006-03-24
10:13:12.000000000 +0100
@@ -45,6 +45,13 @@
 
         .text
 ENTRY(__clone)
+       /* this proto SAVE_RP: stw rp, -20(sp) */
+
+       /* Sanity check arguments.  */
+       comib,=3D         0, %arg0, .Larg_error   /* no NULL function poi=
nters */
+       ldi             -EINVAL, %ret0
+       comib,=3D         0, %arg1, .Larg_error   /* no NULL stack pointe=
rs */
+       nop
 
        /* Save the fn ptr and arg on the new stack.  */
        stwm            %arg0, 64(%arg1)
@@ -60,8 +67,8 @@
 
        /* Create frame for function */
        copy            %sp, %r21
+       stw             %r21, 60(%sp)
        stwm            %r3, 64(%sp)
-       stw             %r21, -4(%sp)
 
        /* Save the PIC register. */
 #ifdef PIC
@@ -94,13 +101,35 @@
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
=3D=3D=3D=3D<>=3D=3D=3D=3D

Description:
    1/ first hunk resurect the 'arg sanity check'
    2/ 2d is just of my taste ;-)
    3/ branching change was suggested to me by subsequent code added by C=
.
    4/ I did find yet a elegant way to merge the 2 .Lerror_ hunk

That said that bring me more questions then answer:
    1/ what's the role of this mistery r3? (comment in last hunk)
    2/ can I get rid of save/redtore of arg0?

Thanks for your attention,
    Joel

PS1: clone04 test on a chroot disk works fine:
# ./clone04
clone04     1  PASS  :  expected failure; Got EINVAL

PS2: already build 6 time kernel in a loop with 2.6.16-pa4 64bit on a b2k=


PS3: no regression versus debian stock pkg 2.3.6-4 :-)
 grep Err Glibc-2.6.3-4.builld.debian.org.txt
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/localedata/sort-test.out]=
 Error 1
make[2]: *** [localedata/tests] Error 2
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/math/test-float.out] Erro=
r 1
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/math/test-double.out] Err=
or 1
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/math/test-idouble.out] Er=
ror 1
make[2]: *** [math/tests] Error 2
make[3]: [/build/buildd/glibc-2.3.6/build-tree/hppa-libc/posix/annexc.out=
]
Error 1 (ignored)
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/posix/tst-rxspencer.out] =
Error 139
make[2]: *** [posix/tests] Error 2
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/linuxthreads/tst-attr1.ou=
t]
Error 1
make[2]: *** [linuxthreads/tests] Error 2
make[3]: ***
[/build/buildd/glibc-2.3.6/build-tree/hppa-libc/elf/tst-tls13.out] Error =
1
make[2]: *** [elf/tests] Error 2
make[1]: *** [check] Error 2

My build:
# tail -f glibc-2.3.6-4.1 | grep Err

make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/locale=
data/sort-test.out]
Error 1
make[2]: *** [localedata/tests] Error 2
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-float.out]
Error 1
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-double.out]
Error 1
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/math/t=
est-idouble.out]
Error 1
make[2]: *** [math/tests] Error 2
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
tst-rxspencer.out]
Error 139
make[3]:
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
annexc.out]
Error 1 (ignored)
make[2]: *** [posix/tests] Error 2
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxt=
hreads/tst-attr1.out]
Error 1
make[2]: *** [linuxthreads/tests] Error 2
make[3]: ***
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/ts=
t-tls13.out]
Error 1
make[2]: *** [elf/tests] Error 2
make[1]: *** [check] Error 2
=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
