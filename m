Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA14647
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 10:48:23 -0700
Message-Id: <200012301752.JAA25055@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] xchg/cmpxchg defined in wrong place? 
In-reply-to: Your message of "Sat, 30 Dec 2000 16:46:57 GMT"
             <E14CP9n-0006ma-00@the-village.bc.nu>
Date: Sat, 30 Dec 2000 09:52:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> Seems a reasonable thing to try and move to atomic.h yes

ok. I'll take a whack at parisc arch and see what happens.
If it's easy, I'll try the i386 arch as well - mostly
to build more drivers as a sanity check.

thanks,
grant
