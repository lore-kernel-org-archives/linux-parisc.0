Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA18495
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jan 2000 01:54:37 -0700
Received: from venus (venus.esiee.fr [147.215.20.10])
	by mail.esiee.fr (Postfix) with SMTP id 5743C57322
	for <parisc-linux@thepuffingroup.com>; Tue, 18 Jan 2000 08:55:14 +0100 (CET)
Message-ID: <003001bf6189$62c3dbc0$0a14d793@esiee.fr>
From: "Thierry SIMONNET" <t.simonnet@esiee.fr>
To: <parisc-linux@thepuffingroup.com>
Date: Tue, 18 Jan 2000 08:55:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Generating Kernel and Image
List-ID: <linux-parisc.vger.kernel.org>

Since December, I try to generate vmlinux and Image for 712/60.
I use a 712/60 workstation (HPUX 10.20, cc, gcc-2.95.2) as development
platform and a 712/80 as client.
My bootp works fine.
1 - I can boot on Image-19991113 with serial console. but I don't know what
to do after.
2 - I can't boot on my own Image. Perhaps my console device is wrong. What
is the right device for a graphical console. I try tty00, ttyS0. But it
fails.

Thanks for your help.

Th. SIMONNET
