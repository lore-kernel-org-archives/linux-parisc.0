Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 10BFF4A18
	for <parisc-linux@parisc-linux.org>; Fri,  2 Feb 2001 04:16:10 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Date: Fri, 2 Feb 2001 12:17:38 +0100
MIME-Version: 1.0
Message-Id: <01020212173801.05589@P100.helgenet.de>
Subject: [parisc-linux] Problems building glibc
List-ID: <linux-parisc.vger.kernel.org>

Hi,

building with palinux-autobuilder from todays CVS head I get following 
problem on 32bit parisc

Greetings,
Helge

....
### Making kernel dependencies ###
## Building kernel dependencies ##
......
### Building glibc ###
## Cleaning glibc build dir ##
Running "cd /home/cvs/parisc/xc-build/ && rm -rf glibc; mkdir 
/home/cvs/parisc/xc-build/glibc"
## Configuring glibc ##
Running "cd /home/cvs/parisc/xc-build/glibc; export 
PATH=/home/cvs/parisc/xc/bin:$PATH; /home/cvs/parisc/glibc/configure 
--target=hppa-linux --host=hppa-linux --build=i386-linux  
--prefix=/opt/puffin/hppa-linux --without-cvs --disable-shared 
--disable-profile --enable-static-nss --enable-add-ons
--with-headers=/home/cvs/parisc/linux/include"

............later:

hppa-linux-gcc ../sysdeps/generic/glob.c -c -O2 -Wall -Winline 
-Wstrict-prototypes -Wwrite-strings
-g      -I../include -I. -I/home/cvs/parisc/xc-build/glibc/posix -I.. 
-I../libio  -I/home/cvs/parisc/xc-build/glibc -I../sysdeps/hppa/elf 
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa 
-I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxthreads/sysdeps/pthread 
-I../linuxthreads/sysdeps/unix/sysv
-I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa 
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux 
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman 
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix 
-I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 
-I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa 
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc 
-isystem /home/cvs/parisc/xc/lib/gcc-lib/hppa-linux/2.96/include -isystem 
/home/cvs/parisc/linux/include -D_LIBC_REENTRANT -include 
../include/libc-symbols.h     -o
/home/cvs/parisc/xc-build/glibc/posix/glob.o
../sysdeps/generic/glob.c: In function `glob_in_dir':
../sysdeps/generic/glob.c:1446: Internal compiler error in eliminate_regs, at 
reload1.c:2505
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [/home/cvs/parisc/xc-build/glibc/posix/glob.o] Fehler 1
make[1]: *** [posix/subdir_lib] Fehler 2
make: *** [all] Fehler 2
