Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA10408
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 May 2000 22:12:01 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel1.hp.com (Postfix) with ESMTP id EF16717B
	for <parisc-linux@thepuffingroup.com>; Thu, 11 May 2000 18:12:09 -0400 (EDT)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELF tool chain builds hello world!!! 
In-reply-to: Your message of "Thu, 11 May 2000 14:10:13 MDT."
             <E12pzHh-0001Ji-00@endor.fc.hp.com>
Date: Thu, 11 May 2000 16:12:09 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12q1Bh-0008KE-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


To build the limping tool chain, grab the latest CVS bits for
binutils, gcc, and glibc, and follow a recipe somewhat like this
(it's not exact unfortunately, but should contain all the tricks):


PREFIX=$HOME/xc

cvs co binutils glibc gcc
cd gcc
ln -s ../binutils gcc/binutils

mkdir build-gcc
cd build-gcc
../gcc/configure \
	--disable-nls \
	--disable-shared \
	--target=hppa1.1-linux \
	--host=i586-pc-linux-gnu \
	--prefix=$PREFIX \
	--with-headers=/opt/puffin/include \
	--with-libs=$PREFIX/lib \
	--with-libc

make # need libiberty.a
# build until binutils is complete
cd binutils; make install

PATH=$PREFIX/bin:$PATH

cd ../..; mkdir build-glibc; cd build-glibc

../glibc/configure \
	--disable-nls \
	--without-nls \
	--disable-shared \
	--disable-profile \
	--enable-static-nss \
	--build=i586-linux \
	--host=hppa1.1-linux \
	--disable-sanity-checks \
	--with-headers=/opt/puffin/include \
	--prefix=$PREFIX

make # fails pretty soon

cp ../glibc/csu/crt?.S csu/
make # gets pretty far then fails looking for crtbegin.o

cd ../build-gcc
## Remove $PREFIX/bin from your $PATH!!!
## Repeat GCC configure from above then...
make install  # This installs the rest of gcc just in case...

cd ../build-glibc; make
make install MAKEINFO=

cd $(dirname $(find $PREFIX -name crtbegin.o))
ln -s $PREFIX/lib/* .

# Now you should be able to compile hello world

# The problem is that not all the headers seem to be available, in
# two categories: 1) some headers for example glibc/string/memory.h
# which ought to be installed as ...../include/string/memory.h, aren't
# and 2) things in <sys> like <sys/mount.h>
