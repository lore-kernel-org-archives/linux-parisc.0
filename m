Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA21539
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 17:04:57 -0700
Message-Id: <200101020009.QAA26045@milano.cup.hp.com>
To: R P Herrold <herrold@owlriver.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Dual Boot 
In-reply-to: Your message of "Sat, 30 Dec 2000 23:16:39 PST."
             <Pine.LNX.4.30.0012302306560.13921-100000@swampfox.owlriver.com>
Date: Mon, 01 Jan 2001 16:09:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

R P Herrold wrote:
...
> I'm going to try spinning up a G50, and sniffing at a K220 for
> parisc linux ... 735/125 on the way in ... I'd like to leave
> HP-UX on the K220 and 'dual boot' -- but it is such a pain to
> hook a console up -- Any thoughts on an OS/2 style Boot
> Manager leaving 'next boot' semaphore flags behind ...

It's hard to hook up a serial console on K220?!

Under HPUX, "setboot" command can set the primary boot path
so it can reboot from any disk/lan you want. You would have to
write a similar program for parisc-linux to poke stuff into NVRAM.
It might be a PDC call to do it; I don't know. But it's doable.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
