Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id BAA12176
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 01:46:53 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id WAA10645
	for <hppa-linux@thepuffingroup.com>; Wed, 17 Mar 1999 22:46:21 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8S2TA00.DL6 for <hppa-linux@thepuffingroup.com>; Wed, 17 Mar
          1999 22:46:22 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F0A1AD.692A4699@netscape.com>
Date: Thu, 18 Mar 1999 01:48:13 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: Linux/PARISC <hppa-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] make dep
List-ID: <linux-parisc.vger.kernel.org>

You can run make dep now and see millions of warnings about implicitly
defined functions and such, but have it complete ``successfully''. 
Basically, I just added a handful of stubs and #defines, and then tidied
some insanity in the build system.

I'm curious as to why our dep target actually builds all the .o/.as, but
I'll look at that in the morning or something.

Mike

-- 
314982.57 267714.70
