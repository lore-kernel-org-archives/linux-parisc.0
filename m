Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49D674A01
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 11:35:31 -0600 (MDT)
Message-ID: <3BB4B4DE.8080608@umr.edu>
Date: Fri, 28 Sep 2001 12:35:26 -0500
From: Nathan Neulinger <nneul@umr.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Status of hp-ux binary compatibility?
List-ID: <linux-parisc.vger.kernel.org>

I just started looking at PA-RISC linux 0.9.2 on a J210 (which installed 
great on a narrow scsi drive, but didn't see the internal fw). Only 
problem I've seen so far is that it is spitting out ip_local_deliver bad 
loopback skb: PRE_ROUTING LOCAL_IN messages on the console for the lo 
device.

My main question though - what's the status of hpux binary support? The 
FAQ seems to indicate that some parisc binaries are already functional.

What is necessary to be done on the machine before I can run an HP 
executable?

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
