Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 200784829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 10:12:47 -0700 (MST)
Date: Mon, 11 Nov 2002 12:12:55 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111171255.GI8848@systemhalted>
References: <20021111010517.GA13575@systemhalted> <200211110119.gAB1JaSr004665@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211110119.gAB1JaSr004665@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > Lastly, I think that the fp* tests suffer from the printf bug?
> 
> I am fairly certain that this is fixed in gcc 3.2/3.3.  Could you
> do a build with the mainline gcc cvs?  I am interested in feedback.
> as I am trying to squash as many bugs as possible in 3.3 while it's
> still open for general bug fixing.
> 

carlos@firin:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3$ hppa-linux-gcc-3.3 -v
Reading specs from /mnt/flaire/palinux/bin/../lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../gcc/configure --target=hppa-linux --build=hppa-linux --host=hppa-linux
--prefix=/mnt/flaire/palinux/ --enable-languages=c
Thread model: posix
gcc version 3.3 20021110 (experimental)

carlos@firin:/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3$ ld -v
GNU ld version 2.13.90.0.10 20021010 Debian GNU/Linux

Latest CVS of glibc.2.3.1 with HPPA patches applied.

make[2]: Entering directory `/mnt/flaire/src/glibc-upstream-cvs/libc/glibc-2.3.1/linuxthreads'
hppa-linux-gcc-3.3 ../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c -c -std=gnu99 -O2
-Wall -Winline -Wstrict-prototypes -Wwrite-strings -g    -g0 -fPIC -fno-inline-functions
-I../include -I. -I/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/linuxthreads -I.. -I../libio
-I/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3 -I../sysdeps/hppa/elf
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv
-I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/sysv/linux/hppa
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix
-I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -I
/lib/modules/2.4.19-pa22/build/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h       -S
-g0 -fPIC -fno-inline-functions -finhibit-size-directive \
        -fno-exceptions -o
/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/linuxthreads/pt-initfini.s
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:44:10: missing terminating " character
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:46:10: #include expects "FILENAME" or
<FILENAME>../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:51: error: request for member
`section' in something not a structure or union
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:52: error: parse error before numeric
constant
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:54: error: syntax error at '@' token
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:75: error: stray '\' in program
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:75:34: missing terminating " character
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:86: error: syntax error at '@' token
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:102: error: stray '\' in program
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:102:34: missing terminating " character
../linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c:110:1: missing terminating " character
make[2]: *** [/mnt/flaire/src/glibc-upstream-cvs/libc-build-3.3/linuxthreads/pt-initfini.s] Error 1
make[2]: Leaving directory `/mnt/flaire/src/glibc-upstream-cvs/libc/glibc-2.3.1/linuxthreads'
make[1]: *** [linuxthreads/others] Error 2
make[1]: Leaving directory `/mnt/flaire/src/glibc-upstream-cvs/libc/glibc-2.3.1'
make: *** [all] Error 2

Looks like we need some __asm format fixes?

c.
