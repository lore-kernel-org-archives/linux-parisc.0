Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA28020
	for <parisc-linux@puffin.external.hp.com>; Sun, 23 Jul 2000 22:59:34 -0600
Message-Id: <200007240503.WAA21420@milano.cup.hp.com>
To: Jeff Towarnicki <jtowarnicki@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems compiling.. 
In-reply-to: Your message of "Thu, 20 Jul 2000 12:29:15 PDT."
             <20000720192915.1112.qmail@web4802.mail.yahoo.com>
Date: Sun, 23 Jul 2000 22:03:08 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jeff Towarnicki wrote:
> I am having problems compiling gcc.. I am following
> the recipe but I get problems with include files not
> being found...

Jeff,
I don't the recipe is up-to-date anymore.
(gosh...that happened pretty fast).
It should be updated this coming week sometime.
Either I or Matt Taggart will update it.

In the meantime, you can hack the appended shell script.
(Should only need some initialization changes.)
It worked for me 10 days ago (ie before OLS).

enjoy,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253


#!/bin/sh -x
#
# ~/bin/recipe.puffin
#
# build the xcompiler and glibc recipe
# 5/2000
# willy, pb, taggart, grundler, others

# make sure we don't get anything from any existing $PREFIX/bin
PATH=/usr/local/bin:/usr/bin:/bin

# Top level, "include" files also get tmp storage here.
TOP=/linux/grundler

# Where checked-out CVS sources live
SRC=$TOP

# Where your build sub-dirs go
BUILD=$TOP/xc-build

# Where to put the final bits, needs to be owned by the
# current user(to avoid sudo games)
PREFIX=/opt/puffin

# what we build by default
TARGET=hppa-linux
EXTRA_OPT=""

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
	    EXTRA_OPT="--enable-64-bit-bfd"
	    # PREFIX=${PREFIX}64 in case we need to start over alot
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

INCLUDE=$PREFIX/$TARGET/include

# Requirements
# o $SRC has binutils-2.10 gcc checked out
# o $PREFIX/include comes from pehc:~ftp/pub/parisc/src/include.tar.gz

# Copy include/asm and include/linux to $PREFIX/include
if [ ! -d $TOP/include ]
then
	echo  Please untar pehc:~ftp/pub/parisc/src/include.tar.gz in $TOP/include first!
	exit 1
fi

mkdir -p $INCLUDE
cp -r $TOP/include/* $INCLUDE
cp -r $SRC/linux-2.3/include/asm $INCLUDE
cp -r $SRC/linux-2.3/include/linux $INCLUDE

# make sure BUILD dirs exist
mkdir -p $BUILD/build-gcc $BUILD/build-binutils

### binutils
cd $BUILD/build-binutils
$SRC/binutils-2.10/configure --target=$TARGET --prefix=$PREFIX --disable-nls \
	$EXTRA_OPT
make
make install

# Prepend $PREFIX/bin to the path to get the right binutils
PATH=$PREFIX/bin:$PATH

cd $BUILD/build-gcc
$SRC/gcc/configure --target=$TARGET --prefix=$PREFIX --disable-nls \
	--without-libc --enable-languages=c

make LIBGCC2_INCLUDES=-I$INCLUDE
make install
