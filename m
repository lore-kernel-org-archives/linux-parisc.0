Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 857AB4848
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 06:41:09 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id OAA13963 for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 14:41:08 +0200 (MET DST)
Message-Id: <sb8bacbe.020@ms-zrt1>
Date: Tue, 28 Aug 2001 14:31:48 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <makurc@cooperstandard.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Betr.: RE: [parisc-linux] visualize C360/785 install
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>I've problems booting it from cd.
>Here is what I get
>
>HARD Booted.
>palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
>.........
>
>Kernel: partition 0 file /vmlinux
>Ramdisk: partition 0 file /ramdisk
>Warning: kernel name doesn't end with 32 or 64... Guessing 32
>ELF32 executable
>Entry 00100000 first 00100000 n 4
>Segment 0 load 00100000 size 1606948 mediaptr 0x1000
>Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
>Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
>Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
>Loading ramdisk 1991209 bytes @ 3fe09000...
>branching to kernel entry point 0x00100000
>Set default PSW W bit to 0
>
I have exactly the same problem with my C200, so you could look
op the thread 'Is a C200+ currently supported' where Brad tells
me to use the serial console, and why. I haven't yet gotten my
serial console to work, I have reason to believe I have a 1:1
serial cable, while I should have gotten an interlink cable.
The last message was send yesterday, so it isn't old yet.

Wether or not I need to set some options in the boot menu or
just have to unplug keyboard/mouse/monitor to get the serial
console is yet an open question.

Good luck,
Jurriaan
