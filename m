Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5720F4A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Feb 2001 06:28:46 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA15961
	for <parisc-linux@puffin.external.hp.com>; Sat, 3 Feb 2001 06:24:33 -0700
Received: from localhost (1983 bytes) by fileserv2.Cologne.DE
	via rmail with P:stdio/R:bind/T:smtp
	(sender: <excalibur.cologne.de!karsten>) (ident <excalibur.cologne.de!karsten> using unix)
	id <m14P2k0-0007EuC@fileserv2.Cologne.DE>
	for <parisc-linux@thepuffingroup.com>; Sat, 3 Feb 2001 14:28:36 +0100 (CET)
	(Smail-3.2.0.101 1997-Dec-17 #5 built 1998-Jan-19)
Received: (from karsten@localhost)
	by excalibur.cologne.de (8.9.3/8.8.7) id OAA11553
	for parisc-linux@thepuffingroup.com; Sat, 3 Feb 2001 14:06:17 +0100
Date: Sat, 3 Feb 2001 14:06:17 +0100
From: Karsten Merker <karsten@excalibur.cologne.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010203140617.A11455@excalibur.cologne.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: excalibur.cologne.de!karsten@Cologne.DE
Subject: [parisc-linux] Type declaration missing
List-ID: <linux-parisc.vger.kernel.org>

Hallo everyone,

I have just tried to compile the current cvs-snapshot (Sat Feb 3 11:27:29
CET 2001) with support for smbfs. The result:

[cwd is fs/smbfs]
hppa-linux-gcc -D__KERNEL__
-I/mnt/filebase/builds/parisc-20010203/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing
-D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mschedule=7200 -mdisable-fpregs
-fno-strict-aliasing -ffunction-sections  -DSMBFS_PARANOIA  -c -o ioctl.o
ioctl.c
ioctl.c: In function `smb_ioctl':
ioctl.c:31: `__kernel_old_uid_t' undeclared (first use in this function)
ioctl.c:31: (Each undeclared identifier is reported only once
ioctl.c:31: for each function it appears in.)
make[3]: *** [ioctl.o] Fehler 1

In fact __kernel_old_uid_t is not declared for the hppa-architecture. The
declaration should be in include/asm-parisc/posix_types.h, I am just
unsure what the correct declaration looks like. Has hppa-linux always been
using 32Bit UIDs? If yes, __kernel_old_uid_t should be defined to be the
same as __kernel_uid_t, or am I missing something here?

Greetings,
Karsten
-- 
#include <standard_disclaimer>
Nach Paragraph 28 Abs. 3 Bundesdatenschutzgesetz widerspreche ich der Nutzung
oder Uebermittlung meiner Daten fuer Werbezwecke oder fuer die Markt- oder
Meinungsforschung.
