Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6591C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 06:52:12 -0700 (MST)
Received: from kabel209080 (kabel209080.kabel.utwente.nl [130.89.232.79])
          by netlx010.civ.utwente.nl (8.11.4/HKD) with SMTP id gBBDq4b02028
          for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 14:52:04 +0100
Message-ID: <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>
References: <20021211035731.GB9521@systemhalted> <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie> <20021211063321.GB10185@systemhalted>
Date: Wed, 11 Dec 2002 14:51:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] another kernel compilation error
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

I'm trying to compile a kernel, version 2.4.20-pa13. But I get the following
error:

ld -T /usr/src/linux-2.4.20-pa13/arch/parisc/vmlinux.lds
arch/parisc/kernel/hea
d.o  init/main.o init/version.o init/do_mounts.o \
--start-group \
arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o
arch/parisc/lib/lib.a
 arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o arch/parisc/hpux/hpux.o
kernel/
kernel.o mm/mm.o fs/fs.o ipc/ipc.o arch/parisc/kernel/init_task.o \
 drivers/char/char.o drivers/block/block.o drivers/misc/misc.o
drivers/net/net.o
 drivers/media/media.o drivers/scsi/scsidrv.o drivers/cdrom/driver.o
drivers/vid
eo/video.o drivers/gsc/gscbus.o arch/parisc/math-emu/math.o \
net/network.o \
`gcc -print-libgcc-file-name`
/usr/src/linux-2.4.20-pa13/arch/parisc/lib/lib.a /
usr/src/linux-2.4.20-pa13/lib/lib.a  \
        --end-group \
        -o vmlinux
ld: arch/parisc/kernel/kernel.o(.text.show_trace+0x58): fixing
R_PARISC_DPREL21L
ld: arch/parisc/kernel/kernel.o(.text.timer_interrupt+0x88): fixing
R_PARISC_DPR
EL21L
ld: arch/parisc/kernel/kernel.o(.text.timer_interrupt+0x94): fixing
R_PARISC_DPR
EL21L
drivers/char/char.o: In function `hp_diva_check':
drivers/char/char.o(.text.hp_diva_check+0x60): undefined reference to
`rs_interr
upt'
make: *** [vmlinux] Error 1

What am I doing wrong?

Greetings,
Tim
