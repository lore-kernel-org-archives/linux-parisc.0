Return-Path: <JKonrad@linotype.com>
Received: from mail.linotype.com (okakura.linotypelibrary.com [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 177724854
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 08:10:20 -0600 (MDT)
Received: from www.fonts.de (bhonet00003.fonts.de [193.103.125.42])
	by mail.linotype.com (Linotype Mail System) with ESMTP id 5F48FB412C
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 16:10:18 +0200 (CEST)
Received: from domino001.fonts.de (domino001.fonts.de [193.103.125.36])
	by www.fonts.de (Linotype Mail System) with ESMTP id 68A744C0AB
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 16:10:15 +0200 (CEST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OFEE32CD13.5A2A6DCE-ONC1256E82.004D2D75@fonts.de>
From: JKonrad@linotype.com
Date: Mon, 26 Apr 2004 16:08:58 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in kernel 2.4.23 concerning use of SCSI
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

using kernel 2.4.23-pa3, which I downloaded from http://parisc-linux.org/~rbrad/vmlinux-2.4.23-pa3.bz2 because I needed MUX support.

Machine is a HP K-200 with three CPUs (although, since this is not an smp kernel, should not be important);

I have a 50 GB SCSI-drive attached to SCSI1 (the Low Voltage Controller where the CD-Rom is attached to); Whenever I try to format the partition (50GB, the whole disk) I get the following:

> Writing superblocks and filesystem accounting information: scsi1 (0:0)
> Target is suffering from tag starvation.
> SCSI disk error : host 1 channel 0 id 0 lun 0 return code = 8
> I/O error: dev 08:41, sector 34078720
> SCSI disk error : host 1 channel 0 id 0 lun 0 return code = 8
> I/O error: dev 08:41, sector 34078722
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 7c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 c4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 ac 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 10 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 9c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 80 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 c4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 ac 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 10 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 9c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 80 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 02 04 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 01 d0 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 01 fc 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 02 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 8c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 f4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants device reset
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants BUS reset, cmd 21e46e00
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1: Bus Reset detected, executing command 00000000, slot 00000000,
> dsp 001704a8[04a8]
> failing command because of reset, slot 21e88654, cmnd 21e46e00
> failing command because of reset, slot 21e88788, cmnd 21e47e00
> failing command because of reset, slot 21e888bc, cmnd 21e47800
> failing command because of reset, slot 21e889f0, cmnd 21e46200
> failing command because of reset, slot 21e88b24, cmnd 21e46000
> failing command because of reset, slot 21e88c58, cmnd 21e46400
> failing command because of reset, slot 21e88d8c, cmnd 21e46600
> failing command because of reset, slot 21e88ec0, cmnd 21e46a00
> failing command because of reset, slot 21e88ff4, cmnd 21e47c00
> failing command because of reset, slot 21e89128, cmnd 21e47a00
> failing command because of reset, slot 21e8925c, cmnd 21e47600
> failing command because of reset, slot 21e894c4, cmnd 21e47400
> failing command because of reset, slot 21e895f8, cmnd 21e47200
> failing command because of reset, slot 21e8972c, cmnd 21e47000
>
> Stack Dump:
> 21e90740:  0004ff0e 00000000 21e90670 21e90650
> 21e90730:  00000000 10228630 00000000 21e90000
> 21e90720:  00000000 00000000 00000000 21e90000
> 21e90710:  00000001 00000002 21f36000 00000002
> 21e90700:  21f3c040 1006c000 103aa010 103aa010
> 21e906f0:  1032b010 1020e448 103cd000 00000001
>
> Kernel addresses on the stack:

> Kernel Fault: Code=26 regs=21e90740 (Addr=00000048)
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001110 Not tainted
> r00-03  00000000 103ebab8 10228630 21e8972c
> r04-07  21e46e00 1020de94 21f60400 00002000
> r08-11  000003e8 0000ffff 00002000 00001000
> r12-15  00001002 21f61ea0 000000fd f0100000
> r16-19  f0000fe0 f0000074 f000006c 00000080
> r20-23  00000000 21e889f0 10065860 00000000
> r24-27  00000000 00000000 21f60404 10316010
> r28-31  21f60404 10326c00 21e90740 1020e51c
> sr0-3   00000000 00000003 00000000 00000003
> sr4-7   00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 102286bc 102286c0
> IIR: 4a930090    ISR: 00000000  IOR: 00000048
> CPU:        0   CR30: 21e90000 CR31: 103d8000
> ORIG_R28: 00000000

Then the machine freezes, I need to reboot. When I make a partition with 40GB and format it, I get an error message very much the same, but I get a prompt and can continue to work. When I use a
partition of 30GB, it works. What seems to be the problem here?

Greets,

Jay
