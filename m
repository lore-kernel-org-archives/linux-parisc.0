Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kuolema.infodrom.north.de (kuolema.infodrom.north.de [217.89.86.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84FDF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 12:30:41 -0600 (MDT)
Received: from finlandia.infodrom.north.de (finlandia.Infodrom.North.DE [217.89.86.34])
	by kuolema.infodrom.north.de (Postfix) with ESMTP id 5F3454D759
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 20:30:23 +0200 (CEST)
Date: Thu, 28 Jun 2001 20:29:37 +0200
From: Torsten Neumann <torsten@imke.infodrom.ffis.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010628202937.A13724@imke.infodrom.ffis.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: torsten@imke.infodrom.north.de
Subject: [parisc-linux] Problems compiling LVM
List-ID: <linux-parisc.vger.kernel.org>

Hi,

the linux-lvm code was inspired by the hp-ux LVM. So I thougt it would be
real cool if the linux-lvm runs under hppa-linux.
Compiling the kernel with lvm support is no problem, the userspace tools
have some problems with gcc-3 (code uses #ifdef constructs in printf macro),
but then also compiles cleanly.

Now I want to create a VG but I only got the error message
imke kernel: pvcreate(188): unaligned access to 0x40067cf3 at ip=0x400310db
imke kernel: Not-handled unaligned insn 0x48350376
from the program pvcreate.
Could somebody tell what kind of problem this is. Is it a kernel problem or
a userspace problem ?
Is there a way to avoid this problem ?

  Torsten
