Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA22021
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Nov 1999 13:25:46 -0700
Date: Mon, 29 Nov 1999 15:27:36 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSO.4.20.9911291514400.6896-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] HPUX 9.05 notes
List-ID: <linux-parisc.vger.kernel.org>


For a lark I tried the "recipe" instructions on a 715/64 
running HPUX 9.05.  A coupla notes:

1) You need to install flex.  Perhaps also some autoconf stuff
and a native HPUX gcc in addition to the cross compiler,
too; those I already had so I wouldn't have noticed if they
were needed.

2) You need to export CONFIG_SHELL=/linux/bin/bash before
running gcc's ./configure or the HPUX /bin/sh dies with
an exhausted "2k buffer" :-P.

3) You need to edit linux/scripts/mkdep.c and take out
the call to getpagesize() (a failed compile will tell you
where.)  Substitute a constant (4096, it appears from 
asm-parisc/.)

How far does this get you?  About up to here:

make
gcc -D__KERNEL__ -I/linux/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -mdisable-fpregs -fwritable-strings
 -pipe -fno-strength-reduce  -c -o init/main.o init/main.c
as:  @line#614 [err#1052]
  Directive name not recognized - BALIGNL
as:  @line#654 [err#1052]
  Directive name not recognized - BALIGNL
init/main.c: In function `do_basic_setup':
init/main.c:1295: warning: implicit declaration of function `gsc_init'
init/main.c: At top level:
init/main.c:1397: warning: type mismatch with previous external decl
/linux/linux/include/asm/unistd.h:879: warning: previous external decl of
`sys_dup'
make: *** [init/main.o] Error 1


I don't know how much of this might be recent CVS breakage and how
much is due to the crusty OS, but I hope this is of help to 
someone.

--
Brian S. Julin
