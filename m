Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe60.law14.hotmail.com [64.4.20.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4585E482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Mar 2001 06:59:28 -0700 (MST)
From: "Brian Stewart" <pdksh@hotmail.com>
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Date: Sat, 24 Mar 2001 08:58:11 -0500
MIME-Version: 1.0
Content-Type: text/plain;	charset="iso-8859-1"
Message-ID: <OE60stPGtPrPrvCWO6h00005419@hotmail.com>
Subject: [parisc-linux] Help with 710 Network Driver
List-ID: <linux-parisc.vger.kernel.org>

I am interested in trying to resolve some of the problems with the 710 with
its LAN and SCSI problems. I am not a Programming GURU but the re-write of
the LAN driver should not be too far beyond my abilities. I would appreciate
anyone's observations and details regarding the failure of the LAN drivers
on a 710 or 705.

My observations;
1) You can not compile the kernel (finial link fails) without
GSC/PCI/EISA/WAX support
  - 710/705 do not have any of the above features.
2) The LAN driver ./drivers/net/lasi_89586.c has links to ./asm/gsc.h
  - again there is no lasi or gsc support in the 710/705
3) The driver loads but has a message about "blindly" reading the PROM MAC
  - This does not appear to be "ideal" in the mind of the driver
4) The driver does not initialise its memory properly - message is posted at
boot
  - This again does not appear to be "ideal" in the mind of the driver
5) The Lan driver is actually working - sending TX during a BOOTP request
  - It is IMHO trying to talk to a "LASI" or "GSC" controller that does not
exist
    This sorta explains why it appears as if the wires were cut of the LAN
chip

I believe that if the LAN driver is corrected it would be a small jump to
address the broken SCSI driver. I have some logs of the failures but I am at
work right now and to make matters worse I will be on a business trip next
week, access to my mail but not my HP or logs.

If anyone is interested please let me know, This box is too much fun to
spend its time wasting away with mklinux installed.

Thank You

*************************************************
Brian Stewart
pdksh@hotmail.NO.SPAM.com
http://www3.sympatico.ca/trillian
*************************************************
