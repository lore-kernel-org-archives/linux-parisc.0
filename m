Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from astra.telenet-ops.be (astra.telenet-ops.be [195.130.132.58])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F8F2482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jul 2003 03:59:29 -0600 (MDT)
From: "Mark Mestdagh" <Mark.Mestdagh@Icon-Europe.com>
To: "Matthew Wilcox" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 4 Jul 2003 12:01:44 +0200
Message-ID: <HOEDKHACIIOGKPMMFMCGIELFCOAA.Mark.Mestdagh@Icon-Europe.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030701132146.GD23597@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Kernel compilation for B2000
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

Hi

Seems I have the same problem on a B2000 with the latest cvs'ed version
(2.4.21-pa1)

What am I doing wrong :s??

Regs
Mark


drivers/ide/idedriver.o: In function `init_irq':
drivers/ide/idedriver.o(.text.init_irq+0x44): undefined reference to
`__save_and_cli'
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
drivers/ide/idedriver.o: In function `ide_spin_wait_hwgroup':
drivers/ide/idedriver.o(.text.ide_spin_wait_hwgroup+0x4c): undefined
reference to `local_irq_set'
drivers/ide/idedriver.o(.text.ide_cdrom_dump_status+0x38): more undefined
references to `local_irq_set' follow
make: *** [vmlinux] Error 1

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Matthew
Wilcox
Sent: dinsdag 1 juli 2003 15:22
To: Mark Mestdagh
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600


On Tue, Jul 01, 2003 at 10:10:24AM +0200, Mark Mestdagh wrote:
> Grant & others
>
> thanks already for the support. One little problem though is setting up
the
> CDROM. I followed the settings like the c3000 kernel but still I get a
> problem while compiling:
>
> drivers/ide/idedriver.o(.text.probe_hwif+0xfc): undefined reference to
> `local_irq_set'

This is 2.4.21-pa1?

--
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies.
Do you think I want to have an academic debate on this subject?" -- Robert
Fisk
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
