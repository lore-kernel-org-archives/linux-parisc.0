Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88E0A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Aug 2001 14:27:10 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f7QKp1X01130
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Aug 2001 16:51:01 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f7QKRsd27250
	for parisc-linux@lists.parisc-linux.org; Sun, 26 Aug 2001 16:27:54 -0400
Date: Sun, 26 Aug 2001 16:27:54 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010826162754.A10072@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Building from scratch.
List-ID: <linux-parisc.vger.kernel.org>

Parisc'ers,

I was recently trying to build the toolchain from scractch on
an x86 box.

I've run into the following stumbling block:

a) glibc configure requires that I use "--enable-hacker-mode"

This really isn't documented, but It's not uncommon and I got around
it very quickly ;)

The second issue was:

b) Some strange asm problem while building glibc.

gcc ../sysdeps/unix/sysv/linux/hppa/sysdep.c -c -O2 -Wall -Winline -Wstrict=
-prototypes -Wwrite-strings -g      -I../include -I. -I/mnt/fatty/palinux/b=
uild/glibc/csu -I.. -I../libio  -I/mnt/fatty/palinux/build/glibc -I../sysde=
ps/hppa/elf -I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthread=
s/sysdeps/unix/sysv/linux -I../linuxthreads/sysdeps/pthread -I../linuxthrea=
ds/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysde=
ps/hppa -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I..=
/sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/u=
nix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../s=
ysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I=
../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/f=
pu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sys=
deps/generic   -D_LIBC_REENTRANT -include ../include/libc-symbols.h     -DH=
AVE_INITFINI -o /mnt/fatty/palinux/build/glibc/csu/sysdep.o
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c: In function `syscall':
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:43: invalid register name `r28' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r21' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r22' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r23' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r24' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r25' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:44: invalid register name `r26' =
for register variable
=2E./sysdeps/unix/sysv/linux/hppa/sysdep.c:45: Can't find a register in cla=
ss `GENERAL_REGS' while reloading `asm'.
make[2]: *** [/mnt/fatty/palinux/build/glibc/csu/sysdep.o] Error 1
make[2]: Leaving directory `/mnt/fatty/palinux/src/glibc/csu'
make[1]: *** [csu/subdir_lib] Error 2
make[1]: Leaving directory `/mnt/fatty/palinux/src/glibc'
make: *** [all] Error 2


Background:

I started by building the tools, as per the instructions on the website.

- Built binutils
- Partially build gcc
- Unpack and configure kernel
- Build glibc...

At which I'm stuck. My hppa bin directory has the following built tools:
(and is on my path)

gccbug                hppa-linux-cpp      hppa-linux-objdump
gcov                  hppa-linux-gasp     hppa-linux-ranlib
hppa-linux-addr2line  hppa-linux-gcc      hppa-linux-readelf
hppa-linux-ar         hppa-linux-ld       hppa-linux-size
hppa-linux-as         hppa-linux-nm       hppa-linux-strings
hppa-linux-c++filt    hppa-linux-objcopy  hppa-linux-strip

The configure for glibc does complain about:

[snip]
checking for hppa-linux-mig... (cached) mig
configure: warning:=20
*** An auxiliary program is missing or too old;
*** some features will be disabled.
*** Check the INSTALL file for required versions.
checking whether ranlib is necessary... (cached) no
[snip]

But continues on. I've met all the requirements in INSTALL, with=20
regards to tools and their versions.

Any clues?

Cheers,
Carlos.
