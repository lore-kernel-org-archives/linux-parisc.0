Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nikom.tagil.ru (nikom.tagil.ru [195.151.0.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 700A1482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 22:48:56 -0700 (MST)
Received: from pk.nikom.ru (localhost.localdomain [127.0.0.1])
	by nikom.tagil.ru (8.9.3/8.9.3) with ESMTP id KAA04138
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 10:48:54 +0500
Date: Tue, 13 Nov 2001 10:49:44 +0500
From: =?koi8-r?B?UGV0ZXIgS29s02hhbm92?= <pk@nikom.tagil.ru>
Reply-To: Peter Kolchanov <pk@nikom.tagil.ru>
Message-ID: <2451.011113@nikom.tagil.ru>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Subject: [parisc-linux] Problems of instaling (booting) on a 715/75
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello,

I have 9000/715/75.

1. I am instaling from CD (palinux-0.9.2.iso) I have this massage.
After my copm hang-up.

.........
Trying scsi.2.0
Boot path initialized
Attempting to load IPL

Hard booted.
palo ipl 0.92 oot@spqr Mon Jun 25 23:03:13 CEST 2001
0/vmlinux32 2853588 bytes @ 0x6ad6800
0/vmlinux64 3585851 bytes @ 0x6a8f800
0/ramdisk 1991209 bytes @ 0x70fb000

Command line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA8x16 TERM=linux

Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance: Firmware
does not support PDC_MODEl_CAPABILITIES call
32
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1606948 mediaptr 0x1000
Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
loading ramdisk 1991209 bytes @ 03e090000...
branching to kernel entry point 0x00100000
........


2. If I instaling from CD serial ver. (palinux-0.9-32serial.iso) then
I have this message:

.........
Trying scsi.2.0
Boot path initialized
Attempting to load IPL

IPL error: bad IPL checksum.
.....

Is this mortally?

-- 
Best regards,
 Peter                          mailto:pk@nikom.tagil.ru
