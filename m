Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13109482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 04:28:42 -0600 (MDT)
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (Postfix) with ESMTP id C461E4B014
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 12:25:50 +0200 (CEST)
Received: from eosgty1.oecd.org (unverified) by netsweep1.oecd.org
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T55c473708c0a66056e06d@netsweep1.oecd.org> for <parisc-linux@lists.parisc-linux.org>;
 Mon, 3 Sep 2001 12:28:39 +0200
Message-ID: <C12531D038D1D011B1DB0000F8036C280A30EB51@eosm5.oecd.org>
From: Arnaud.ATOCH@oecd.org
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] UreStoreOptical 20xt
Date: Mon, 3 Sep 2001 12:28:38 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

First thank you for the port. I'm running a 712/100 with no special trouble
(iso image 0.9.2).

I've got 1 question on the HP Surestore Optical 20xt.

I was using this robot on HP-UX. It is now connected to the 712/100. It is
seen by the SCSI driver and using mtx, I can load, unload, eject opticals
disks.

Using fdisk, I can partition, format (mkfs),and then use blank optical
drives.

I'd like to read all ones created with HP-UX.

I know that sector size of 1024 is no more an issue since 2.2.16 or
something but neither mount or fdsik recognize what's on the drive for HP-UX
written disks.

I've loaded hfs, hpfs, udf, ufs because it was not clear which module
provide HP-UX filesystem support.

Btw does the HP-UX fs support patch made it to Linus tree ?

thanks for any feedback.

Arnaud Atoch
OECD
Paris - France
