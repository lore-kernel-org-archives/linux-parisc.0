Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC772482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 12:45:02 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id A874749BF1
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 20:45:02 +0100 (CET)
Date: Sat, 19 Jan 2002 20:45:01 +0100
Mime-Version: 1.0 (Apple Message framework v480)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Thibaut VARENE <varenet@esiee.fr>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Message-Id: <07163A15-0D15-11D6-9B4D-0030656F07A2@esiee.fr>
Subject: [parisc-linux] XGCC MacOSX/hppa64-linux build error
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi.

I tried to compile an xc on MacOSX 10.1.2 (powerpc-apple-darwin5.2) 
targeting hppa64-linux, following taggart instructions (thanks for you 
patience there :), but the build breaks always at the same point, when 
testing libgcc1.

All the 32bit stuff (binutils, libc, gcc) compiled perfectly fine and is 
operational, and the 64bit binutils compiled fine also (but are they 
working correctly ?)

So here is the error I got:

Testing libgcc1.  Ignore linker warning messages.
/Users/varenet/palinux-builds/xc-build/gcc/gcc/xgcc 
-B/Users/varenet/palinux-builds/xc-build/gcc/gcc/ 
-B/usr/local/palinux/hppa64-linux/bin/ 
-B/usr/local/palinux/hppa64-linux/lib/ -isystem 
/usr/local/palinux/hppa64-linux/include -DCROSS_COMPILE -DIN_GCC    -W 
-Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem 
./include  libgcc1-test.o -o libgcc1-test \
   -nostartfiles -nostdlib `/Users/varenet/palinux-builds/xc-
build/gcc/gcc/xgcc -B/Users/varenet/palinux-builds/xc-build/gcc/gcc/ 
-B/usr/local/palinux/hppa64-linux/bin/ 
-B/usr/local/palinux/hppa64-linux/lib/ -isystem 
/usr/local/palinux/hppa64-linux/include --print-libgcc-file-name`
collect2: ld terminated with signal 10 [Bus error], core dumped
/usr/local/palinux/hppa64-linux/bin/ld: warning: cannot find entry 
symbol main; defaulting to 0000000000010280
make[1]: *** [libgcc1-test] Erreur 1
make: *** [all-gcc] Erreur 2

Any idea ?

Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
