Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05505
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Sep 1999 12:17:49 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id OAA16591
	for <parisc-linux@thepuffingroup.com>; Sun, 26 Sep 1999 14:37:42 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37EE67F2.D4C786B5@thepuffingroup.com>
Date: Sun, 26 Sep 1999 14:37:38 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cleaning up IPL and ramdisks
List-ID: <linux-parisc.vger.kernel.org>


We've talked for awhile about rewriting all the bootup stuff, it's
served us well until now, but it really needs a rewrite to make it a lot
cleaner.  Is anyone interested in taking this on?  Helge?

The new version should use the same PDC calls as the rest of the kernel,
use the entire LIF structure declared in the HPUX header files. 
Philipp, did you have any other thoughts?


- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
