Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA24639
	for <parisc-linux@puffin.external.hp.com>; Sun, 6 Feb 2000 07:48:13 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12HS0D-0027WpC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sun, 6 Feb 2000 14:45:25 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Received: (from tsbogend@localhost)
	by alpha.franken.de (8.8.7/8.8.5) id OAA00878
	for parisc-linux@thepuffingroup.com; Sun, 6 Feb 2000 14:38:06 +0100
Date: Sun, 6 Feb 2000 14:38:06 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000206143806.A871@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Merge with 2.3-current
List-ID: <linux-parisc.vger.kernel.org>

Hi,

in our IRC meeting on friday we had a little discussion whether to merge
with a more recent 2.3 kernel version or not. I now have a reason why we
need to update ASAP to a newer kernel. NFS is broken in 2.3.29 :-(
I'm going to update my local tree to see whether we need to do more work
for nfs.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
