Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22080
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 May 2000 15:31:00 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id DCFBF466B
	for <parisc-linux@thepuffingroup.com>; Fri, 12 May 2000 17:29:28 -0400 (EDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 4850E4FE19
	for <parisc-linux@thepuffingroup.com>; Fri, 12 May 2000 17:29:28 -0400 (EDT)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELF tool chain builds hello world!!! 
In-reply-to: Your message of "Thu, 11 May 2000 16:18:27 MDT."
             <E12q1Hn-0008Kx-00@endor.fc.hp.com>
Date: Fri, 12 May 2000 15:29:27 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12qMzv-0006qV-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


This recipe is a little better.  Remember it assumes /opt/puffin
contains the current cross compiler and /opt/puffin/include contains
the include.tar.gz tarball.


#!/bin/sh

set -e
set -x

# Where to put the built results
PREFIX=$HOME/xc

# Where your checked-out CVS sources live
SRC=$HOME/palinux

# Where your build sub-dirs go
BUILD=$HOME/xc-build

# Clean out and/or create some things
rm -fr $PREFIX/* $BUILD/build-gcc $BUILD/build-glibc
mkdir -p $PREFIX $BUILD/build-gcc -p $BUILD/build-glibc

PATH=$PREFIX/bin:/opt/puffin/bin:$PATH

# Allow the GCC configure step to auto-configure binutils
cd $SRC && rm -f gcc/binutils &&
    ln -s ../binutils gcc/binutils

# This'll mainly build binutils for now
cd $BUILD/build-gcc
$SRC/gcc/configure \
	--disable-nls \
	--disable-shared \
	--target=hppa1.1-linux \
	--host=i586-pc-linux-gnu \
	--prefix=$PREFIX \
	--with-headers=/opt/puffin/include \
	--with-libs=$PREFIX/lib \
	--with-libc

make || true

# build will fail inside gcc somewhere, don't stop the script for this

# Install binutils anyway
cd binutils; make install

# no need to re-make this again
rm $SRC/gcc/binutils

# Get ready to re-config gcc -- should build this time
cd $BUILD/build-gcc && rm -r *
$SRC/gcc/configure \
	--disable-nls \
	--disable-shared \
	--target=hppa1.1-linux \
	--host=i586-pc-linux-gnu \
	--prefix=$PREFIX \
	--with-headers=/opt/puffin/include \
	--with-libs=$PREFIX/lib \
	--with-libc
make
make install

cd $BUILD/build-glibc

$SRC/glibc/configure \
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

cd $BUILD/build-glibc
make || true # fails pretty soon

cp $SRC/glibc/csu/crt?.S csu/ || true

cd $(dirname $(find $PREFIX -name crtbegin.o))
ln -s $PREFIX/lib/* .

# Now you should be able to compile hello world

# The problem is that not all the headers seem to be available, in
# two categories: 1) some headers for example glibc/string/memory.h
# which ought to be installed as ...../include/string/memory.h, aren't
# and 2) things in <sys> like <sys/mount.h>
