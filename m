Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C52C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 18:16:23 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0N1SwT27092
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 17:28:58 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0N1JLC23830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 17:19:21 -0800
Date: Wed, 22 Jan 2003 17:19:21 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0301221718210.21999-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Kernel 2.4.20 help?
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

I've been playing with the 2.4.20 on my box {debian 3.0 parisc}
I've found a few problems, tried a couple of fixes and got chewed out by a
kernel deveolper so I saw you mentioned on the debian site and thought I
should ask you.

What I get is this:
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer
-D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7200   -nostdinc -iwithprefix include
-DKBUILD_BASENAME=scsi_merge  -c -o scsi_merge.o scsi_merge.c
scsi_merge.c: In function `__count_segments':
scsi_merge.c:226: warning: implicit declaration of function `page_to_phys'
scsi_merge.c: In function `initialize_merge_fn':
scsi_merge.c:1199: `PCI_DMA_BUS_IS_PHYS' undeclared (first use in this
function)scsi_merge.c:1199: (Each undeclared identifier is reported only
once
scsi_merge.c:1199: for each function it appears in.)
make[3]: *** [scsi_merge.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.20/drivers/scsi'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/scsi'
make[1]: *** [_subdir_scsi] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20/drivers'
make: *** [_dir_drivers] Error 2

What I did first to fix it was add:
#ifndef PCI_DMA_BUS_IS_PHYS
#define PCI_DMA_BUS_IS_PHYS 1
#endif

I asked the linux-scsi list if that was the proper fix and promptly got
yelled at.  I was told the problem was that asm/pci.h was not included and
that was the fix I should use.  Even though the defines would work...

So I reverted the code back and added the include, now I get the original
error and nothing seems to be resolved.

After adding my defines back I still get errors, just much farther along:
trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer
-D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7200   -nostdinc -iwithprefix include -DKBUILD_BASENAME=traps
-c -o traps.o traps.c
traps.c:125: conflicting types for `dump_stack'
/usr/src/linux-2.4.20/include/linux/kernel.h:111: previous declaration of
`dump_stack'
make[1]: *** [traps.o] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.20/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2

Um, help?
