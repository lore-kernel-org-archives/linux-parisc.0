Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA27946
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 13:18:44 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 02206151E
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Jul 2000 12:15:35 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id MAA13540
	for parisc-linux@thepuffingroup.com; Tue, 11 Jul 2000 12:17:31 -0700 (PDT)
Date: Tue, 11 Jul 2000 12:17:31 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200007111917.MAA13540@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] recipe.puffin
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Appended is an updated script I run to build binutils/gcc
on an i686-linux host. Please post corrections...

enjoy,
grant

#!/bin/sh -ex
# build the xcompiler and glibc recipe
# 5/2000
# willy, pb, taggart, grundler, others

# make sure we don't get anything from any existing $PREFIX/bin
PATH=/usr/local/bin:/usr/bin:/bin

# Top level
TOP=/linux/grundler

# Where your checked-out CVS sources live
SRC=$TOP

# Where your build sub-dirs go
BUILD=$TOP/xc-build

# Where to put the final bits, needs to be owned by the
# current user(to avoid sudo games)
PREFIX=/opt/puffin

# narrow or wide mode bits?
TARGET=hppa-linux

set -- `getopt uwrRp: $*`

while [ $# -gt 0 ]
do
	case $1 in
	-u) cd $TOP
	    cvs -z3 update -d binutils-2.10 gcc glibc
	    ;;
	-R) rm -fr $BUILD/build-gcc $BUILD/build-binutils
	    ;;
	-r) rm -rf $PREFIX/*
	    ;;
	-w) TARGET=hppa64-linux
	    BUILD=${BUILD}64
	    PREFIX=${PREFIX}64
	    ;;
	-p) if [ -d $2 ]
	    then
		PREFIX=$2
	        shift
	    else
		echo "-p $2 is not a directory."
		exit 2
	    fi
	    ;;
	--)
	    ;;

	*)  set +x
	    echo "Invalid parameter: $1"
	    echo "Usage: recipe.puffin [ -w -u -r -p <prefix> ]"
	    echo "	-w build 64-bit (hppa64-linux) instead of hppa-linux"
	    echo "	-u update binutils-2.10 and gcc from CVS"
	    echo "	-r delete existing file in install directory"
	    echo "	-R delete existing build directories"
	    echo "	-p <prefix> install destination (default: /opt/puffin)"
	    exit 1
	    ;;
	esac
        shift
done

# Requirements
# o $SRC has binutils-2.10 gcc checked out
# o $PREFIX/include comes from pehc:~ftp/pub/parisc/src/include.tar.gz

# Copy include/asm and include/linux to $PREFIX/include
if [ ! -d $SRC/include ]
then
	echo  Please untar pehc:~ftp/pub/parisc/src/include.tar.gz in $PREFIX/include first!
	exit 1
fi

cp -r $SRC/linux-2.3/include/asm $PREFIX/include
cp -r $SRC/linux-2.3/include/linux $PREFIX/include


# make sure BUILD dirs exist
mkdir -p $BUILD/build-gcc $BUILD/build-binutils

### binutils
cd $BUILD/build-binutils
# $SRC/binutils-2.10/configure --enable-64-bit-bfd --target=$TARGET --prefix=$PREFIX --disable-nls
$SRC/binutils-2.10/configure --target=$TARGET --prefix=$PREFIX --disable-nls
make
make install

# Prepend $PREFIX/bin to the path to get the right binutils
PATH=$PREFIX/bin:$PATH

cd $BUILD/build-gcc
$SRC/gcc/configure --target=$TARGET --prefix=$PREFIX --disable-nls \
	--without-libc

make LIBGCC2_INCLUDES=-I$PREFIX/include LANGUAGES=c
make install
