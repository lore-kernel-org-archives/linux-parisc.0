Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA04176
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jan 2000 07:33:28 -0700
Received: from venus (venus.esiee.fr [147.215.20.10])
	by mail.esiee.fr (Postfix) with SMTP id 8589357321
	for <parisc-linux@thepuffingroup.com>; Tue,  4 Jan 2000 15:36:12 +0100 (CET)
Message-ID: <007101bf56c1$0c5a13d0$0a14d793@esiee.fr>
From: "Thierry SIMONNET" <t.simonnet@esiee.fr>
To: <parisc-linux@thepuffingroup.com>
Date: Tue, 4 Jan 2000 15:36:12 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Trouble to generate vmlinux
List-ID: <linux-parisc.vger.kernel.org>

I work on a HP712/60 workstation under HPUX 10.20.
I compile with cc, gcc or aCC.

I can't generate vmlinux; I have some Unsatisfied symbols :

......

parisc-linux-ld -R 0xc0010000 -N -e '$START$' arch/parisc/real/realexe.o
arch/parisc/kernel/init_task.o init/main.o init/version.o \
       arch/parisc/boot/ramdisk.o arch/parisc/kernel/kernel.o
arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
       fs/filesystems.a \
       net/network.a \
       drivers/block/block.a drivers/gsc/gsc.a drivers/char/char.a
drivers/net/net.a drivers/pci/pci.a \
       /linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a
/linux/linux/arch/parisc/lib/lib.a \
       -o vmlinux
parisc-linux-ld: Unsatisfied symbols:
   _R_iodc_cons_call (code)
   _R_fault_vector (code)
   _R_pdc_call (code)
make[1]: *** [vmlinux-real] Error 1
make[1]: Leaving directory `/linux/linux'
make: *** [vmlinux] Error 2

I try to modify convert.c without success.

Could you help me?

Thanks

=========================================================
Thierry SIMONNET
Responsable du Service des Moyens Informatiques Généraux
Groupe ESIEE - CCIP
Cité Descartes - BP 99 - 2 Bd Blaise Pascal
93162 NOISY le Grand cedex
tel: 01 45 92 66 24  fax: 01 45 92 67 99 e-mail:  t.simonnet@esiee.fr
=========================================================
