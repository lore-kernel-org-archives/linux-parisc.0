Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4346482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 09:23:28 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id RAA23405
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Sep 2001 17:23:27 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 2 Sep 2001 16:23:06 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010902162306.A9599@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SCSU -> SCSI typo fix
List-ID: <linux-parisc.vger.kernel.org>

very small part of my bootup-messages:

5. Raven+ w SE FWSCSI Core Centronics
6. Raven+ w SE FWSCSU Core Audio
7. Raven+ w SE FWSCSI Core PS/2 Port

SCSU?

--- arch/parisc/kernel/hardware.c       Fri Aug 31 12:02:30 2001
+++ arch/parisc/kernel/hardware-new.c   Sun Sep  2 16:18:09 2001
@@ -810,8 +810,8 @@
        {HPHW_FIO, 0x04E, 0x0007B, 0x0, "Kiji L2 132 Core Audio"},
        {HPHW_FIO, 0x050, 0x0007B, 0x0, "Merlin Jr 132 Core Audio"},
        {HPHW_FIO, 0x051, 0x0007B, 0x0, "Firehawk Audio"},
-       {HPHW_FIO, 0x056, 0x0007B, 0x0, "Raven+ w SE FWSCSU Core Audio"},
-       {HPHW_FIO, 0x057, 0x0007B, 0x0, "Raven+ w Diff FWSCSU Core Audio"},
+       {HPHW_FIO, 0x056, 0x0007B, 0x0, "Raven+ w SE FWSCSI Core Audio"},
+       {HPHW_FIO, 0x057, 0x0007B, 0x0, "Raven+ w Diff FWSCSI Core Audio"},
        {HPHW_FIO, 0x058, 0x0007B, 0x0, "FireHawk 200 Audio"},
        {HPHW_FIO, 0x05C, 0x0007B, 0x0, "SummitHawk 230 Core Audio"},
        {HPHW_FIO, 0x800, 0x0007B, 0x0, "Hitachi Tiny 64 Audio"},

Would it be nice to add help-texts to all the different parisc options
that currently have none? I'm trying some contructive messages for a
change :-)

Jurriaan
-- 
Never before have I encountered such corrupt and foul-minded
perversity!   Have you ever considered a career in the Church?
        Black Adder II
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.26 0.26 0.27
