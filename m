Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA13449
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Nov 2000 00:24:32 -0700
Message-Id: <200011120731.XAA09607@milano.cup.hp.com>
To: rajak@cerias.purdue.edu
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Problems booting new beta CD 
In-reply-to: Your message of "Sat, 11 Nov 2000 22:58:57 PST."
             <Pine.SOL.4.21.0011112248330.10852-100000@herald.cc.purdue.edu>
Date: Sat, 11 Nov 2000 23:31:37 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Brian Poole wrote:
...
> Looking thru the FAQ

Brian,
Thank you for first reading the FAQ!

> I saw a somewhat similar question, in that it had
> 'pdc' in it & was booting from the CD (but the 0.1 CD, not the one I am
> using), that said the kernel on the CD booted from/to the
> serial console. Is this also true of the 0.5 CD?

I think it is.
Is there a way via PALO to direct the console to FBCON or STICON or
whatever it's called now?

I had the impression *eventually* the boot console would be whatever PDC
says it is - ie graphics console for the 712.

> If so, what is necessary to boot one of these from console?

kernel with CONFIG_STI_CONSOLE I think....but that's not enabled by default.
It may not be possible to use the graphics console unless one builds
a "custom" kernel.

> I've been fooling with it to no
> success.. I have it automatically booting from the CD, but it doesn't
> actually boot. I replug in the monitor & keyboard and find that it can't
> boot without the keyboard ('Failed to initiliaze a keyboard\n SYSTEM 
> HALTED').. How am I supposed to boot to the console if I can't boot w/o a
> keyboard? I imagine if it has a keyboard it will boot to the screen like a
> Sun.

AFAIK, 712's are the only parisc workstations what won't boot w/o keyboard.
All others will auto-switch to use serial console if the keyboard
is not connected.

Both or the above questions sounds like a FAQ.
Could someone who knows more update/add those to the FAQ?

thanks,
grant

ps. The most up-to-date FAQ is at parisc-linux.org/faq.html even
though that's not officially online yet.

> 
> Thanks for the help,
> 
> -b
> 
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
