Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA12112
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 19:55:15 -0700
Received: from mcn.net (cjohnson@cj-solutions.com [192.168.0.10])
	by cjs01.cj-solutions.com (8.9.3/8.9.3) with ESMTP id TAA09370
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Dec 1999 19:47:21 -0100
Sender: cjohnson@cj-solutions.com
Message-ID: <38458959.9307D971@mcn.net>
Date: Wed, 01 Dec 1999 19:47:21 -0100
From: Carl Johnson <cjs@mcn.net>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting on J200
List-ID: <linux-parisc.vger.kernel.org>

I have built my own kernels and modified them some, but have also
used the prebuilt kernels, I have had no success figuring out
what hangs the kernel but anyhow, I will tell of my testing
of the 1999-10-19 and 1999-11-13. And Hopefully I will
recieve some help, _TIA_

--
1999-10-19: Hangs at transfering control to kernel

--
1999-11-13: Hnags after:

Transfering control to kernel. (At entry point 0x00010000)
kernel(0x00148C80, 0x00504010, 0x00148C80, 0x00016640)
Clear BSS 0x0011B048 --> 0x0013D384
Boot Loader: PA/Linux, maybe PALO
real_mode setup exiting

--
1999-11-17 CVS snapshot with some of my own modif. to try to solve
the hanging at real_mode.

__Will not build__

-- 
Carl Johnson
