Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59E09482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 16:08:38 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1DF90B00C; Mon,  8 Oct 2001 23:09:49 +0100 (BST)
Date: Mon, 8 Oct 2001 23:09:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011008230949.U11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I've just added a new scsi driver for 53c700 and 53c710 chips to cvs.
This driver was written by James Bottomley for MCA machines, and has
been enhanced to support parisc as well.  It is intended that the
previous driver, sim700.c, will be removed once we are happy with
the new one.  The new one is 53c700.* plus lasi700.*.  I have left
the old driver in the source for the time being, but have commented out
its config question in drivers/scsi/Config.in. The CONFIG_ flag has
changed from CONFIG_SCSI_LASI to CONFIG_SCSI_LASI700.
You should certainly do at least a 'make oldconfig' once you pick up
these changes.

The main improvements in this driver are sync transfers (where the scsi
chip allows it) and tagged commands.  Also disconenct/reselect works
properly, so there is no longer any need to boot with sim700=nodisc:0xff
(or similar).

James and I have tested the driver on 712, 715/50, 715/75, B180, and
C360.  I have tested C360 with 32 and 64 bit kernels.

Please test this new drvier with your hardware and report back, if
I don't hear anything bad, the old driver will be removed.

Thanks,
  Richard
