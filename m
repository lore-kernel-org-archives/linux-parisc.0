Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA10664
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 May 2000 22:19:32 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id BA28D54D
	for <parisc-linux@thepuffingroup.com>; Thu, 11 May 2000 15:18:27 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELF tool chain builds hello world!!! 
In-reply-to: Your message of "Thu, 11 May 2000 16:12:09 MDT."
             <E12q1Bh-0008KE-00@endor.fc.hp.com>
Date: Thu, 11 May 2000 16:18:27 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12q1Hn-0008Kx-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Gaak! so many errors in my recipe!

First, I'm pre-supposing you have /opt/puffin populated with the
current tool chain and the "includes" tarball in /opt/puffin/include.

= To build the limping tool chain, grab the latest CVS bits for
= binutils, gcc, and glibc, and follow a recipe somewhat like this
= (it's not exact unfortunately, but should contain all the tricks):
= 
= 
= PREFIX=$HOME/xc
= 
= cvs co binutils glibc gcc
Do Not = cd gcc
= ln -s ../binutils gcc/binutils
= 
= mkdir build-gcc
= cd build-gcc
= ../gcc/configure \
= 	--disable-nls \
= 	--disable-shared \
= 	--target=hppa1.1-linux \
= 	--host=i586-pc-linux-gnu \
= 	--prefix=$PREFIX \
= 	--with-headers=/opt/puffin/include \
= 	--with-libs=$PREFIX/lib \
= 	--with-libc
= 
= make # need libiberty.a
= # build until binutils is complete

It's probably OK to let gcc build to completion and install that, if it works

= cd binutils; make install
= 
= PATH=$PREFIX/bin:$PATH
= 
= cd ../..; mkdir build-glibc; cd build-glibc
= 
= ../glibc/configure \
= 	--disable-nls \
= 	--without-nls \
= 	--disable-shared \
= 	--disable-profile \
= 	--enable-static-nss \
= 	--build=i586-linux \
= 	--host=hppa1.1-linux \
= 	--disable-sanity-checks \
= 	--with-headers=/opt/puffin/include \
= 	--prefix=$PREFIX
= 
= make # fails pretty soon
= 
= cp ../glibc/csu/crt?.S csu/
= make # gets pretty far then fails looking for crtbegin.o
= 
= cd ../build-gcc

Do Not = ## Remove $PREFIX/bin from your $PATH!!!
Do Not = ## Repeat GCC configure from above then...

= make install  # This installs the rest of gcc just in case...
= 
= cd ../build-glibc; make
= make install MAKEINFO=
= 
= cd $(dirname $(find $PREFIX -name crtbegin.o))
= ln -s $PREFIX/lib/* .

You may get warnings here from 'ln' -- ignore them

= # Now you should be able to compile hello world
= 
= # The problem is that not all the headers seem to be available, in
= # two categories: 1) some headers for example glibc/string/memory.h
= # which ought to be installed as ...../include/string/memory.h, aren't
= # and 2) things in <sys> like <sys/mount.h>
= 
= ---------------------------------------------------------------------------
= To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
= `unsubscribe' as the subject.
= 
= 
= 
