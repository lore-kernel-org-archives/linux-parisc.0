Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA20808
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Mar 2000 13:02:56 -0700
Received: from venus (venus.esiee.fr [147.215.20.10])
	by mail.esiee.fr (Postfix) with SMTP id 1B6FA5735A
	for <parisc-linux@thepuffingroup.com>; Thu, 23 Mar 2000 20:04:28 +0100 (CET)
Message-ID: <00ca01bf94fa$ca500580$0a14d793@esiee.fr>
From: "Thierry SIMONNET" <t.simonnet@esiee.fr>
To: <parisc-linux@thepuffingroup.com>
References: <E12XSiA-00022u-00@endor.fc.hp.com> <200003222233.XAA11675@zaphod.halden.lillfab.se> <20000322220229.D10226@thepuffingroup.com>
Date: Thu, 23 Mar 2000 20:05:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Eth0 trouble
List-ID: <linux-parisc.vger.kernel.org>

I have generated new lifimages with differents methods (ramdisk, nfsroot and
disk) using palo.
I have the following messages :
    eth0: receive unit error
    eth0: Null rbd - oops!
     eth0: receive unit error
    eth0: Null rbd - oops!
    eth0: receive unit error
    eth0: Null rbd - oops!
    eth0: receive unit error
    eth0: Null rbd - oops!
....

Before this messages, everything is OK. sash works fine, and I can execute
some test programs. After that, I lost LAN connectivity.

My config is  : 712/80 Workstation, with latest binutils, gcc, linux-2.3 and
palo.

Have an idea?

THX

Th. SIMONNET
