Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA12344
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 15:45:14 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 26 Nov 2000 22:47:36 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 140AaG-0002R1-00
	for parisc-linux@thepuffingroup.com; Sun, 26 Nov 2000 22:47:44 +0000
To: parisc-linux@thepuffingroup.com
Date: Sun, 26 Nov 2000 22:47:43 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E140AaG-0002R1-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] Linker failure with db1
List-ID: <linux-parisc.vger.kernel.org>

I replaced the libdb1 on the ISO with one built using the toolchain on the ISO
and all is now happy. 
