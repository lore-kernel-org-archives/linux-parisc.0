Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA21401
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Oct 1999 14:14:53 -0600
Received: from vodka.thepuffingroup.com by mrelay.bellglobal.com
 (PMDF V5.1-12 #26722) with ESMTP id <0FJT00CT2EPHRJ@mrelay.bellglobal.com> for
 parisc-linux@thepuffingroup.com; Mon, 18 Oct 1999 16:10:30 -0400 (EDT)
Date: Mon, 18 Oct 1999 16:17:13 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] lasi Serial support
In-reply-to: <199910180537.WAA20422@rock.cup.hp.com>
To: Grant Grundler <grundler@rock.cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Message-id: <Pine.LNX.4.10.9910181616010.3965-100000@vodka.thepuffingroup.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 17 Oct 1999, Grant Grundler wrote:
> But I mainly write to question the location of LASI serial port code.
> I don't know if it's "right" to have this code in lasi.c.  I'd like
> to understand if it is and why. I'm confused because Lasi SCSI support
> is in lasi7xx.c.  Is it reasonable to create a lasi_RS232.c (or whatever)?

In part because the serial ports are recognized as a seperate inventory
item, I think it makes sense to move the lasi serial stuff into
drivers/char/lasi_serial.c.  Grant, want to take care of this?

- Alex
