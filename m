Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA08813
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 17:56:51 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 15 Jan 2001 01:00:30 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Hy0b-0002MO-00
	for parisc-linux@thepuffingroup.com; Mon, 15 Jan 2001 01:00:29 +0000
Date: Mon, 15 Jan 2001 01:00:29 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010115010029.A8375@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] configuration
List-ID: <linux-parisc.vger.kernel.org>


is there a good reason that we duplicate large chunks of (for
example) the SCSI configuration menu (from drivers/scsi/Config.in)
in the arch/parisc/config.in file?  sparc / spac64 do the same as us,
but none of the other arches do.  do we have a good reason or is ths a
hysterical accident?

-- 
Revolutions do not require corporate support.
