Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maile.telia.com (maile.telia.com [194.22.190.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 400CE4A19
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 15:36:15 -0700 (MST)
Received: from zaphod.halden.lillfab.se (t5o70p64.telia.com [195.67.239.64])
	by maile.telia.com (8.11.2/8.11.0) with ESMTP id f21MaCr09775
	for <parisc-linux@parisc-linux.org>; Thu, 1 Mar 2001 23:36:13 +0100 (CET)
Received: (from danne@localhost)
	by zaphod.halden.lillfab.se (8.9.3/8.9.3) id XAA12319
	for parisc-linux@parisc-linux.org; Thu, 1 Mar 2001 23:36:10 +0100
Message-Id: <200103012236.XAA12319@zaphod.halden.lillfab.se>
Date: Thu, 1 Mar 2001 23:36:10 +0100 (CET)
From: 5116@telia.com
Reply-To: 5116@telia.com
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
Subject: [parisc-linux] AHA-2742AT: happy noises...
List-ID: <linux-parisc.vger.kernel.org>

How about this?

[...]
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
SCSI subsystem driver Revision: 1.00
aic7xxx_detect
(scsi0) <Adaptec AHA-274X SCSI host adapter> found at EISA slot 1
(scsi0) Twin Channel, A SCSI ID 7, B SCSI ID 7, 4/255 SCBs
aic7xxx: Couldn't get consistent shared memory for SCB
aic7xxx: Couldn't get consistent shared memory for FIFO
(scsi0) Downloading sequencer code... 426 instructions downloaded
c01bb940 (aic7xxx?) called request_irq with an invalid irq 11
(scsi0) Couldn't register IRQ 11, ignoring controller.
[...]

Darn, I want those WAX interrupts...

/Daniel
-- 
