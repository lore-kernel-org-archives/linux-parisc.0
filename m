Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA06206
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 13:04:15 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 20:06:48 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1431sq-000784-00
	for parisc-linux@thepuffingroup.com; Mon, 04 Dec 2000 20:06:44 +0000
Date: Mon, 4 Dec 2000 20:06:44 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001204200644.C12414@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] On the naming of discs
List-ID: <linux-parisc.vger.kernel.org>


As noted in the install documentation, Linux and HPUX name their
discs differently.  HPUX follows the spec and numbers from 7 down to 0,
Linux follows the PC aberration and numbers from 0 up to 7.  Alan's just
pointed out to me that we have the capability to reverse this.  However,
it's going to change everyone's numbering.  Do we want to switch?

-- 
Revolutions do not require corporate support.
