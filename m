Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5325482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 13:14:34 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id 9B5EF49BED
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 21:14:32 +0100 (CET)
Date: Mon, 4 Feb 2002 21:14:32 +0100
Mime-Version: 1.0 (Apple Message framework v480)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Thibaut VARENE <varenet@esiee.fr>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Message-Id: <CD0E8AAC-19AB-11D6-B4EE-0030656F07A2@esiee.fr>
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

Hi,

I have tried again to compile an xc on MacOSX 10.1.2 
(powerpc-apple-darwin5.2)
targeting hppa64-linux with the most recent xc sources provided by 
Taggart (thank you
again :), but the build breaks always at the same point, when
testing libgcc1.

All the 32bit stuff (binutils, libc, gcc) compiled perfectly fine, but 
I'm not absolutly certain that it is operationnal, contrary to the 
previous xc I made (see my other mail for details).

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
make[1]: *** [libgcc1-test] Error 1
make: *** [all-gcc] Error 2

Any clue ?


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
