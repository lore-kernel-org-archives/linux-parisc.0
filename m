Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp800.mail.sc5.yahoo.com (smtp800.mail.sc5.yahoo.com [66.163.168.179])
	by dsl2.external.hp.com (Postfix) with SMTP id 329CD4875
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 13:52:05 -0700 (MST)
Message-ID: <3FCE5AAE.6080104@ameritech.net>
Date: Wed, 03 Dec 2003 16:50:38 -0500
From: northern snowfall <dbailey27@ameritech.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] 2.4.23 PCI source inconsistency
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

Hey all,
    I compiled 2.4.23 from kernel.org for 32bit PA-RISC today
and found that the PA-RISC specific PCI code seems to be out-
of sync with the generic pci code.

from arch/parisc/kernel/pci.c:

gcc -D__KERNEL__ -I/usr/home/north_/k/linux-2.4.23/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common 
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce 
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs 
-ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -iwithprefix 
include -DKBUILD_BASENAME=pci  -c -o pci.o pci.c
pci.c: In function `pcibios_init_bus':
pci.c:310: structure has no member named `bridge_ctl'
pci.c:311: structure has no member named `bridge_ctl'
pci.c:312: structure has no member named `bridge_ctl'
pci.c:315: structure has no member named `bridge_ctl'
make[1]: *** [pci.o] Error 1

Of course, the pci_bus structure is declared in the header
include/linux/pci.h:/^struct.*pci_bus However, there is
no longer a bridge_ctl member.

I'm running 2.4.17 off the Debian 3.0 release on a B2000,
and /usr/include/linux/pci.h still has the bridge_ctl
member in the pci_bus structure.

Advice?

Thanks,
Don (north_)
