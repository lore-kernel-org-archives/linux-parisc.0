Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id E261E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 07:00:57 -0700 (MST)
Received: from kabel209080 (kabel209080.kabel.utwente.nl [130.89.232.79])
          by netlx010.civ.utwente.nl (8.11.4/HKD) with SMTP id gB9E0pk20402
          for <parisc-linux@lists.parisc-linux.org>; Mon, 9 Dec 2002 13:00:51 -0100
Message-ID: <000b01c29f8b$554745c0$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 9 Dec 2002 15:00:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] kernel compilation error
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

I'm trying to compile a kernel on a 712/80, but I get the following error
when I do 'make vmlinux':

scsi_merge.c: In function `__count_segments':
scsi_merge.c:225: warning: implicit declaration of function `page_to_phys'
scsi_merge.c: In function `initialize_merge_fn':
scsi_merge.c:1198: `PCI_DMA_BUS_IS_PHYS' undeclared (first use in this
function)
scsi_merge.c:1198: (Each undeclared identifier is reported only once
scsi_merge.c:1198: for each function it appears in.)
make[3]: *** [scsi_merge.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/scsi'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/scsi'
make[1]: *** [_subdir_scsi] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20/drivers'
make: *** [_dir_drivers] Error 2

Does anyone know what I'm doing wrong?

Greetings,
Tim
