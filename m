Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20968
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 11:56:08 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 203806089
	for <parisc-linux@thepuffingroup.com>; Mon, 18 Dec 2000 13:59:03 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id AC11337CA1
	for <parisc-linux@thepuffingroup.com>; Mon, 18 Dec 2000 12:00:57 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Dec 2000 12:00:57 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001218190057.AC11337CA1@carmen.fc.hp.com>
Subject: [parisc-linux] glibc build failing and weird gcc configure error, post gcc merge
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Alan Modra just merged gcc with 20001211 upstream and checked in the result on 
a "devel" branch. I tried building a cross-toolchain but the glibc build fails 
with the following error,

-----------------------------------------------------------------------------
hppa-linux-gcc getnameinfo.c -c -O -Wall -Winline -Wstrict-prototypes 
-Wwrite-strings -g      -I../include -I. -I/home/al-76/puffin/xc-build/glibc/in
et -I.. -I../libio  -I/home/al-76/puffin/xc-build/glibc -I../sysdeps/hppa/elf 
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/s
ysv/linux -I../linuxthreads/sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv
 -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa 
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux 
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman 
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix 
-I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 
-I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa 
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc 
-isystem /home/al-76/puffin/xc/lib/gcc-lib/hppa-linux/2.97/include -isystem 
/home/al-76/puffin/palinux/linux/include -D_LIBC_REENTRANT -include 
../include/libc-symbols.h     -o /home/al-76/puffin/xc-build/glibc/inet/getname
info.o
getnameinfo.c: In function `nrl_domainname':
getnameinfo.c:164: Internal compiler error in eliminate_regs, at reload1.c:2521
Please submit a full bug report.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [/home/al-76/puffin/xc-build/glibc/inet/getnameinfo.o] Error 1
make[2]: Leaving directory `/home/al-76/puffin/palinux/glibc/inet'
make[1]: *** [inet/subdir_lib] Error 2
make: *** [all] Error 2
-----------------------------------------------------------------------------

I also noticed that during the configure for the simple gcc I use to 
cross-build glibc I get,

-----------------------------------------------------------------------------
$ configure --target=hppa-linux --host=i386-linux --build=i386-linux 
--prefix=/home/al-76/puffin/xc --disable-shared --disable-nls 
--with-headers=/home/al-76/puffin/palinux/include --without-libc 
--enable-languages=c --disable-sanity-checks"
*** This configuration is not supported in the following subdirectories:
     target-libffi target-boehm-gc target-zlib target-libjava
    (Any other directories should still work fine.)
-----------------------------------------------------------------------------

I haven't ever seen that before. Any ideas?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
