Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from silly.cloud.net.au (co3002322-a.eburwd1.vic.optushome.com.au [203.164.64.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C9FD4842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 08:13:59 -0600 (MDT)
Date: Fri, 28 Sep 2001 00:13:54 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010928001354.A1519@silly.cloud.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] FW SCSI on the D350
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I'm trying to install the 0.9 release on a D350 server. The kernel
recognises the standard SCSI, using the lasi7xxx driver, and finds
the tape drive and the CD-ROM on that host. However, it doesn't
find the Bluefish fast/wide SCSI host, so it doesn't find the
four internal hard disks, which makes installation a little tough.

The boot-up firmware recognises all of the disks OK, but the Bluefish
is just not included in the device list shown at startup/dmesg.

I'll try the 0.9.2 release tomorrow. Any other things I can do
which might help?


thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
