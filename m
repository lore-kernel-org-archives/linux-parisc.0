Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA14787
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 19:22:49 -0600
Message-Id: <200007110126.SAA12879@milano.cup.hp.com>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64-bit compiler 
In-reply-to: Your message of "10 Jul 2000 17:20:11 PDT."
             <87wvitbs38.fsf@linuxcare.com>
Date: Mon, 10 Jul 2000 18:26:03 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines wrote:
> Hi,
> 
> I've just checked in the requisite configuration bits (and fixed a
> buglet in BFD) to make it possible to build a 64-bit toolchain.  As
> expected, merging forward to 2.96 made this a lot easier.
> 
> I have no idea whether it generates correct binaries or not, of course.
> 
> To try it out, this short recipe should do:

David,
The short recipe you included wasn't enough for me...
Could you post required changes for the following recipe?
(I call it recipe.puffin64)

This is based off of what Matt sent me a while back for 32-bit builds.

thanks,
grant

#!/bin/sh -x
# build the xcompiler and glibc recipe
# 5/2000
# willy, pb, taggart, others

# make sure we don't get anything from any existing $PREFIX/bin
PATH=/usr/local/bin:/usr/bin:/bin

# Top level
TOP=/linux/grundler

# Where your checked-out CVS sources live
SRC=$TOP

# Where your build sub-dirs go
BUILD=$TOP/xc-build64

# Where to put the final bits, needs to be owned by the
# current user(to avoid sudo games)
PREFIX=/opt/puffin64

# Requirements
# o $SRC has binutils-2.10 gcc checked out
# o $PREFIX/include comes from pehc:~ftp/pub/parisc/src/include.tar.gz
cd $TOP
cvs -z3 update -d binutils-2.10 gcc

# Copy include/asm and include/linux to $PREFIX/include
if [ ! -d $SRC/include ]
then
	echo  Please untar pehc:~ftp/pub/parisc/src/include.tar.gz in $PREFIX/include first!
	exit 1
fi

cp -r $SRC/linux-2.3/include/asm $PREFIX/include
cp -r $SRC/linux-2.3/include/linux $PREFIX/include


# Clean out and/or create some things
rm -fr $BUILD/build-gcc $BUILD/build-binutils
mkdir -p $BUILD/build-gcc $BUILD/build-binutils

### binutils
cd $BUILD/build-binutils
# $SRC/binutils-2.10/configure --enable-64-bit-bfd --target=hppa64-linux --prefix=$PREFIX --disable-nls
$SRC/binutils-2.10/configure --target=hppa64-linux --prefix=$PREFIX --disable-nls
make
make install

# Prepend $PREFIX/bin to the path to get the right binutils
PATH=$PREFIX/bin:$PATH

cd $BUILD/build-gcc && rm -r *
$SRC/gcc/configure \
	--target=hppa64-linux \
	--prefix=$PREFIX \
	--disable-nls \
	--without-libc

make LIBGCC2_INCLUDES=-I$PREFIX/include LANGUAGES=c
make install
