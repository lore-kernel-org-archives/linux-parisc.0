Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA08202
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Sep 1999 13:21:06 -0600
Received: from celeris (ti08a95-0277.dialup.online.no [130.67.47.21])
	by online.no (8.9.3/8.9.1) with SMTP id VAA29471
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Sep 1999 21:23:29 +0200 (MET DST)
Message-Id: <199909271923.VAA29471@online.no>
Date: Mon, 27 Sep 1999 21:29:20 +0200
To: parisc-linux@thepuffingroup.com
From: Simen Thoresen <simen-tt@online.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] compiling on a 735?
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I've recently gotten hold of a 735/99 (A2608A) workstation (128M ram and 2 
really loud disks), and would like to contribute.

I've cleaned one of the disks, and on the other I've installed the 
egcs, flex and make depots (the bash-depot seems to be non-
existent, so I've compiled and installed it from gnu.org myself.

I've downloaded a kernel snapshot (some days ago), and now have 
some questions;

1. has anybody compiled ncurses, so that make menuconfig works? I'll give
it a try soon.
2. Is my 735 a 712 or 715? Does it matter at this stage?
3. Is my 735 a A class or D class? Does it matter?
4. The HCL notes that the 735 has a 7100, so that part is ok.
5. Gecko or Dino? I don't have one pci-slots, so I guess it's no Dino, right?



Making 0927:
make mrproper
(no errors)

make config:

Gecko support (CONFIG_GECKO) [Y/n/?]
scripts/Configure: [: missing `]'
DINO PCI support (CONFIG_GECKO_DINO) [Y/n/?] n

make dep
(no errors)

make Image:
su-2.03$ make Image
make -C arch/parisc/boot Image
make[1]: Entering directory `/usr/local/linux/arch/parisc/boot'
gcc -g0 mkImage.c -o mkImage
make[1]: *** No rule to make target `../../../vmlinux', needed by `Image'.
Stop
.
make[1]: Leaving directory `/usr/local/linux/arch/parisc/boot'
make: *** [Image] Error 2


make vmlinux:
su-2.03$ make vmlinux
gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -o
scripts/split-include
scripts/split-include.c
scripts/split-include include/linux/autoconf.h include/config
gcc -D__KERNEL__ -I/usr/local/linux/include -Wall -Wstrict-prototypes -O2
-fomit
-frame-pointer -mdisable-fpregs -fwritable-strings  -fno-strict-aliasing
-pipe -
fno-strength-reduce  -c -o init/main.o init/main.c
init/main.c: In function `init':
init/main.c:1395: warning: implicit declaration of function `sys_dup'
gcc -D__KERNEL__ -I/usr/local/linux/include -Wall -Wstrict-prototypes -O2
-fomit
-frame-pointer -mdisable-fpregs -fwritable-strings  -fno-strict-aliasing
-pipe -
fno-strength-reduce -DUTS_MACHINE='"parisc"' -c -o init/version.o
init/version.c
make -C arch/parisc/boot ramdisk.o
make[1]: Entering directory `/usr/local/linux/arch/parisc/boot'
make[1]: *** No rule to make target `../../../ramdisk.bin', needed by
`ramdisk.c
'.  Stop.
make[1]: Leaving directory `/usr/local/linux/arch/parisc/boot'
make: *** [ramdisk.o] Error 2




Help?

-Simen, with an Apollo 735 Workstation, currently only counting cows.
(110KKeys/s)

--
"We do have a summer. Last year, I remember, it was a Wednesday" 
-Helga-Marie Johnesen, Norwegian citizen, TIME international.

GNUsig v0.9A R3
Support the GNUsig-project! Mail simen-tt@online.no for details.
