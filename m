Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA02546
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 08:43:18 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 15:46:14 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 19 Dec 2000 15:46:14 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3F8376.BF84A667@linuxcare.com>
Date: Tue, 19 Dec 2000 10:49:10 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hwclock
List-ID: <linux-parisc.vger.kernel.org>


There's been some discussion on IRC about not always having to set the
clock when in userspace.  I had a quick look at it, and it shouldn't be
too hard.  We just need a parisc version of hwclock which calls the
PDC_TOD functions.

It should be reasonably easy to get this going, so if someone's looking
for an unintrusive and simple task, have a look at it.

hwclock is part of the ever-terrible utils-linux package, and you should
be able to use hwclock-ppc.c as a starting point.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
