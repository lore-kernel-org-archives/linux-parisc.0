Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA24872
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Aug 2000 05:25:00 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3990EB35.D33C40BF@uswest.net>
Date: Tue, 08 Aug 2000 23:25:09 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Tara Dear <tdear@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] recipe
References: <39864BF4.4FD098D0@linuxcare.com>
Content-Type: multipart/mixed;
 boundary="------------BFFCCEE5BF5198CF09372007"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------BFFCCEE5BF5198CF09372007
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tara,

I have a small patch to the recipe that will fix problems with a new install.

Sorry it has taken so long to get back, but it took me a while to figure out
how to fix them so I could post a patch :)

Unfortunately, the current glibc cvs source will not build for me so I have
not finished testing the recipe.  I will take a look at the remaining errors
tomorrow evening, unless someone else manages to fix them before then :)

Thanks for the recipe!

- Ryan


P.S.  Here are the glibc errors.

hppa-linux-gcc ../sysdeps/unix/sysv/linux/sigaction.c -c -O -Wall -Winline
-Wstrict-prototypes -Wwrite-strings -g      -I../include -I.
-I/usr/src/parisc/glibc-build/signal -I.. -I../libio
-I/usr/src/parisc/glibc-build -I../sysdeps/hppa/elf
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix
-I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32
-I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc
-isystem /opt/puffin/lib/gcc-lib/hppa-linux/2.96/include -isystem
/usr/src/parisc/glibc-build/../linux-2.3/include  -include
../include/libc-symbols.h     -o
/usr/src/parisc/glibc-build/signal/sigaction.o
../sysdeps/unix/sysv/linux/sigaction.c: In function `__sigaction':
../sysdeps/unix/sysv/linux/sigaction.c:77: structure has no member named
`sa_restorer'
../sysdeps/unix/sysv/linux/sigaction.c:83: warning: initialization makes
integer from pointer without a cast
../sysdeps/unix/sysv/linux/sigaction.c:83: warning: initialization makes
integer from pointer without a cast
../sysdeps/unix/sysv/linux/sigaction.c:96: structure has no member named
`sa_restorer'
../sysdeps/unix/sysv/linux/sigaction.c:116: structure has no member named
`sa_restorer'
../sysdeps/unix/sysv/linux/sigaction.c:119: warning: initialization makes
integer from pointer without a cast
../sysdeps/unix/sysv/linux/sigaction.c:119: warning: initialization makes
integer from pointer without a cast
../sysdeps/unix/sysv/linux/sigaction.c:127: structure has no member named
`sa_restorer'
make[2]: *** [/usr/src/parisc/glibc-build/signal/sigaction.o] Error 1
make[2]: Leaving directory `/usr/src/parisc/glibc/signal'
make[1]: *** [signal/subdir_lib] Error 2
make[1]: Leaving directory `/usr/src/parisc/glibc'
make: *** [all] Error 2


--------------BFFCCEE5BF5198CF09372007
Content-Type: text/plain; charset=us-ascii;
 name="patch.recipe"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.recipe"

*** recipe.sh.orig	Tue Aug  8 23:06:46 2000
--- recipe.sh	Tue Aug  8 23:04:27 2000
***************
*** 1,7 ****
  #!/bin/sh -e
  
! PREFIX=/home/tdear/parisc
  HOST=i386-linux
  
  export CVS_RSH=ssh
  echo Checking for CVS directories
--- 1,8 ----
  #!/bin/sh -e
  
! PREFIX=/opt/puffin
  HOST=i386-linux
+ PATH=/usr/local/bin:/usr/bin:/bin
  
  export CVS_RSH=ssh
  echo Checking for CVS directories
***************
*** 43,48 ****
--- 44,56 ----
  echo Updating linux-2.3
  (cd linux-2.3 && cvs update -dP)
  echo Updating header files in $PREFIX/hppa-linux/include/{linux,asm}
+ 
+ # We need to build include/linux/version.h for glibc
+ (cd linux-2.3 && gmake `pwd`/include/linux/version.h)
+ 
+ # We also need a symbolic link for asm
+ (cd linux-2.3/include && ln -s asm-parisc asm)
+ 
  rm -rf $PREFIX/hppa-linux/include/{linux,asm}
  cp -a linux-2.3/include/linux $PREFIX/hppa-linux/include
  cp -a linux-2.3/include/asm-parisc $PREFIX/hppa-linux/include/asm

--------------BFFCCEE5BF5198CF09372007--
