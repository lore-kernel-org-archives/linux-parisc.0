Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from apate.telenet-ops.be (apate.telenet-ops.be [195.130.132.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74BE0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 02:08:13 -0600 (MDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by apate.telenet-ops.be (Postfix) with SMTP id 6736738213
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 10:08:12 +0200 (MEST)
Received: from iconbemewin01 (D576CE1B.kabel.telenet.be [213.118.206.27])
	by apate.telenet-ops.be (Postfix) with SMTP id 031C838340
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 10:08:12 +0200 (MEST)
From: "Mark Mestdagh" <Mark.Mestdagh@Icon-Europe.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Kernel compilation for J5600
Date: Tue, 1 Jul 2003 10:10:24 +0200
Message-ID: <HOEDKHACIIOGKPMMFMCGKEKDCOAA.Mark.Mestdagh@Icon-Europe.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030630165053.GF14971@dsl2.external.hp.com>
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

Grant & others

thanks already for the support. One little problem though is setting up the
CDROM. I followed the settings like the c3000 kernel but still I get a
problem while compiling:

ld: arch/parisc/kernel/kernel.o(.text.show_trace+0x58): fixing
R_PARISC_DPREL21L
drivers/ide/idedriver.o: In function `.L1588':
drivers/ide/idedriver.o(.text.probe_hwif+0xfc): undefined reference to
`local_irq_set'
drivers/ide/idedriver.o: In function `ide_wait_stat':
drivers/ide/idedriver.o(.text.ide_wait_stat+0xe0): undefined reference to
`local_irq_set'
drivers/ide/idedriver.o: In function `ide_config_drive_speed':
drivers/ide/idedriver.o(.text.ide_config_drive_speed+0x1c0): undefined
reference to `local_irq_set'
drivers/ide/idedriver.o: In function `taskfile_dump_status':
drivers/ide/idedriver.o(.text.taskfile_dump_status+0x40): undefined
reference to `local_irq_set'
drivers/ide/idedriver.o: In function `ide_dump_status':
drivers/ide/idedriver.o(.text.ide_dump_status+0x40): undefined reference to
`local_irq_set'
drivers/ide/idedriver.o(.text.ide_spin_wait_hwgroup+0x74): more undefined
references to `local_irq_set' follow
make: *** [vmlinux] Error 1

local_irq_set missing? ;) Hints & tips appriciated.

Thx
Mark


-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Grant
Grundler
Sent: maandag 30 juni 2003 18:51
To: Mark Mestdagh
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600


On Sun, Jun 29, 2003 at 11:30:26PM -0700, Randolph Chung wrote:
> Why can't you use the prebuilt kernels? kernel-image-2.4.20-32-smp
> supports SMP (and the corresponding 64-bit version too...)

just a reminder...64-bit SMP is not stable yet.
32-bit SMP seems to work fine.

And I park a few "custom" kernels on ftp.parisc-linux.org/kernels/
which include the .config files used to build the kernels.
You want to look at c3000 kernels.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
