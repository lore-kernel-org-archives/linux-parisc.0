Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA01670
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 14:34:22 -0700
Message-Id: <200002252036.MAA04792@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap 
In-reply-to: Your message of "Thu, 24 Feb 2000 22:49:34 PST."
             <20000224224934.N9944@thepuffingroup.com>
Date: Fri, 25 Feb 2000 12:36:27 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com wrote:

> Uh oh.  We really need a kernel unaligned trap handler.  Some of
> the network protocols rely on that being handled right (yes, i know.
> it sucks.)

It really sucks. If any code in the performance path depends on this,
we can forget competing with HP-UX. Misaligned references should be
flagged with "BUG()" or logged we know it's happening.

Thanks for pointing out the problem.
As long as this exists, it seems I can't "boot" on my c3k.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
