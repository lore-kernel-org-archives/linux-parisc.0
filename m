Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bender.bawue.de (bender.bawue.de [193.197.13.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5527F482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 11:11:02 -0600 (MDT)
Received: from gate.ixs.com (p3EE05BCF.dip.t-dialin.net [62.224.91.207])
	by bender.bawue.de (Postfix) with ESMTP id 5A4E54828C
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 19:10:51 +0200 (CEST)
Received: from localhost (andreas@localhost)
	by gate.ixs.com (8.9.3/8.9.3) with ESMTP id TAA21166
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 19:10:43 +0200
Date: Fri, 20 Apr 2001 19:10:43 +0200 (CEST)
From: Andreas Thienemann <andreas@thienemann.net>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.10.10104201906260.21140-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Problems with glibc
List-ID: <linux-parisc.vger.kernel.org>

Hi,

while trying to compile the current glibc snapshot from the puffin-cvs, make
segfaults:

make[2]: Entering directory `/mnt/lfs/usr/src/glibc/sunrpc'
/mnt/lfs/usr/src/glibc-build/elf/ld.so.1 --library-path
/mnt/lfs/usr/src/glibc-build:/mnt/lfs/usr/src/glibc-build/math:/mnt/lfs/usr/src/glibc-build/elf:/mnt/lfs/usr/src/glibc-build/dlfcn:/mnt/lfs/usr/src/glibc-build/nss:/mnt/lfs/usr/src/glibc-build/nis:/mnt/lfs/usr/src/glibc-build/rt:/mnt/lfs/usr/src/glibc-build/resolv:/mnt/lfs/usr/src/glibc-build/crypt:/mnt/lfs/usr/src/glibc-build/linuxthreads
/mnt/lfs/usr/src/glibc-build/sunrpc/rpcgen -Y `x=\`gcc
-print-file-name=cpp\`; test x$x = xcpp && x=\`which cpp\`; echo $x | sed
's,/cpp$,,'` -c rpcsvc/bootparam_prot.x -o
/mnt/lfs/usr/src/glibc-build/sunrpc/xbootparam_prot.T
make[2]: *** [/mnt/lfs/usr/src/glibc-build/sunrpc/xbootparam_prot.stmp]
Segmentation fault
make[2]: Leaving directory `/mnt/lfs/usr/src/glibc/sunrpc'
make[1]: *** [sunrpc/others] Error 2
make[1]: Leaving directory `/mnt/lfs/usr/src/glibc'
make: *** [all] Error 2

Has anyone ever experienced a similar problem? This segfault is
reproducable and it's the first time that happened. gcc did compile
correct, the same with the kernel itself.
Therefore I'd guess that glibc is at fault here.
This happened while building the glibc on the hppa box (with the
baseplus-20010404 nfsroot).
Building the cross-compiler toolchain which does include building glibc
was successful though.

Any ideas?

bye,
 andreas
