Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ehlo.com (mail.ehlo.com [208.185.90.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8936D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 May 2001 07:51:22 -0600 (MDT)
Received: from james by mail.ehlo.com with local (Exim 3.22 #1)
	id 153eTM-000A7A-00
	for parisc-linux@lists.parisc-linux.org; Sat, 26 May 2001 09:51:16 -0400
Date: Sat, 26 May 2001 09:51:16 -0400
From: James FitzGibbon <james@ehlo.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010526095116.A38860@ehlo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Install CD causes reboot on 712/80
List-ID: <linux-parisc.vger.kernel.org>

I'm new to PARISC-Linux.  I've had a 712/80 sitting around for a few years
and thought I'd give it a go.  Using the palinux-0.6.1-32STI.iso image, I
burned a CD and attempted to install.

The boot process in and of itself went fine.  The kernel came up, reported
all of the devices that are shown for this model in the hardware database. 
After init entered runlevel 2, the message "Setting up /tmp and /var/log
ramdisks" was displayed.  About 5 seconds after that, the system rebooted.

I've tried futzing around with the SCSI ids with no luck.  Does anyone have
an idea or procedure I can try to get around this or find out more
information as to why it's happening?

I'm going to try the 0.6 image as well as the serial console one in the
meantime (I have firmware 2.3, so I should be OK to go back and forth).

Thanks.

-- 
j.
