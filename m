Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA29163
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 Nov 1999 19:54:36 -0700
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id TAA14986
	for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 19:55:50 -0700 (MST)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id TAA14073 for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 19:55:50 -0700 (MST)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id TAA24869
	for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 19:55:49 -0700
Message-Id: <199911060255.TAA24869@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 05 Nov 1999 19:55:49 -0700
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] exec() problem
List-ID: <linux-parisc.vger.kernel.org>


This is rumored to be a known problem.  Since I've seen it a lot recently
and am going on vacation, here's what I know in case it helps.  The problem
can manifest on one machine and not another with the same bits.  It can
come and go as the size of code in arch/parisc/kernel changes.  The
problem shows in the boot like this:

    Attempting to execute '/sbin/init'

    PSW  : 0004000b  GR 1 : c0128800  GR 2 : c0029390  GR 3 : 00000000
    GR 4 : 00000000  GR 5 : ffffffff  GR 6 : 00000000  GR 7 : c0092708
    GR 8 : c0fdba20  GR 9 : c00924c8  GR10 : 00000080  GR11 : 0000000a
    GR12 : 00000000  GR13 : 00000000  GR14 : 00000001  GR15 : c00927c8
    GR16 : c0100000  GR17 : c00292e0  GR18 : c0092720  GR19 : 00000000
    GR20 : c0128a00  GR21 : a0000024  GR22 : 00000000  GR23 : c012bc7c
    GR24 : c00927c8  GR25 : 00000000  GR26 : c0092708  GR27 : c008e000
    GR28 : 00000000  GR29 : 00000000  GR30 : c0092a00  GR31 : c0039914
    SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000
    SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000
    IAOQ : c0028e5c c0028e60

    bad address a000002c (code 15)
    Kernel panic: bad address

adb on the IAOQ address says:

    do_generic_file_read+16C:       LDW             8(r21),r19

which is consistent with the value in r21 (a0000024).  This is
inside a call which I believe is called eventually from do_execve()
called within init/main.c:init().  I didn't track down do_execve().

	-Paul Bame
