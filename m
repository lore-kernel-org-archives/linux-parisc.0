Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A074482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 16:27:18 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id QAA09052
	for parisc-linux@parisc-linux.org; Fri, 13 Apr 2001 16:21:16 -0600
Date: Fri, 13 Apr 2001 16:21:16 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200104132221.QAA09052@puffin.external.hp.com>
To: parisc-linux@parisc-linux.org
Subject: [parisc-linux] xfree86 build problem
List-ID: <linux-parisc.vger.kernel.org>

hi folks,

The xfree86 build dies with the following errors:
...
making all in lib/GL/glu/libutil...
make[3]: Entering directory `/home/src/xfree86-4.0.2/build-tree/xc/lib/GL/glu/libutil'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/src/xfree86-4.0.2/build-tree/xc/lib/GL/glu/libutil'
rm -f libGLU.so.1.3~
+ cd .
+ c++ -o ./libGLU.so.1.3~ -shared -Wl,--whole-archive -Wl,-soname,libGLU.so.1 libutil/libutil.a libtess/libtess.a libnurbs/internals/libinternals.a libnurbs/interface/libinterface.a libnurbs/nurbtess/libnurbtess.a -Wl,--no-whole-archive
/usr/bin/ld: error.o: relocation R_PARISC_DPREL21L can not be used when making a shared object; recompile with -fPIC
libutil/libutil.a(error.o): could not read symbols: Bad value
collect2: ld returned 1 exit status
+ rm -f libGLU.so.1
+ ln -s libGLU.so.1.3 libGLU.so.1
+ rm -f ../../../exports/lib/libGLU.so.1
+ cd ../../../exports/lib
+ ln -s ../../lib/GL/glu/libGLU.so.1 .
rm -f libGLU.so.1.3
mv -f libGLU.so.1.3~ libGLU.so.1.3
mv: cannot stat `libGLU.so.1.3~': No such file or directory
make[2]: *** [libGLU.so.1.3] Error 1
make[2]: Leaving directory `/home/src/xfree86-4.0.2/build-tree/xc/lib/GL/glu'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/src/xfree86-4.0.2/build-tree/xc/lib/GL'
make: *** [all] Error 2

a500:/usr/src/xfree86-4.0.2/build-tree/xc/lib# file GL/glu/libutil/error.o
GL/glu/libutil/error.o: ELF 32-bit MSB relocatable, PA-RISC, version 1, not stripped


1) error.o was built with:
gcc -c -O2 -g -ansi -pedantic -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs  -I../include    -I../../../../include   -I../../../../include/GL  -I../../../.. -I../../../../exports/include  -Dlinux  -D_POSIX_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_SVID_SOURCE -D_GNU_SOURCE -DX_LOCALE   -DFUNCPROTO=15 -DNARROWPROTO   -DNDEBUG  error.c
   Is the -fPIC missing here?
   If so, why does "file" say it's relocatable?

   I rebuilt error.o and glue.o by hand with -fPIC, rebuilt the libutil.a,
   and then the build proceeded (until it hit the next problem).

2) c++ isn't returning the error reported by collect2
   Fortunately the build soon dies since the expected product
   doesn't exist. Known problem?


grant
