Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18278
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 06:35:12 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 31 Oct 2000 13:36:52 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13qbat-0006sG-00
	for parisc-linux@thepuffingroup.com; Tue, 31 Oct 2000 13:36:51 +0000
Date: Tue, 31 Oct 2000 13:36:51 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001031133651.C24691@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] space registers
List-ID: <linux-parisc.vger.kernel.org>


a small optimisation just occurred to me.

right now, when we switch to kernel space, we set all of sr4-sr7 to 0
(for the kernel mapping).  we don't need to do that since the kernel is
entirely in sr7's domain.  this has the added bonus that badly written
drivers which blindly dereference userspace pointers will work on
parisc as well as x86.  we can also lazily restore sr4-6 on exit from
kernel space if we're switching back to the same task which called us.
this optimisation may not be worthwhile, but i think setting sr4-6
on entry to the kernel is unnecessary.

-- 
Revolutions do not require corporate support.
