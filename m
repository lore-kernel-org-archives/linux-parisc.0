Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA30763
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 17:18:12 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id RAA12329
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 17:20:12 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id RAA01623 for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 17:20:10 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id RAA29273
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 17:20:10 -0700
Message-Id: <199912040020.RAA29273@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 03 Dec 1999 17:20:10 -0700
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] a pretty big change
List-ID: <linux-parisc.vger.kernel.org>


I just committed the changes to embed real-mode code in a separate
executable inside vmlinux.  It should cause no functional changes
in theory.  Read all about it in arch/parisc/real/README and
ee.html.  If you have terrible new problems,
I've attached a list of CVS commands to check out the files before I
started hacking on them.  I haven't seen a shell prompt from this
set of hacks so beware...

	-Paul Bame

prumpf- I moved kernel_thread and friends from
	real/<something> to kernel/head.S  I also re-enabled BTLB in
	real/setup.c so I could get further in the boot.  Left some
	debugging printks in the handle_real_interrupt handler too.

cvs update -r1.25 arch/parisc/Makefile
	cvs update -A arch/parisc/Makefile
cvs update -r1.28 arch/parisc/kernel/Makefile
	cvs update -A arch/parisc/kernel/Makefile
cvs update -r1.35 arch/parisc/kernel/head.S
	cvs update -A arch/parisc/kernel/head.S
cvs update -r1.39 arch/parisc/kernel/irq.c
	cvs update -A arch/parisc/kernel/irq.c
cvs update -r1.14 arch/parisc/kernel/pdc.c
	cvs update -A arch/parisc/kernel/pdc.c
cvs update -r1.25 arch/parisc/kernel/pdc_cons.c
	cvs update -A arch/parisc/kernel/pdc_cons.c
cvs update -r1.73 arch/parisc/kernel/setup.c
	cvs update -A arch/parisc/kernel/setup.c
cvs update -r1.11 arch/parisc/kernel/traps.c
	cvs update -A arch/parisc/kernel/traps.c
cvs update -r1.2 arch/parisc/real/Makefile
	cvs update -A arch/parisc/real/Makefile
cvs update -r1.2 arch/parisc/real/head.S
	cvs update -A arch/parisc/real/head.S
cvs update -r1.2 arch/parisc/real/interruption.S
	cvs update -A arch/parisc/real/interruption.S
cvs update -r1.2 arch/parisc/real/lib.c
	cvs update -A arch/parisc/real/lib.c
cvs update -r1.2 arch/parisc/real/pdc.c
	cvs update -A arch/parisc/real/pdc.c
cvs update -r1.2 arch/parisc/real/real.h
	cvs update -A arch/parisc/real/real.h
cvs update -r1.2 arch/parisc/real/real_s.S
	cvs update -A arch/parisc/real/real_s.S
cvs update -r1.2 arch/parisc/real/setup.c
	cvs update -A arch/parisc/real/setup.c
cvs update -r1.1 arch/parisc/real/traps.c
	cvs update -A arch/parisc/real/traps.c
cvs update -r1.1 include/asm-parisc/real.h
	cvs update -A include/asm-parisc/real.h
