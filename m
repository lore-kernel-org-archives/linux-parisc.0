Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 86D9C482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 03:30:52 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux-cvs@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Date: Tue, 28 Aug 2001 11:30:05 +0200
References: <200108280922.DAA19668@puffin.external.hp.com>
In-Reply-To: <200108280922.DAA19668@puffin.external.hp.com>
Cc: nick@snowman.net, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <20010828093052.86D9C482B@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Mike,

I've just added your machine to the kernel hardware database, which should 
at least eliminate the following two "Unknown device" strings in the kernel log.

> Found devices:
> 1. Unknown device (4) at 0xf200c000, versions 0x3b, 0x0, 0x89, 0x0, 0x80
> 22. Unknown device (0) at 0xfffa0000, versions 0x59c, 0x0, 0x4, 0x0, 0x81


On Tuesday 28 August 2001 11:22, Helge Deller wrote:
> CVSROOT:	/home/cvs/parisc
> Module name:	linux
> Changes by:	deller	01/08/28 03:22:53
>
> Modified files:
> 	arch/parisc/kernel: hardware.c
>
> Log message:
> - add Raven U180 cpu and FW-SCSI entries to hardware-database
> acording to <nick@snowman.net>'s machine

Index: hardware.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/hardware.c,v
retrieving revision 1.22
diff -u -r1.22 hardware.c
--- hardware.c	2001/08/28 08:01:27	1.22
+++ hardware.c	2001/08/28 09:20:59
@@ -174,6 +174,7 @@
 	{HPHW_NPROC,0x59A,0x4,0x81,"Unlisted but reserved"},
 	{HPHW_NPROC,0x59B,0x4,0x81,"Raven U 160 (9000/780/C160)"},
 	{HPHW_NPROC,0x59D,0x4,0x81,"Raven U 200 (9000/780/C200)"},
+	{HPHW_NPROC,0x59C,0x4,0x81,"Raven U 180 (9000/780/C180)"},
 	{HPHW_NPROC,0x59E,0x4,0x91,"ThunderHawk T' 120"},
 	{HPHW_NPROC,0x59F,0x4,0x91,"Raven U 180+ (9000/780)"},
 	{HPHW_NPROC,0x5A0,0x4,0x81,"UL 1w T120 1MB/1MB (841/D260,D360)"},
@@ -340,6 +341,7 @@
 	{HPHW_A_DMA, 0x01F, 0x00089, 0x80, "SkyHawk 100/120 FW-SCSI"}, 
 	{HPHW_A_DMA, 0x027, 0x00089, 0x80, "Piranha 100 FW-SCSI"}, 
 	{HPHW_A_DMA, 0x032, 0x00089, 0x80, "Raven T' Core FW-SCSI"}, 
+	{HPHW_A_DMA, 0x03b, 0x00089, 0x80, "Raven U/L2 Core FW-SCSI"}, 
 	{HPHW_A_DMA, 0x03d, 0x00089, 0x80, "Merlin 160 Core FW-SCSI"},
 	{HPHW_A_DMA, 0x044, 0x00089, 0x80, "Mohawk Core FW-SCSI"}, 
 	{HPHW_A_DMA, 0x051, 0x00089, 0x80, "Firehawk FW-SCSI"}, 
