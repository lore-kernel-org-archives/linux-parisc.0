Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out1.bellatlantic.net (smtp-out1.bellatlantic.net [199.45.40.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD4E14A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 00:13:24 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-241-153.pittpa.adsl.bellatlantic.net [151.201.241.153])
	by smtp-out1.bellatlantic.net (8.9.1/8.9.1) with ESMTP id CAA00645
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 02:13:13 -0500 (EST)
Sender: raffo@bellatlantic.net
Message-ID: <3A90C77A.634C2FBF@neuronet.pitt.edu>
Date: Mon, 19 Feb 2001 02:12:58 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: PL <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Cannot build 02/18/2001 glibc
List-ID: <linux-parisc.vger.kernel.org>

Hello,

Following the recipe for building the toolchain, I got stuck building
glibc.

The configure error message is:

$ROOT/source/glibc/configure --host=hppa-linux --build=$MACH 
--prefix=$DEST/hppa-linux --with-headers=$ROOT/source/linux/include 
--disable-profile --without-cvs --enable-add-ons
[...]
checking for assembler line separator... *** You need a newer assembler
to compile glibc


The log contains:

configure:2942: checking for assembler line separator
configure:2949: gcc -v -Wa,-v -c  conftest.s 1>&5
Reading specs from /usr/lib/gcc-lib/i486-suse-linux/2.95.2/specs
gcc version 2.95.2 19991024 (release)
 /usr/i486-suse-linux/bin/as -V -Qy -v -o conftest.o conftest.s
GNU assembler version 2.9.5 (i486-suse-linux) using BFD version
2.9.5.0.24
conftest.s: Assembler messages:
conftest.s:1: Error: invalid character '_' in mnemonic

The binaries called and the version numbers are shown. Do I need to
upgrade the assembler or is it a PATH misconfiguration? Thanks.

-- 
     Rafael
