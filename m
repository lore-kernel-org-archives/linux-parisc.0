Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5982A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 04:46:50 -0600 (MDT)
Received: from weilbach (helo=localhost)
	by leo.uni-sw.gwdg.de with local-esmtp (Exim 3.16)
	id 15Wbih-0004vA-00
	for parisc-linux@lists.parisc-linux.org; Tue, 14 Aug 2001 12:46:47 +0200
Date: Tue, 14 Aug 2001 12:46:47 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de>
Message-ID: <Pine.LNX.4.33.0108141157560.12006-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Once more: JFS
List-ID: <linux-parisc.vger.kernel.org>

Hi again,

I gave it a new try with JFS on PA-RISC-Linux. I got kernel
2.4.7-pa2 (linux-20010810.tar.gz) and patched it with JFS 1.0.2.
Cross-compiling the kernel went well, but I had to use the native
PA-RISC-gcc to compile the utilities.

mkfs.jfs now works ok, as opposed to kernel 2.4.0-pa49, and I can
copy files to that partition, but fsck.jfs seems to have problems.
When checking on boot the following messages are written to dmesg:

fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e443
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf0050f at ip=0x0002e443
fsck.jfs(34): unaligned access to 0xfaf0058f at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf0058f at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf0058f at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf0058f at ip=0x0002e443
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e443
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e443
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e50b
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e517
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e533
fsck.jfs(34): unaligned access to 0xfaf004cf at ip=0x0002e443

And hundreds more similar errors when doing a manual fsck.jfs are
written to kern.log, and this check never finishes...

This time it seems to be a PA-RISC-Linux problem, as I recall
earlier problems with "unaligned access" messages.

Greetings,
	Peter.
