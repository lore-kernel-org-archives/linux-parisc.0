Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA17589
	for <parisc-linux@puffin.external.hp.com>; Tue, 9 Nov 1999 17:10:35 -0700
Date: Wed, 10 Nov 1999 01:14:09 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
Message-Id: <19991110011409.A17550@mathe.stud.uni-erlangen.de>
References: <19991110004745.T25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991110004745.T25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> I've taken the hp300 HIL driver written by Phil Blundell and it `works'
> on my 715/33.  It's producing the wrong keycodes, it's doing work that an
> ASP driver ought to be doing and it's producing a fair bit of extraneous
> crap on the screen.  But I'm getting interrupts and keycodes so I'm
> happy for tonight :-)

congrats.  The Lasi / PS/2 driver shouldn't be too difficult to write either
except for one minor problems:

We do not know how the PS/2 keyboard (identical to AT keyboard I would hope)
self-test procedure is.  We do know that we can send a command to the keyboard
to cause it to start a self-test, and we do know that the Intel keyboard con-
troller has a separate bit in the status register indicating that the keyboard
self-test succeeded.

What we can do (and the Intel keyboard controller cannot) is to manually control
and read the PS/2 data and clock lines, so I suspect we'll have to make use of
this to successfully do a keyboard self-test.

If you know of any documentation describing what happens during an AT keyboard
self-test, please tell us.

> My question is: how?  Mach hardcodes the address of ASP to 0xf0800000,
> but there's nothing even close in the driver list.  I notice in the

> 2. Scorpio Jr Core BA (11) at 0xf082f000, versions 0xb, 0x0, 0x70, 0x0, 0x0
> 3. Scorpio Jr Core SCSI (10) at 0xf0825000, versions 0xb, 0x0, 0x71, 0x0, 0x0
> 4. Scorpio Jr Core LAN (802.3) (10) at 0xf0826000, versions 0xb, 0x0, 0x72, 0x0, 0x0
> 5. Scorpio Jr Core HIL (10) at 0xf0821000, versions 0xb, 0x0, 0x73, 0x0, 0x0
> 6. Scorpio Jr Core RS-232 (10) at 0xf0823000, versions 0xb, 0x0, 0x75, 0x0, 0x0
> 7. Scorpio Jr Core RS-232 (10) at 0xf0822000, versions 0xb, 0x0, 0x75, 0x0, 0x0
> 8. Scorpio Jr Core Centronics (10) at 0xf0824000, versions 0xb, 0x0, 0x74, 0x0, 0x0

I am sorry, but when all this devices are within a 1 MB offset of the HPA we're
looking for (0xf0800000 + 1 M = 0xf0900000, I hope), doesn't that look very nice
indeed ?  You are right that the interrupt management (which is at address
0xf0800000) is not specifically printed here, but I think we should be able
to deduce it, shouldn't we ?

	Philipp Rumpf
