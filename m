Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2325A4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Feb 2001 05:00:25 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C1E98B005; Wed, 14 Feb 2001 12:00:08 +0000 (GMT)
Date: Wed, 14 Feb 2001 12:00:08 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010214120008.Q1374@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] building a devel branch gcc
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I recently built a devel branch gcc that was capable of building
working 64 bit kernels.  I'm posting the scripts I used in the hope
that they might be useful.  They are heavily based on info from Alan
Modra.

These scripts probably don't do exactly what you want, but should
be a useful starting point.  More likely, you want to build
x86 to parisc32 and parisc64 cross-compilers.  Hoepfully Matt
will do a new xc package when he gets back in a few days.

I checked out binutils, glibc, linux, and gcc -r devel on x86, and
used Matts latest xc to build a devel gcc x86 to parisc32 xc, and
used that to build a native parisc gcc.  I then copied
that on to my A500, and used it to build a parisc32 to parisc64
gcc cross-compiler.  That cross-compiler was then used to build a
64 bit kernel.  The kernel was tested by booting it on the A500
and then rebuilding the kernel.

The A500 was running Matts latest nfsroot tarball, with bits
(such as glibc) upgraded to ones in the new-debs dir on pehc.

So, the script to run x86 to build the native parisc32 compiler:

========================== cut =================================
#!/bin/sh
# From Alan Modra, 12th Feb 2001
# parameterised by Richard Hirst

export PATH=/bin:/usr/bin

BUILDDIR=/mnt/parisc/alan
BINUTILSSRC=/mnt/parisc/xc/source/binutils
GCCSRC=/mnt/parisc/xc/source/gcc
GLIBCSRC=/mnt/parisc/xc/source/glibc
PARISCLINUXSRC=/mnt/parisc/xc/source/linux
TMPINSTALLDIR=/mnt/parisc/alan-install

rm -rf $TMPINSTALLDIR
rm -rf $BUILDDIR
mkdir $BUILDDIR
cd $BUILDDIR
mkdir build
cd build
mkdir bin
echo build latest cross binutils, `date`
cd bin
$BINUTILSSRC/configure --host=i686-linux --prefix=/usr \
--target=hppa-linux --enable-targets=hppa64-linux --disable-nls
make
echo dont forget those links
echo Now su, make install, and exit, exit
bash
cd ..
echo build latest cross compiler, `date`
mkdir devel
cd devel
$GCCSRC/configure --host=i686-linux --target=hppa-linux \
--prefix=/usr --enable-shared --disable-nls --enable-languages=c
make
echo Now su, make install, and exit, exit
bash
cd ..
echo build glibc, assumes linux includes available, `date`
mkdir glibc
cd glibc
$GLIBCSRC/configure --prefix=/usr/hppa-linux --build=i686-linux \
--host=hppa-linux --target=hppa-linux \
--with-headers=$PARISCLINUXSRC/include --disable-profile \
--without-cvs --enable-add-ons
make
echo Now su, make install, and exit, exit
echo You also want to do something like (from memory):
echo     cd /usr/hppa-linuc/include
echo     ln -s $PARISCLINUXSRC/include/asm .
echo     ln -s $PARISCLINUXSRC/include/linux .
bash
cd ..
echo cross compile native gcc, `date`
mkdir xc
cd xc
$GCCSRC/configure --build=i686-linux --host=hppa-linux \
--target=hppa-linux --prefix=/usr --disable-shared --disable-nls \
--enable-languages=c
make
make prefix=$TMPINSTALLDIR install
echo Done, `date`

# copy stuff from $TMPINSTALLDIR to /tftpboot
# then hop across to do a bootstrap natively.

========================== cut =================================


and now the script run on the A500 to produce the 32 to 64 bit
xc.  The make palo at the end fails in palo, because it tries
to use the hppa64-linux- tools.  hack the palo Makefiles, or
move your vmlinux to x64 to run palo on it.


========================== cut =================================
#!/bin/sh

echo ">>> starting, `date`"

# Update and rebuild parisc xc, etc.

TOP=/build/xc
MACH=hppa-linux
DEST=$TOP/parisc64
PATH=$TOP/parisc64/bin:/bin:/usr/bin

# cvs update source

if false; then
cd $TOP/source
cd binutils
cvs update .
cd ../glibc
cvs update .
cd ../gcc
cvs update -r devel .
cd ../linux
cvs update .
cd ../palo
cvs update .
fi

# clean binary tree

cd $TOP
rm -rf parisc64
mkdir parisc64

# clean build tree

cd $TOP
rm -rf build-64
mkdir build-64

# configure and build binutils

echo ">>> configure and build binutils, `date`"
cd $TOP/build-64 && rm -rf binutils && mkdir binutils && cd binutils
$TOP/source/binutils/configure --host=$MACH --prefix=$DEST \
		--disable-nls hppa64-linux
make
make install

# configure and partially build gcc

echo ">>> configure and partially build gcc, `date`"
cd $TOP/build-64 && rm -rf gcc && mkdir gcc && cd gcc
$TOP/source/gcc/configure --host=$MACH --prefix=$DEST \
		--target=hppa64-linux --enable-shared \
		--disable-nls --enable-languages=c
rm -r zlib hppa64-linux
make
make install

# clean palo

echo ">>> cleaning palo build tree, `date`"
cd $TOP/source/palo
make clean

# configure the kernel

echo ">>> configure the kernel, `date`"
cd $TOP/source/linux
make distclean
make oldconfig
make dep

# build the kernel

echo ">>> build the kernel, `date`"
cd $TOP/source/linux
make clean
make palo

# done!!!

echo ">>> done, `date`"

cd $TOP
========================== cut =================================
