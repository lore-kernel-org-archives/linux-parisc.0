Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA27557
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 14:42:30 -0700
To: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com,
        lamont@hp.com
Subject: Re: [parisc-linux] Oopser 
In-reply-to: Your message of "Sat, 13 Jan 2001 18:13:26 GMT."
             <20010113181326.C7463@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Sat, 13 Jan 2001 14:45:54 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010113214555.D53361872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Sorry, I wasn't precise enough.  I want the rest of the kernel to continue
> until the 10 seconds is up.

The only way I've ever done this is to set a timer for 10 seconds, and have
the hander for said timer be panic, or reboot, or whatever you want it to
do...

That's going to require that timer interrupts work.

(I think MPE/iX _STILL_ has a routine in the kernel called delayed_reboot...)

lamont
