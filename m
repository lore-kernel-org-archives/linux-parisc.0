Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp4ve.mailsrvcs.net (smtp4vepub.gte.net [206.46.170.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id E47764A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 00:27:31 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-241-66.pittpa.adsl.bellatlantic.net [151.201.241.66])
	by smtp4ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id HAA2834820
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 07:33:10 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A976261.EEA18B66@neuronet.pitt.edu>
Date: Sat, 24 Feb 2001 02:27:29 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile  
 system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
		<3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
		<3A94CEF9.F171DE3F@alcatel.at> <3A974D1F.3BBB87C8@neuronet.pitt.edu> <m3wvagiojx.fsf@otr.mynet.cygnus.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

The idea is to build glibc so you can place it in the root directory of
your parisc tree.

I saw this post that mentions how to build glibc using the cross
compiler and then installing it in the nfsroot. The instructions are for
installing glibc in a separate tree. I'm just learning how to use the
install_root option.

It's no so "strange", how about these options now?:

export MACH=i386-linux
export DEST=/usr
export ROOT=~/parisk

HOSTCC=gcc CC=hppa-linux-gcc $ROOT/source/glibc/configure \
--prefix=$DEST --build=$MACH \
--host=hppa-linux --target=hppa-linux \
--with-headers=$ROOT/source/linux/include --disable-profile \
--without-cvs --enable-add-ons
make MAKE="make -j 10" user-defined-trusted-dirs=/lib
make install user-defined-trusted-dirs=/lib \
 install_root=/tmp/glibc

Christoph mentions that a 'make install' has to be made first, but
obviously I can't do that.

If you have a better suggestion, I'll be glad to read it.

PS. I've tried this already, re-configuring it with a new prefix,
without cleaning the tree, and copying it into the nfsroot. The boot
stops when 'init' is started :(
I'm rebuilding from scratch now, we'll see.

--
     Rafael
