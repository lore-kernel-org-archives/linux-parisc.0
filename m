Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lufmech.rwth-aachen.de (karman.lufmech.RWTH-Aachen.DE [134.130.177.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21D8C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 04:15:23 -0600 (MDT)
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3AC9A2B8.DE0DE5A6@lufmech.rwth-aachen.de>
Date: Tue, 03 Apr 2001 12:15:21 +0200
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs-gcc: howto build a 64-bit version?
List-ID: <linux-parisc.vger.kernel.org>

I tried to build cvs-gcc from
:pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc
using binutils from the same cvs server. For the 32-bit no build
problems, but the 64-bit bootstrap
fails. Any help for creating a 64-bit version of g++ appreciated.

=============================
32 BIT:
==============================

I built binutils and 32-bit gcc/g++/g77:
../binutils/configure --prefix=/opt/FREE-SOFTWARE/puffin-gcc-20010403
--with-gnu-as
->make/install success

../gcc/configure --prefix=/opt/FREE-SOFTWARE/puffin-gcc-20010403
--with-gnu-as --without-gnu-ld --enable-languages=f77,c,c++
--enable-version-specific-runtime-libs
-> bootstrap/install success

linkage errors in the c++ part:

[markus@tresca]  src/ > g++ ../experimental/HelloWorld.C/usr/ccs/bin/ld:
Unsatisfied symbols:
   std::ios_base::Init::~Init()(code)
   std::ostream::operator<<(std::ostream& (*)(std::ostream&))(code)
   std::ios_base::Init::Init()(code)
   std::ostream::flush()(code)
   std::ostream::put(char)(code)
   std::basic_ostream<char, std::char_traits<char> >& std::operator<<
<std::char_traits<char> >(std::basic_ostream<char,
std::char_traits<char> >&, char const*)(code)
   std::cout (data)
collect2: ld returned 1 exit status

=============================
64 BIT:
==============================

   #  md build-binutils-64
   #  cd build-binutils-64/
   #  ../binutils/configure
--prefix=/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF
--host=hppa64-hp-hpux11.00 --with-gnu-as --with-gnu-ld && make -j4
   #  make install

    success

   #  cd ../build-gcc-64/
   #  ../gcc/configure --host=hppa64-hp-hpux11.00
--prefix=/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF --with-gnu-as
--with-gnu-ld --enable-languages=f77,c,c++
--enable-version-specific-runtime-libs && make -j4 bootstrap

    fails at a well-known place:

[...]
make[2]: Entering directory `/work/markus/HP-GCC/build-gcc-64/gcc'
(cd intl && make all)
make[3]: Entering directory `/work/markus/HP-GCC/build-gcc-64/gcc/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/work/markus/HP-GCC/build-gcc-64/gcc/intl'
(cd po && make all)
make[3]: Entering directory `/work/markus/HP-GCC/build-gcc-64/gcc/po'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/work/markus/HP-GCC/build-gcc-64/gcc/po'
echo "int xxy_us_dummy;" >tmp-dum.c
./xgcc -B./
-B/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/bin/
-isystem
/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/include
-S tmp-dum.c
cc1: Internal compiler error in set_sizetype, at stor-layout.c:1673
Please submit a full bug report, with preprocessed source if
appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [s-under] Error 1
make[2]: Leaving directory `/work/markus/HP-GCC/build-gcc-64/gcc'
make[1]: *** [stage1_build] Error 2
make[1]: Leaving directory `/work/markus/HP-GCC/build-gcc-64/gcc'
make: *** [bootstrap] Error 2
