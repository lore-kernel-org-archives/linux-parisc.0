Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA13394
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 17:06:01 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by palrel1.hp.com (Postfix) with ESMTP id 140EE1850
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 16:05:51 -0700 (PDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 75E33500B4
	for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 18:04:52 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id QAA20393 for <parisc-linux@thepuffingroup.com>; Fri, 14 Apr 2000 16:04:58 -0700 (PDT)
Message-Id: <200004142304.QAA20393@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cross compiling glibc 
In-reply-to: Your message of "Fri, 14 Apr 2000 15:32:21 PDT."
             <200004142232.PAA20329@milano.cup.hp.com>
Date: Fri, 14 Apr 2000 16:04:58 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:

> Since my NFS root isn't on my build machine, I used
>     make install install_root=/linux/root MAKEINFO=

and since I sent the mail *before* the make install completed...
It died with:

make[2]: Entering directory `/linux/grundler/glibc/setjmp'
hppa1.1-linux-gcc ../sysdeps/hppa/setjmp.S -c  -I../include -I. -I/linux/grundler/glibc/hppa1.1-linux/setjmp -I.. -I../libio  -I/linux/grundler/glibc/hppa1.1-linux -I../sysdeps/hppa/elf -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/include -isystem /opt/puffin/include  -include ../include/libc-symbols.h     -DASSEMBLER   -o /linux/grundler/glibc/hppa1.1-linux/setjmp/setjmp.o
../sysdeps/hppa/setjmp.S: Assembler messages:
../sysdeps/hppa/setjmp.S:102: Error: Missing .callinfo for this procedure
make[2]: *** [/linux/grundler/glibc/hppa1.1-linux/setjmp/setjmp.o] Error 1
make[2]: Leaving directory `/linux/grundler/glibc/setjmp'
make[1]: *** [setjmp/subdir_lib] Error 2
make[1]: Leaving directory `/linux/grundler/glibc'
make: *** [install] Error 2


Using the wrong assembler? (or something else stupid like that?)

grant
