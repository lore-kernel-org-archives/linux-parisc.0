Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA22647
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 06:21:14 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 17 Jan 2001 13:24:47 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 16C51B005; Wed, 17 Jan 2001 13:15:41 +0000 (GMT)
Date: Wed, 17 Jan 2001 13:15:41 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010117131541.L28638@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc build failing
List-ID: <linux-parisc.vger.kernel.org>

Guess this is for Alan and Matt really...

I am trying to build glibc using todays cvs main branch.  Building on
x86 for parisc.  This is what I do:

  TOP=/mnt/parisc/xc
  MACH=i386-linux
  DEST=$TOP/parisc
  PATH=$TOP/parisc/bin:/bin:/usr/bin
  cd $TOP
  rm -rf parisc
  mkdir parisc
  cd $TOP
  rm -rf build 
  mkdir build
  cd $TOP/build && rm -rf binutils && mkdir binutils && cd binutils
  $TOP/source/binutils/configure --host=$MACH --prefix=$DEST \
          --target=hppa-linux --enable-targets=hppa64-linux \
          --disable-nls
  make
  make install
  cd $TOP/build && rm -rf gcc && mkdir gcc && cd gcc
  $TOP/source/gcc/configure --host=$MACH --prefix=$DEST \
          --target=hppa-linux --enable-shared \
          --disable-nls
  rm -r zlib hppa-linux
  make LANGUAGES=c
  make LANGUAGES=c install
  cd $TOP/source/linux
  make oldconfig
  make dep
  cd $TOP/build && rm -rf glibc && mkdir glibc && cd glibc
  $TOP/source/glibc/configure --host=hppa-linux --build=$MACH \
          --prefix=$DEST/hppa-linux --with-headers=$TOP/source/linux/include \
          --disable-profile --without-cvs --enable-add-ons
  make


And this is what happens...

make[2]: Entering directory `/mnt/parisc/xc/source/glibc/grp'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/parisc/xc/source/glibc/grp'
make  -C pwd subdir_lib
make[2]: Entering directory `/mnt/parisc/xc/source/glibc/pwd'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/parisc/xc/source/glibc/pwd'
make  -C posix subdir_lib
make[2]: Entering directory `/mnt/parisc/xc/source/glibc/posix'
hppa-linux-gcc ../sysdeps/generic/glob.c -c -O2 -Wall -Winline -Wstrict-prototypes -Wwrite-strings -g      -I../include -I. -I/mnt/parisc/xc/build
/glibc/posix -I.. -I../libio  -I/mnt/parisc/xc/build/glibc -I../sysdeps/hppa/elf -I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxthreads/sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /mnt/parisc/xc/parisc/lib/gcc-lib/hppa-linux/2.96/include -isystem /mnt/parisc/xc/source/linux/include -D_LIBC_REENTRANT -include ../include/libc-symbols.h     -o /mnt/parisc/xc/build/glibc/posix/glob.o
../sysdeps/generic/glob.c: In function `glob_in_dir':
../sysdeps/generic/glob.c:1446: Internal compiler error in eliminate_regs, at reload1.c:2505
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [/mnt/parisc/xc/build/glibc/posix/glob.o] Error 1
make[2]: Leaving directory `/mnt/parisc/xc/source/glibc/posix'
make[1]: *** [posix/subdir_lib] Error 2
make[1]: Leaving directory `/mnt/parisc/xc/source/glibc'
make: *** [install] Error 2



The change that seems to have triggered this is in glibc/Makeconfig, 
to build with -O2 rather that -O

Richard
