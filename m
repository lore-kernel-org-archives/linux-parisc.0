Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7AF4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jul 2001 04:51:37 -0600 (MDT)
Date: Tue, 3 Jul 2001 12:51:27 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: <jfs-discussion@oss.software.ibm.com>
Cc: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20010702180851.A19547@nickel.kgarner.com>
Message-ID: <Pine.LNX.4.33.0107031224210.15161-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] JFS on PA-RISC-Linux
List-ID: <linux-parisc.vger.kernel.org>

Hi!

Did anyone try JFS on other architectures than iX86 (the 1.0.0
announcement did only restrict it to 2.4.X :-) )? I wanted to test
on PA-RISC-Linux today, and the patched kernel and the utilities
compiled OK (Kernel calls itself 2.4.0-pa49 #1), but when trying to
create a JFS partition with mkfs.jfs I either get

	mkfs.jfs development version: $Name: v1_0_0 $

	Warning!  All data on device /dev/sdb1 will be lost!

	Continue? (Y/N) Y
	  |
	Bus error

or

        mkfs.jfs development version: $Name: v1_0_0 $

        Warning!  All data on device /dev/sdb1 will be lost!

        Continue? (Y/N) Y
	<4>mkfs.jfs(379): unaligned access to 0x00035245 at ip=0x000137af
	Not-handled unaligned insn 0x4a740108
	Unaligned handler failed, ret = -1

(optionally without <4> or with Bus error)

Is it JFS's fault or that of the PA-RISC-Linux port? The messages do
not seem to be from mkfs.jfs, as I did not find anything like that
in its source. Is it too early to try things like this?

Peter.
