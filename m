Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA06385
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 19:39:20 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id VAA05806
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Sep 1999 21:39:11 -0400 (EDT)
To: Philipp Rumpf <prumpf@suse.de>
Cc: LaMont Jones <lamont@security.hp.com>,
        Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com,
        lamont@security.hp.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output 
In-reply-to: Your message of "Fri, 17 Sep 1999 00:55:42 +0200."
             <19990917005542.I8112@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 16 Sep 1999 19:39:47 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990917013948.39E7E18711@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> we don't save them at all, but directly read them.  Of course, printing them
> doesn't make any sense (except for debugging the interruption code).

Reading them when PSW.Q=1 is undefined, and it sounds like that's where the
problem is coming from....  IIR should have had a load or store in it for
Grant's problem...  But that has to get stored before going virtual to
handle the trap...

lamont
