Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA08283
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 14:54:54 -0700
Message-ID: <3A451F9C.DE151BA4@gmx.net>
Date: Sat, 23 Dec 2000 22:56:44 +0100
From: Jens Trzaska <j_trzaska@gmx.net>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] starting 712/80 without keyboard?
References: <3A44F763.2CB637F9@gmx.net> <20001223212748.A7769@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Sat, Dec 23, 2000 at 08:05:07PM +0100, Jens Trzaska wrote:
> > Hello again!
> > Does anyone know if there is a possibility to start a hp 712/80
> > without a keyboard plugged in? I cannot find an option in the
> > bootrom. It always says:
> >       "Failed to initialize a keyboard, SYSTEM HALTED"
> 
> another thing which should be in the faq, but isn't.
> 
> serial console on the 712 is officially Not Supported.
> 
> however, you can do it, if you know what to type.  full details are in
> the mailing list archives somewhere.

That's not what i'm searching for. I do not need the serial console
nor the keyboard. I prefer using ssh. The problem is that i can't 
reboot the system from remote when there is no keyboard. I'm
searching for something like a normal award bios has...
'halt on no errors' or something like that. But it it looks as if
there is no option in the boot rom.

regards Jens
