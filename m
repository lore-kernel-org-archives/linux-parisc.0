Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA23956
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 15:46:56 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 9 Jun 1999 21:43:40 -0000
To: tor@spacetec.no (Tor Arntsen)
Date: Wed, 9 Jun 1999 22:43:14 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199906092126.XAA02287@pallas.spacetec.no> from "Tor Arntsen" at Jun 9, 99 11:26:08 pm
Content-Type: text
Message-Id: <E10rq7u-0000km-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] Trying to get HP-UX working
List-ID: <linux-parisc.vger.kernel.org>

Well I have the HP a hub and some cabling. The web console works great (cute
hack) and it understands my subnetting although it came shipped on an 
IP address belonging to RIPE not HP or RFC1597 (duh)

I can't however get HP/UX to set up an interface 

	194.168.151.23 netmask 255.255.255.224

which I really need to do. Also before I go and build all the sane tools
so the box is usable has anyone already built a big tar file of HP/UX binaries
of gcc/bash/fileutils etc ?

Alan
