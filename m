Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13205
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 May 2000 12:45:15 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by palrel3.hp.com (Postfix) with ESMTP id 3803C3DA8A
	for <parisc-linux@thepuffingroup.com>; Mon,  1 May 2000 11:41:18 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id D57EA4FD88
	for <parisc-linux@thepuffingroup.com>; Mon,  1 May 2000 14:40:39 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id LAA11187 for parisc-linux@thepuffingroup.com; Mon, 1 May 2000 11:41:00 -0700 (PDT)
Date: Mon, 1 May 2000 11:41:00 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200005011841.LAA11187@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] crti.S Nested procedures error
List-ID: <linux-parisc.vger.kernel.org>

Sammy,

I tried the "glibc" recipe on my x86 box (running Debian potato release).
(http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/04-Apr/0059.html)

"make" died with the following error:

...
hppa1.1-linux-gcc /linux/grundler/glibc/hppa1.1-linux/csu/crti.S -c  -I../include -I. -I/linux/grundler/glibc/hppa1.1-linux/csu -I.. -I../libio  -I/linux/grundler/glibc/hppa1.1-linux -I../sysdeps/hppa/elf -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/include -isystem /opt/puffin/include  -include ../include/libc-symbols.h     -DHAVE_INITFINI -DASSEMBLER  -I/linux/grundler/glibc/hppa1.1-linux/csu/.  -g0  -o /linux/grundler/glibc/hppa1.1-linux/csu/crti.o

bc-symbols.h     -DHAVE_INITFINI -DASSEMBLER  -I/linux/grundler/glibc/hppa1.1-linux/csu/.  -g0  -o /linux/grundler/glibc/hppa1.1-linux/csu/crti.o
/linux/grundler/glibc/hppa1.1-linux/csu/crti.S: Assembler messages:
/linux/grundler/glibc/hppa1.1-linux/csu/crti.S:42: Fatal error: Nested procedures
make[2]: *** [/linux/grundler/glibc/hppa1.1-linux/csu/crti.o] Error 1
make[2]: Leaving directory `/linux/grundler/glibc/csu'
make[1]: *** [csu/subdir_lib] Error 2


Sure enough, two .PROC's have no .PROCEND in between.
glibc/csu/Makefile builds crti.S with:

$(objpfx)crti.S: $(objpfx)initfini.s
        sed -n -e '1,/@HEADER_ENDS/p' \
               -e '/@_.*_PROLOG_BEGINS/,/@_.*_PROLOG_ENDS/p' \
               -e '/@TRAILER_BEGINS/,$$p' $< > $@ 


It seems either the initfini.s contents are wrong or the "sed" hack
above is removing too much.  Which is it?
Or should there only be one .PROC?

We get two .PROC's because initfini.s has both @_init_PROLOG_BEGINS/ENDS
and @_fini_PROLOG_BEGINS/ENDS. 

Appended "diff -u initfini.s crti.S" shows what sed is doing.

thanks,
grant


grundler <576>diff -u initfini.s crti.S
--- initfini.s  Mon May  1 11:09:43 2000
+++ crti.S      Mon May  1 11:20:48 2000
@@ -6,38 +6,6 @@
 #include "defs.h"
 
 /*@HEADER_ENDS*/
-
-/*@TESTS_BEGIN*/
-#NO_APP
-       .text
-       .align 4
-.globl dummy
-       .EXPORT dummy,ENTRY
-       .type    dummy,@function
-dummy:
-dummy:
-       .PROC
-       .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
-       .ENTRY
-       stw %r2,-20(%r30)
-       ldo 64(%r30),%r30
-       stw %r19,-32(%r30)
-       stw %r4,-64(%r30)
-       movb,= %r26,%r22,.L16
-       copy %r19,%r4
-       .CALL   ARGW0=GR
-       bl $$dyncall,%r31
-       copy %r31,%r2
-.L16:
-       ldw -84(%r30),%r2
-       bv %r0(%r2)
-       ldwm -64(%r30),%r4
-       .EXIT
-       .PROCEND
-#APP
-
-/*@TESTS_END*/
-
 /*@_init_PROLOG_BEGINS*/
        .section .init
 #NO_APP
@@ -62,35 +30,6 @@
        END_INIT
 
 /*@_init_PROLOG_ENDS*/
-
-/*@_init_EPILOG_BEGINS*/
-       .section .init
-#NO_APP
-       ldw -84(%r30),%r2
-       bv %r0(%r2)
-       ldwm -64(%r30),%r4
-       .EXIT
-       .PROCEND
-#APP
-       END_INIT
-       .section .text
-#NO_APP
-       .align 4
-       .weak   __gmon_start__
-       .EXPORT __gmon_start__,ENTRY
-       .type    __gmon_start__,@function
-__gmon_start__:
-__gmon_start__:
-       .PROC
-       .CALLINFO FRAME=0,NO_CALLS
-       .ENTRY
-       bv,n %r0(%r2)
-       .EXIT
-       .PROCEND
-#APP
-
-/*@_init_EPILOG_ENDS*/
-
 /*@_fini_PROLOG_BEGINS*/
        .section .fini
 #NO_APP
@@ -113,24 +52,5 @@
        END_FINI
 
 /*@_fini_PROLOG_ENDS*/
-#NO_APP
-       .CALL 
-       bl i_am_not_a_leaf,%r2
-       nop
-#APP
-
-/*@_fini_EPILOG_BEGINS*/
-       .section .fini
-#NO_APP
-       ldw -84(%r30),%r2
-       bv %r0(%r2)
-       ldwm -64(%r30),%r4
-       .EXIT
-       .PROCEND
-#APP
-       END_FINI
-
-/*@_fini_EPILOG_ENDS*/
-
 /*@TRAILER_BEGINS*/
        .ident  "GCC: (GNU) 2.9-hppa-991112"
