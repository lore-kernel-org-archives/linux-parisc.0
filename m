Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03256
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 08:33:19 -0700
Message-ID: <20000229143417.6180.qmail@web507.mail.yahoo.com>
Date: Tue, 29 Feb 2000 06:34:16 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] make Image fails
List-ID: <linux-parisc.vger.kernel.org>

Building the cvs version 20000227 with defconfig fails
with unsatified symbol __cmpdi2.

ld -R 0xc0100000 -N -e stext arch/parisc/real/head.o
arch/parisc/kernel/init_task0.o init/main.o
init/version.o \
        arch/parisc/boot/ramdisk.o
arch/parisc/kernel/kernel.o arch/parisc/real/real.o
arch/parisc/mm/mm.o arch/parisc/hpux/hpux.o
kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
        drivers/block/block.a drivers/char/char.o
drivers/net/net.o drivers/pci/pci.a drivers/gsc/gsc.a
\
        net/network.a \
        /usr/src/linux-2.3/arch/parisc/lib/lib.a
/usr/src/linux-2.3/lib/lib.a
/usr/src/linux-2.3/arch/parisc/lib/lib.a \
        -o vmlinux
ld: Unsatisfied symbols:
   __cmpdi2 (code)
make[1]: *** [vmlinux-real] Error 1
make[1]: Leaving directory `/usr/src/linux-2.3'
make: *** [vmlinux] Error 2

I did not find any reference in the source code.
Grepping through object files as well finds a
reference in arch/parisc/hpux/fs.o and hpux.o.

Any ideas ?
Ulrich
__________________________________________________
Do You Yahoo!?
Talk to your friends online with Yahoo! Messenger.
http://im.yahoo.com
