Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA07306
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 12:07:23 -0700
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.9.3/8.9.3) id OAA04637
	for parisc-linux@thepuffingroup.com; Tue, 16 Nov 1999 14:08:57 -0500 (EST)
Message-Id: <199911161908.OAA04637@hiauly1.hia.nrc.ca>
To: parisc-linux@thepuffingroup.com
Date: Tue, 16 Nov 1999 14:08:56 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Trivial Makefile Bug
List-ID: <linux-parisc.vger.kernel.org>

This has been around for awhile.

ld -R 0xc0010000 -N -e stext arch/parisc/real/head.o arch/parisc/kernel/init_task.o init/main.o init/version.o \
        arch/parisc/boot/ramdisk.o arch/parisc/kernel/kernel.o arch/parisc/real/real.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
	fs/filesystems.a \
	net/network.a \
	drivers/block/block.a drivers/gsc/gsc.a drivers/char/char.a  drivers/net/net.a drivers/pci/pci.a \
	/ehic/a/pa/linux/arch/parisc/lib/lib.a /ehic/a/pa/linux/lib/lib.a /ehic/a/pa/linux/arch/parisc/lib/lib.a \
	-o vmlinux
If this fails, you're not using GNU nm!
Make sure you have it in your path before HPUX nm.
nm --version > /dev/null 2>&1
nm -td vmlinux |awk '/init_task_union/ { n = int(); t = int(n/8192); t *= 8192; if (t >= n) printf t-n ; else printf n-(t-8192)}' FS=\| > init_task.alignment
awk: cmd. line:1: fatal: int() cannot have 0 arguments
make[1]: *** [vmlinux-real] Error 2
make[1]: Leaving directory `/ehic/a/pa/linux'
make: *** [vmlinux] Error 2

I believe that the argument of int in the awk script needs to be changed
to "$$1".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
