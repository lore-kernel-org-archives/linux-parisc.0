Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA03748
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 09:11:04 -0700
Received: from bimbo.hungary.hp.com (bimbo.hungary.hp.com [15.188.72.201])
	by palrel3.hp.com (Postfix) with ESMTP id 8299E9FF
	for <parisc-linux@thepuffingroup.com>; Tue, 29 Feb 2000 07:12:00 -0800 (PST)
Received: from pcmatics (pcmatics.hungary.hp.com [15.188.74.169]) by bimbo.hungary.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.1) id QAA03711 for <parisc-linux@thepuffingroup.com>; Tue, 29 Feb 2000 16:11:58 +0100 (MET)
Message-ID: <00cf01bf82c7$51677260$a94abc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <parisc-linux@thepuffingroup.com>
Date: Tue, 29 Feb 2000 16:11:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] zalon
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I'm working on the ncr7xx driver and plan to add support for the
Bluefish GSC SCSI interface. I looked at the Mach kernel and
found that before accessing the c720 it is initializing something
called zalon.

What is that thing? Should one care about it or just blindly do the
same as the Mach kernel does?

Gyula
