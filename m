Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA09096
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 07:48:49 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 14:52:44 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LnlU-0000at-00
	for parisc-linux@thepuffingroup.com; Thu, 25 Jan 2001 14:52:44 +0000
Date: Thu, 25 Jan 2001 14:52:44 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010125145244.C25242@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] CPU detection wrong
List-ID: <linux-parisc.vger.kernel.org>


we have the following entry in hardware.c:

        { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */

however, 5d5 is a pcxw+ (pa8600).  I don't know enough to change this
because i don't have a list of which ids are assigned.  I know this
information is available within linuxcare because i remember going over
this with dave kennedy at one point.  i don't have that information any
more though, so i can't fix this myself.

-- 
Revolutions do not require corporate support.
