Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA17588
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Dec 1999 09:06:07 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id JAA17647
	for <parisc-linux@thepuffingroup.com>; Thu, 2 Dec 1999 09:08:00 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id JAA23304 for <parisc-linux@thepuffingroup.com>; Thu, 2 Dec 1999 09:07:59 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id JAA25205
	for <parisc-linux@thepuffingroup.com>; Thu, 2 Dec 1999 09:07:59 -0700
Message-Id: <199912021607.JAA25205@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Thu, 02 Dec 1999 09:07:58 -0700
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] 
List-ID: <linux-parisc.vger.kernel.org>

--------

If you touch Linux code which works in real addressing mode
(initial setup, interrupts before VM is enabled, PDC/IODC) please
read 'Embedded Real-Mode Executable in vmlinux'
at http://puffin.external.hp.com/~bame/ee.html
I have this working based on an old-ish set of code and
need to update it (maybe after the 2.3 merge).  IF YOU HAVE OBJECTIONS
or QUESTIONS please raise them soon.

I have attached the plusses and minuses part of the document here,
but it may not make sense out of context (or in context either :-)).

Thanks
	-Paul Bame

Good Qualities

   * Code which runs in real mode is quite separate from code which runs in
     virtual mode. One cannot by accident mix real/virtual code or data.
     This should improve maintainability and reduce surprises.
   * Real-mode code for setup, interrupt handling(*), and firmware
     (PDC/IODC) access, may be written in C, with no suprise failures caused
     by the whims of the C compiler and linker. This should improve
     maintainability too, and using C should make this code more accessable
     to non-assembly code wranglers.
     (*)Nitpicker note: the interrupt vector table will still probably be
     written in assembly, but the code it calls can be C.
   * Certain interrupt handlers may be best implemented in real mode (TLB
     miss?), and this provides an obvious place and method to do so (though
     needed access to the kernel page tables may recommend a virtual-mode
     TLB miss handler).
   * It is probably possible to eliminate some of the currently duplicated
     PDC code.
   * The scheme is independent of the address at which we relocate vmlinux.
     This is important since there are folks who want to relocate it to
     0xC000-0000, 0x8000-0000, and 0x0001-0000.

Bad Qualitites

   * It's different. Today's kernel coders will not be familiar with this
     scheme.
   * Much of the code available to the virtual kernel, such as printk,
     memcpy, and other common functions, is not available in real land
     unless it is copied. This may seem pretty bad, but we're already
     copying code under our current scheme (e.g., real/vsprintf.c) because
     of the limitations of PC-relative branches.
   * The vmlinux file is larger, since the real-mode BSS segment is fully
     expanded in realmode.S.
   * More thought/design is required when writing code which has both real
     and virtual portions. This is probably a benefit in disguise, but it
     may cause frustration during the turn-on period.
   * The convert program must be updated when we switch to ELF. Since the
     boot loader and the implementation of exec() will need to do the same,
     I don't consider this a big deal.
   * Once we convert to the embedded executable scheme, it will be
     inconvenient to go back, because it will entail small but widespread
     changes. This could be mitigated by using a CVS branch (and tag)
     perhaps.
   * The compiler's millicode library is duplicated.
