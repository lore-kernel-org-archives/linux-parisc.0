Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA14401
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 14:35:04 -0700
Received: from localhost (funnyguy@localhost)
	by morph.net (8.9.3/8.9.3) with ESMTP id QAA18739
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Mar 2000 16:31:28 -0500
Date: Mon, 27 Mar 2000 16:31:28 -0500 (EST)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10003271628390.18589-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] build errors, recipe still not up to date?
List-ID: <linux-parisc.vger.kernel.org>


I've been folowing the recipe step by step, yet i still get build
problems.  i'm working witht he march 26th 2.3.42 version, and everything
in the kernel is building fine, except the link at the end.

anyone know?  did i not get something?

mike

make[2]: Entering directory `/tmp/mabran3/palo/ipl'
echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
hppa1.1-linux-gcc -I/tmp/mabran3/palo/../linux-2.3/include -I../lib -O2
-fwritable-strings -mdisable-fpregs -Wall -c -o build.o build.c
rm -f build.c
hppa1.1-linux-ld -N -Ttext 0x500000 -e '$START$' -o ipl crt0.o byteio.o
elf64.o        ipl.o         offset.o      som.o diskpart.o    ext2.o
lib.o         pdc_bootio.o  vsprintf.o elf32.o            fileio.o
load.o        pdc_cons.o build.o
/tmp/mabran3/palo/../linux-2.3/arch/parisc/lib/milli.o
rm -f build.o
make[2]: Leaving directory `/tmp/mabran3/palo/ipl'
./palo/palo -s -b ipl/ipl -k /tmp/mabran3/palo/../linux-2.3/vmlinux -r
/tmp/mabran3/palo/../linux-2.3/ramdisk.bin \
-c "0/vmlinux HOME=/ TERM=LINUX root=/dev/ram initrd=0/ramdisk" lifimage
palo version 0.8 mabran3@alpha Mon Mar 27 16:30:10 EST 2000
/tmp/mabran3/palo/../linux-2.3/ramdisk.bin: No such file or directory
make[1]: *** [lifimage-only] Error 2
