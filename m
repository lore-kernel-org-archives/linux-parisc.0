Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA12602
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 17:58:28 -0600
Message-Id: <200005292359.QAA11114@milano.cup.hp.com>
To: Ed June <buggz@america.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] EISA 10/100 nic for 715 systems ? 
In-reply-to: Your message of "Mon, 29 May 2000 04:32:20 PDT."
             <39322B14.309E348B@america.net>
Date: Mon, 29 May 2000 16:59:49 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ed June wrote:
> Were there ever any EISA 10/100 LAN cards for 715 systems?
> I have found straight 10's and 100's, but not a switching one.

The "newer" 715s (64/80/100, iirc) have a GSC slot and can take
a "EISA Form Factor" 100BT card based on Tulip. This card has
the GSCtoPCI bus converter on board and the Tulip driver (btlan4)
basically only talks to the PCI device.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
