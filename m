Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA30570
	for <parisc-linux@puffin.external.hp.com>; Mon, 31 Jul 2000 12:03:10 -0600
Received: from smtp.linuxcare.com (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 31 Jul 2000 18:05:11 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 31 Jul 2000 18:04:54 -0000
Sender: tdear@mailserv2.iuinc.com
Message-ID: <39864BF4.4FD098D0@linuxcare.com>
Date: Mon, 31 Jul 2000 21:03:00 -0700
From: Tara Dear <tdear@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------F05DCDB7773AE4839A821D77"
Subject: [parisc-linux] recipe
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------F05DCDB7773AE4839A821D77
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

dhd asked me to post this recipe the group.  I worked for me.

-TARA



--------------F05DCDB7773AE4839A821D77
Content-Type: text/plain; charset=us-ascii;
 name="recipe"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="recipe"

#!/bin/sh -e

PREFIX=/home/tdear/parisc
HOST=i386-linux

export CVS_RSH=ssh
echo Checking for CVS directories
test -d binutils-2.10
test -d gcc
test -d glibc
test -d linux-2.3
test -f include.tar.gz

echo Updating binutils-2.10
(cd binutils-2.10 && cvs update -dP)
echo Building binutils in `pwd`/binutils-build
rm -rf binutils-build
mkdir binutils-build
cd binutils-build
../binutils-2.10/configure --disable-nls --target=hppa-linux \
	--prefix=$PREFIX
make && make install

# Now set this up to point to the place we installed binutils
export PATH=$PATH:$PREFIX/bin

cd ..
echo Updating gcc
(cd gcc && cvs update -dP)
echo Building gcc in `pwd`/gcc-build
rm -rf gcc-build
mkdir gcc-build
cd gcc-build
../gcc/configure --disable-nls --target=hppa-linux --prefix=$PREFIX \
	--enable-languages=c
make || true
make install

cd ..
echo Updating glibc
(cd glibc && cvs update -dP)
# We need the most recent include files
echo Updating linux-2.3
(cd linux-2.3 && cvs update -dP)
echo Updating header files in $PREFIX/hppa-linux/include/{linux,asm}
rm -rf $PREFIX/hppa-linux/include/{linux,asm}
cp -a linux-2.3/include/linux $PREFIX/hppa-linux/include
cp -a linux-2.3/include/asm-parisc $PREFIX/hppa-linux/include/asm
echo Building glibc in `pwd`/glibc-build
rm -rf glibc-build
mkdir glibc-build
cd glibc-build
../glibc/configure --disable-nls --host=hppa-linux --build=$HOST \
	--disable-cvs --disable-sanity-checks --disable-shared \
	--disable-profile --enable-static-nss --prefix=$PREFIX/hppa-linux \
	--with-headers=`pwd`/../linux-2.3/include
make
make install

cd ..
echo Rebuilding GCC with C++ enabled
rm -rf gcc-build
mkdir gcc-build
cd gcc-build
../gcc/configure --disable-nls --target=hppa-linux --prefix=$PREFIX \
	--enable-languages=c,c++
make
make install

--------------F05DCDB7773AE4839A821D77--
