Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31900
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 16:12:29 -0700
Sender: marteaut@esiee.fr
Message-ID: <3A22EB84.55C1B979@esiee.fr>
Date: Tue, 28 Nov 2000 00:17:24 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
References: <200011271757.JAA25357@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Leds
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	We tried to implement the led power of 712 hp boxes. We call leds_init
in main.c in init directory. Even though it is working, we are not sure
where to put the source that must be completed for others models.

We could make a LEDS directory in drivers
	 put the file in the kernel directory

We also put the source for the initialisation of keyboard leds in
lasi_ps2_reset but we admit that no led is on. Is it true?
How can we know?

THX, ESIEE Team
