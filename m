Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35C484A1C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 00:08:29 -0700 (MST)
Received: from esiee.net (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 82C54D1585
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 08:08:27 +0100 (CET)
Message-ID: <3A8245E2.56628B1@esiee.net>
Date: Thu, 08 Feb 2001 08:08:18 +0100
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems building glibc
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I tried to build a new toolchain, without success:

CVS was checked out a few minutes after Alan Modra commited tc-hppa.c
now the palinux-autobuilder ends builbing glibc:

hppa-linux-gcc ../sysdeps/generic/glob.c -c -O2 -Wall -Winline
-Wstrict-prototypes -Wwrite-strings -g      -I../include -I.
-I/home/mklxav/xc-build/glibc/posix -I.. -I../libio
-I/home/mklxav/xc-build/glibc -I../sysdeps/hppa/elf
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa
-I../linuxthreads/sysdeps/unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv
-I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix
-I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32
-I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic
-nostdinc -isystem /home/mklxav/xc/lib/gcc-lib/hppa-linux/2.96/include
-isystem /home/mklxav/cvs/linux/include -D_LIBC_REENTRANT -include
../include/libc-symbols.h     -o
/home/mklxav/xc-build/glibc/posix/glob.o
../sysdeps/generic/glob.c: In function `glob_in_dir':
../sysdeps/generic/glob.c:1446: Internal compiler error in
eliminate_regs, at reload1.c:2505
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

make[2]: *** [/home/mklxav/xc-build/glibc/posix/glob.o] Error 1
make[1]: *** [posix/subdir_lib] Error 2
make: *** [all] Error 2
make[2]: Leaving directory `/home/mklxav/cvs/glibc/posix'
make[1]: Leaving directory `/home/mklxav/cvs/glibc'


in a new and empty user account (mklxav), I created ~/cvs in which there
are cvs files ( binutils gcc glibc linux palo ) and the include dir.

then run the palinux-autobuilder with these modifications:

$top="/home/mklxav";    # Top level
$src="$top/cvs";                # Where your checked-out CVS sources
live
$scratch="$top/xc-build";       # Where your build sub-dirs go
$tempxc="$top/xc";              # Where the temporary binutils/gcc bits
go
$xcprefix="$top/palinux";       # Where to put the final xc bits, needs
to be
                                # owned by the current user(to avoid
sudo)
$nativeprefix="$top/pa-native"; # Where the cross-compiled native tools
                                # will be installed on the native system

$logdir="$top/log";             # Where to put the log files

[...]

# update our CVS bits and includes
#&updatebits;



there were some problems building kernel dependencies the first time I
ran the script.
linux> make oldconfig
linux> make dep
seems to have fixed that.


Thanks for your help!

Xavier.
ESIEE Team
http://www.esiee.fr/puffin
