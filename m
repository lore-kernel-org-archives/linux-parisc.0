Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA32536
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 14:43:06 -0700
Received: from bimbo.hungary.hp.com (bimbo.hungary.hp.com [15.188.72.201])
	by cosrel1.hp.com (Postfix) with ESMTP id 7ED15328
	for <parisc-linux@puffin.external.hp.com>; Thu,  2 Mar 2000 13:44:26 -0700 (MST)
Received: from pcmatics (pcmatics.hungary.hp.com [15.188.74.169]) by bimbo.hungary.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.1) id VAA03645 for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 21:42:51 +0100 (MET)
Message-ID: <006601bf8487$e057e010$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <parisc-linux@puffin.external.hp.com>
Date: Thu, 2 Mar 2000 21:42:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] lasi scsi driver
List-ID: <linux-parisc.vger.kernel.org>

It's only half working. It can list the devices on the bus, but that's all.

It is not working because it needs a horrible amount of cache flushing
and I still didn't get it right. (the committed code only contains enough
flushing to pass the two debugging tests)

The scsi card is running code that is in the main memory and the driver
is heavily patching that. The bigger problem is that the communication
with the card is done via a mailbox also residing in the main memory
and the driver is assuming that this mailbox is on a non-cacheable page.

I know that the architecture supports setting a page non-cacheable.
My question is if it is possible / good idea to set the mailbox page
to non-cacheable?

Gyula
ps: if you hack 53c7xx.c beware that many comments are misleading.
and generally it is a mess.
