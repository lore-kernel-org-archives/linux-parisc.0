Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA06692
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jul 1999 02:47:49 -0600
Received: from mgw-i2.ntc.nokia.com (mgw-i2.ntc.nokia.com [131.228.118.61])
	by mgw-x2.nokia.com (8.9.3/8.9.3) with ESMTP id LAA24773
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jul 1999 11:48:29 +0300 (EETDST)
Received: from stybba.ntc.nokia.com (stybba.ntc.nokia.com [131.228.178.21])
	by mgw-i2.ntc.nokia.com (8.9.3/8.9.3) with ESMTP id LAA24050
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jul 1999 11:48:29 +0300 (EETDST)
Received: from gamgee.ntc.nokia.com (martikka@gamgee [131.228.178.130])
	by stybba.ntc.nokia.com (8.9.1a/8.9.1/Goodi) with ESMTP id LAA16682
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jul 1999 11:48:28 +0300 (EET DST)
Date: Thu, 22 Jul 1999 11:48:28 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <C12531D038D1D011B1DB0000F8036C28032795C4@eosm5.oecd.org>
Message-ID: <Pine.HPX.4.05.9907221145200.6553-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Subject: [parisc-linux] syntax error in dino.c (215)
List-ID: <linux-parisc.vger.kernel.org>

Hi!

Could someone fix this in dino.c (line 215):

                printk("KERN_WARNING "dino: can't allocate IRQ\n");
-> 
                printk(KERN_WARNING "dino: can't allocate IRQ\n");
Thanks...

- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
