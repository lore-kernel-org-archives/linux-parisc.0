Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA16104
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Oct 1999 21:34:50 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id D047E32CDA
	for <parisc-linux@thepuffingroup.com>; Sun, 03 Oct 1999 03:35:17 +0000 (???)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id BC32367B1
	for <parisc-linux@thepuffingroup.com>; Sun,  3 Oct 1999 05:35:17 +0200 (MEST)
Date: Sun, 3 Oct 1999 05:35:17 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991003053517.J8946@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] my tree (Oct 03)
List-ID: <linux-parisc.vger.kernel.org>

Okay, most of my changes went into the cvs tree today, you can get the rest
at ftp://sunsite.auc.dk/pub/os/linux/parisc/patch-prumpf-19991003.gz 

Changes:

Makefile
	Conditionalize compiling GSC in as we do for other busses

arch/parisc/config.in
arch/parisc/defconfig
	New configuration menus.  Those seem much more logical to me

arch/parisc/kernel/Makefile
	updated to reflect removed/added files

arch/parisc/kernel/drivers.c
arch/parisc/kernel/inventory.c
	not yet in my tree (will be added as soon as I had a look at it)

arch/parisc/kernel/pci.c
include/asm-parisc/pci.h
	this is my version, not grant's that is in the CVS tree

arch/parisc/kernel/pdc.c
arch/parisc/kernel/real.S
include/asm-parisc/real.h
	new mechanism to call code in real-mode.  this doesn't work for some
	calls right now

include/asm-parisc/semaphore.h
include/asm-parisc/semaphore-helper.h
	almost correct semaphore operations

arch/parisc/kernel/setup.c
	removed CVS log (way too long and nobody would have read it anyway)
	removed old functions which I didn't like anyway
	removed get_cpuinfo as it isn't done the right way
	removed frame buffer code (I really hope it doesn't have to be done
		the way it was)

arch/parisc/kernel/traps.c
	clean-up

drivers/block/rd.c
	removed lots of printks

drivers/char/serial.c
	this is my original version, I haven't looked at the modifications
	close enough yet.
	
drivers/gecko/dino-prumpf.c
drivers/gecko/lasi-prumpf.c
	these are my versions, Lasi might be merged, Dino will probably not

drivers/gecko/gecko.c
	much of this code will disappear soon
	more GSC support functions

init/main.c
	most of my changes will go away



	Philipp Rumpf
