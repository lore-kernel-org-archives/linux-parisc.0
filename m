Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA10017
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 17:53:10 -0700
Message-Id: <200012240057.QAA20785@milano.cup.hp.com>
To: Jens Trzaska <j_trzaska@gmx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] starting 712/80 without keyboard? 
In-reply-to: Your message of "Sat, 23 Dec 2000 22:56:44 PST."
             <3A451F9C.DE151BA4@gmx.net>
Date: Sat, 23 Dec 2000 16:57:20 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jens Trzaska wrote:
> > serial console on the 712 is officially Not Supported.
> > 
> > however, you can do it, if you know what to type.  full details are in
> > the mailing list archives somewhere.
> 
> That's not what i'm searching for. I do not need the serial console
> nor the keyboard.

What willy was trying to say was the system will boot w/o keyboard
if you change the PDC/BOOT_ADMIN console path to serial port.
Mail search tool is at puffin.external.hp.com/cgi-bin/mailgrep.
Try looking for "conspath" or "ISL" if "serial console" gets too
many hits.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
