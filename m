Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA30170
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Sep 1999 11:54:19 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA14454
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 13:55:38 -0400 (EDT)
Message-Id: <199909131753.KAA17721@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] $global$ undefined? 
In-reply-to: Your message of "Mon, 13 Sep 1999 19:01:09 PDT."
             <19990913190109.K10698@suse.de>
Date: Mon, 13 Sep 1999 10:53:37 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > grundler <438>type ld
> > ld is /linux/parisc-linux/bin/ld
> > grundler <439>ld --version
> > GNU ld 2.9.1
> 
> Use the HP/UX ld.

Sorry - I forgot about that in my Nth attempt at setting
up the GNU cross-env tools.

Different problem now.

grundler <402>mv /linux/parisc-linux/bin/ld /linux/parisc-linux/bin/ld.orig
grundler <403>type ld
ld is /bin/ld
...
grundler <406>make vmlinux
...
ld -R 0xc0010000 -N -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o init/main.o init/version.o ramdisk.o\
        arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a drivers/gecko/gecko.a  drivers/net/net.a drivers/pci/pci.a \
        /linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a /linux/linux/arch/parisc/lib/lib.a \
        -o vmlinux
ld: (Warning) Option "-N" ignored.  Non-shared text is not supported.
ld: Bad arch rev: 0
Fatal error.
make: *** [vmlinux] Error 1


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
