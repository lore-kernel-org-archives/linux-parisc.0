Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.vi-internet.de (mailx.planet-interkom.de [195.182.114.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75AE04A1C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 10:20:01 -0700 (MST)
Message-ID: <3A8183B9.751575EB@hrzpub.tu-darmstadt.de>
Date: Wed, 07 Feb 2001 18:19:53 +0100
From: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
References: <3A814E22.CBA1C0B7@hrzpub.tu-darmstadt.de>
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: Failure making current gcc
List-ID: <linux-parisc.vger.kernel.org>


Hello again!

Sorry, but I cut away the last and most important line. Here it is:

----------- SNIP --------------------

/opt/puffin/xc-build/gcc/gcc/xgcc -B/opt/puffin/xc-build/gcc/gcc/
-B/opt/puffin/xc/hppa-linux/bin/ -B/opt/puffin/xc/hppa-linux/lib/ -isystem
/opt/puffin/xc/hppa-linux/include -DCROSS_COMPILE -DIN_GCC    -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include  -I.
-I. -I/opt/puffin/palinux/gcc/gcc -I/opt/puffin/palinux/gcc/gcc/.
-I/opt/puffin/palinux/gcc/gcc/config -I/opt/puffin/palinux/gcc/gcc/../include  -g0
\
  -finhibit-size-directive -fno-inline-functions \
  -fno-exceptions -fPIC  \
  -c /opt/puffin/palinux/gcc/gcc/crtstuff.c -DCRT_BEGIN -DCRTSTUFFS_O \
  -o crtbeginS.o
/tmp/cc0dgVTi.s: Assembler messages:
/tmp/cc0dgVTi.s:74: Internal error, aborting at
/opt/puffin/palinux/binutils/gas/write.c line 2852 in number_to_chars_bigendian
Please report this bug.
/tmp/ccrwiArd.s: Assembler messages:
/tmp/ccrwiArd.s:102: Internal error, aborting at
/opt/puffin/palinux/binutils/gas/write.c line 2852 in number_to_chars_bigendian
Please report this bug.
make[1]: *** [crtbegin.o] Fehler 1
make[1]: *** Warte auf noch nicht beendete Prozesse....
make[1]: *** [crtbeginS.o] Fehler 1
make[1]: Verlassen des Verzeichnisses Verzeichnis »/opt/puffin/xc-build/gcc/gcc«
make: *** [all-gcc] Fehler 2

------------------------------ SNAP ----------------------------------

So long,
                Rüdiger
