Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA25963
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Aug 2000 04:58:38 -0600
Received: from unknown (HELO rhirst.linuxcare.com) (158.43.17.94)
  by mailserv2.iuinc.com with SMTP; 8 Aug 2000 11:00:52 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6A0A8B005; Tue,  8 Aug 2000 12:01:02 +0100 (BST)
Date: Tue, 8 Aug 2000 12:01:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000808120102.A1107@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Zalon 53c720 support added
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have added support for 53c720, currently (ab)using the ncr53c8xx.c driver,
but it may have to split in to a seperate driver later.  Tested on a bluefish
card; I can run fast and wide, using tagged commands, and copy data between
two disks.  It crashes after a while, but then if I do the same with either
the 53c710 or 53c875 drivers a similar thing happens.  I'm busy with other
things for the next week or so, but I'll get back to it after that.

To enable it answer 'yes' to CONFIG_SCSI_ZALON.

Richard
