Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5017482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 22:39:12 -0600 (MDT)
Date: Tue, 28 Aug 2001 00:39:52 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828003952.M28978@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010827203849.H525@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Aug 27, 2001 at 08:38:49PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> Where did you get glibc from?  The only place with current patches is the
> Debian package.  Our CVS is terribly out of date.
> 
> -- 
> Revolutions do not require corporate support.
> 
>

wget ftp://ftp.debian.org/debian/pool/main/g/glibc/glibc_2.2.4.orig.tar.gz

And applied glibc_2.2.4-1.diff from same directory.

---
make[2]: Leaving directory `/mnt/fatty/palinux/src/glibc/csu'
make[2]: Entering directory `/mnt/fatty/palinux/src/glibc/csu'
gcc ../sysdeps/unix/sysv/linux/hppa/sysdep.c -c -O2 -Wall -Winline -Wstrict-pro
totypes -Wwrite-strings -g      -I../include -I. -I/mnt/fatty/palinux/build/gli
bc/csu -I.. -I../libio  -I/mnt/fatty/palinux/build/glibc -I../sysdeps/hppa/elf 
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/s
ysv/linux -I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthre
ads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/
hppa -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdep
s/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I
../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hpp
a1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/
dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I
../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic   -D_LIBC_REEN
TRANT -include ../include/libc-symbols.h     -DHAVE_INITFINI -o /mnt/fatty/pali
nux/build/glibc/csu/sysdep.o
../sysdeps/unix/sysv/linux/hppa/sysdep.c: In function `syscall':
../sysdeps/unix/sysv/linux/hppa/sysdep.c:45: invalid register name `r28' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r21' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r22' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r23' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r24' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r25' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:46: invalid register name `r26' for re
gister variable
../sysdeps/unix/sysv/linux/hppa/sysdep.c:47: Can't find a register in class `GE
NERAL_REGS' while reloading `asm'.
make[2]: *** [/mnt/fatty/palinux/build/glibc/csu/sysdep.o] Error 1
make[2]: Leaving directory `/mnt/fatty/palinux/src/glibc/csu'
make[1]: *** [csu/subdir_lib] Error 2
make[1]: Leaving directory `/mnt/fatty/palinux/src/glibc'
make: *** [all] Error 2
---

[carlos@systemhalted hppa]$ ls -alt sysdep.c 
-rw-rw-r--    1 carlos   carlos       1794 Jul 23 13:57 sysdep.c
[carlos@systemhalted hppa]$ 

Any thoughts or helpfull comments? :)
How do you developers do it?

Cheers,
Carlos.
