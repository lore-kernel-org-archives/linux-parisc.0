Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA18730
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Sep 1999 17:54:03 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37D4510D.B206030E@uswest.net>
Date: Mon, 06 Sep 1999 17:41:01 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linker question....
List-ID: <linux-parisc.vger.kernel.org>

Ok,

I've almost got the linux kernel to build on my linux box using the
cross-compiler rpms bits from puffin.external.hp.com.

I've  spent a good portion of the day searching the archives on how to
address this problem, and the theme I've discovered is the kernel needs
to be compiled/linked under HP-UX?

I just wanted to verify this assertion before I installed the tools on
the C200.

Thanks,
-Ryan


PS.  This is the error I get using the egcs cross-compiler.
------------------------------------

parisc-linux-ld -R 0xc0010000 -N -e stext arch/parisc/kernel/head.o
arch/parisc/kernel/init_task.o init/main.o init/version.o ramdisk.o\
 arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o
fs/fs.o ipc/ipc.o \
 fs/filesystems.a \
 net/network.a \
 drivers/block/block.a drivers/char/char.a drivers/gecko/gecko.a
drivers/net/net.a drivers/pci/pci.a \
/home/rbrad/source/linux/arch/parisc/lib/lib.a
/home/rbrad/source/linux/lib/lib.a
/home/rbrad/source/linux/arch/parisc/lib/lib.a \
 -o vmlinux
arch/parisc/kernel/kernel.o: In function `pdc_add_valid':
arch/parisc/kernel/kernel.o($CODE$+0x26f8): undefined reference to
`$global$'
gmake: *** [vmlinux] Error 1
[rbrad@beavis linux]$
