Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA03702
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Sep 1999 15:21:47 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA05279
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Sep 1999 17:22:56 -0400 (EDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id OAA16336 for <parisc-linux@thepuffingroup.com>; Wed, 1 Sep 1999 14:22:58 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id OAA02028 for parisc-linux@thepuffingroup.com; Wed, 1 Sep 1999 14:23:29 -0700 (PDT)
Message-Id: <199909012123.OAA02028@meow.sr.hp.com>
Subject: Re: [parisc-linux] HP3000 928LX Support? (fwd)
To: parisc-linux@thepuffingroup.com
Date: Wed, 1 Sep 1999 14:23:28 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Stan Seiler wrote:
|> > > I have the opportunity to acquire a HP3000 928LX server
|> > > and would like to know if it is supported.
|> > 
|> > HP3000 systems are not PA-RISC systems. They use the Motorola 68000 CPU
|...
|> Firmware is different but many of the platform components
|> are the same as K and T class machines.
|
|
|The HP 3000/928 is a PA-RISC system (48 MHz PA7100LC (PCX-L)),
|with HP-PB I/O (2 slots), 64 KB of integrated cache, floating point
|co-processor, and a max memory of 512 MB.
|
|It's 100% identical to the HP 9000 E25 (2-slot HP-PB model).
|

Oh, so it's a Wright Brothers :)  In that case your luck ought to be
pretty good if you only care about:

1) Internal LASI based LAN and SCSI

2) RS232 connected console

It will never support graphics.  But it's so close to a 712 that it should
certainly boot.  And the suggestion taht you trade it for something 
more closely resembling a workstation is certainly valid.

	-Bill
