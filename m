Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07779
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 14:05:33 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Dec 2000 21:08:05 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 142Jt5-0004lx-00
	for parisc-linux@thepuffingroup.com; Sat, 02 Dec 2000 21:08:03 +0000
Date: Sat, 2 Dec 2000 21:08:03 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001202210803.D8288@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] merge activity
List-ID: <linux-parisc.vger.kernel.org>


those on the CVS list will have noticed a lot of activity just recently.
Alan Cox & myself are geting the tree into a state where it can be dropped
on Linus.  A number of changes have been made:

s/STATIC/static/
removal of asmlinkage -- it's a hangover from i386 that no-one else needs
Makefile conversion to new-style
u_long becomes unsigned long
old code has mostly been cleaned out
a lot of #ifdefs have been removed.

-- 
Revolutions do not require corporate support.
