From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Is this patch enough to fix: tk8.4 +glibc 2.3.5 buid
	with gcc-4.0 SEGV?
Date: Fri,  9 Dec 2005 14:29:29 +0100
Message-ID: <IR8G55$53231A76143F09DD87282E8FDC5BAEE8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
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

Hello Carlos,

> with my atempt to merge glibc-2.3.6 with debian stuff I reach to get ri=
d of
> those "warning: inlining failed" thanks to compile option "-fno-unit-at=
-a-time
> " (as discused a year ago) and the following patch:
> --- sysdeps/hppa/Makefile.Orig  2005-12-06 19:01:00.000000000 +0100
> +++ sysdeps/hppa/Makefile       2005-12-06 19:01:57.000000000 +0100
> @@ -24,6 +24,7 @@
> 
>  ifeq ($(subdir),elf)
>  CFLAGS-rtld.c +=3D -mdisable-fpregs
> +CFLAGS-dl-reloc.c +=3D -fno-unit-at-a-time
>  sysdep-dl-routines +=3D dl-symaddr dl-fptr
>  sysdep_routines +=3D $(sysdep-dl-routines)
>  sysdep-rtld-routines +=3D $(sysdep-dl-routines)
> 
> (unfortunately it seems to fail with 2.3.5 (debian dpkg src, when rebui=
ld with
> gcc-4.0, i.e the same compiler as for 2.3.6), need to check more ...)
> 
> And fwiw it didn't help (wish8.4 still segv ;-( )
> 
> Now compare glibc 2.3.5 + gcc-3.3 with glibc 2.3.6 + gcc-4.0 here are t=
he
> regression test:
>  2.3.6 + gcc-4.0
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
tst-regex.out]
> Error 143
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/posix/=
tst-regex2.out]
> Error 1
> 
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxt=
hreads/tst-cancel4.out]
> Error 1
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxt=
hreads/tst-cancel5.out]
> Error 1
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/linuxt=
hreads/tst-cancel-static.out]
> Error 1
> make[1]: *** [linuxthreads/tests] Error 2
> make[2]: ***
>
[/CAD/parisc-linux/Dpkg/dpkg-work/glibc-2.3.6/build-tree/hppa-libc/elf/ts=
t-pie1.out]
> Error 127
> 
> (I was oblige to kill tst-regex because of an endless nanosleep loop ;-=
( ).
> 
> But I had to get rid of some following debian patch because failing to =
apply:
> #cvs-localedata                # j: upstream now
> #glibc235-gcc4-cvs             # j: in upstream now
> #glibc235-gcc4-elf             # j: ?
> #glibc235-gcc4-jis0208         # j: ?
> #glibc235-binutils216-ia64
> #glibc235-gcc4-ia64-profile
> #glibc235-gcc4-ppc-procfs
> #glibc235-gcc4-arm-inline
> #glibc235-gcc4-sparc-inline
> #hurd-libpthread-indirect-loading
> #glibc235-gcc4-s390-inline
> #glibc235-execvp-fix
> #glibc235-dl-execstack
> #glibc235-localedata-sr_CS
> #glibc235-gcc4-hurd
> #glibc235-alpha-divqu
> #mips-bits-syscall
> 

mmm, I apply this patch (from cvs.p-l.org glibc) against my own acking
glibc-2.3.6 as well as dpkg libc6 2.3.5-8.1:
--- linuxthreads/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h   2005-11-1=
5
11:02:31.000000000 +0100
+++ linuxthreads.new/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h      
2005-06-26 15:48:38.000000000 +0200
@@ -110,14 +111,14 @@
        ldw -24(%sp), %r26                              ASM_LINE_SEP    \=

        CDISABLE                                        ASM_LINE_SEP    \=

        stw %ret0, -24(%sp) /* delay */                 ASM_LINE_SEP    \=

-       /* Restore syscall return (use arg regs) */     ASM_LINE_SEP    \=

-       ldw -24(%sp), %r26                              ASM_LINE_SEP    \=

+       /* Restore syscall return */                    ASM_LINE_SEP    \=

+       ldw -24(%sp), %ret0                             ASM_LINE_SEP    \=

        /* compare error */                             ASM_LINE_SEP    \=

        ldi NO_ERROR,%r1                                ASM_LINE_SEP    \=

        /* branch if no error */                        ASM_LINE_SEP    \=

-       cmpb,>>=3D,n %r1,%r26,L(pre_end)                  ASM_LINE_SEP   =
 \
+       cmpb,>>=3D,n %r1,%ret0,L(pre_end)                 ASM_LINE_SEP   =
 \
        LOAD_PIC(TREG)  /* cond. nullify */             ASM_LINE_SEP    \=

-       copy %r26, TREG /* save syscall return */       ASM_LINE_SEP    \=

+       copy %ret0, TREG /* save syscall return */      ASM_LINE_SEP    \=

        SYSCALL_ERROR_HANDLER                           ASM_LINE_SEP    \=

        /* make syscall res value positive */           ASM_LINE_SEP    \=

        sub %r0, TREG, TREG     /* delay */             ASM_LINE_SEP    \=

=3D=3D=3D=3D<>=3D=3D=3D=3D

and all recompile with debian stock gcc-4.0 and it seems to fix this pb o=
f
tkinfo ;-)

Is it enough?

Thanks,
    Joel

PS: with 2.3.6 I didn't reach to get read of sched_yield() pb with tst-re=
gex
but for sure not with your cvs src. I compare the dump of the 2 libpthrea=
d and
are nearly the same now. Any other idea? (librt?)=0A=0A------------------=
---------------------------------------------=0AA free anti-spam and anti=
-virus filter on all Scarlet mailboxes=0AMore info on http://www.scarlet.=
be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
