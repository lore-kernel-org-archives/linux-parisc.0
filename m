Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA09990
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 08:45:53 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37836A9E.5224AB6E@thepuffingroup.com>
Date: Wed, 07 Jul 1999 10:56:30 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
References: <Pine.HPX.4.05.9907071255560.20278-100000@gamgee.ntc.nokia.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hannu Martikka wrote:
> I have problems with Linux on C360. Here is what I tried:
> 
...
> 
> This is the last message. Here it hangs. On frontpanel the leds 1-3 are on
> (no 4 is off).
> 
> Should it work better in C-series? or is C-series "unsupported"?

Matt is likely right, it is something to do with that being a 2.0 CPU.

I'm a bit surprised that you never see anything, though.  It could be
that our PDC calls or CPU setup code is CPU specific, but I'd thought it
was pretty generic.

Just to eliminate the possibility of it being a build time bug, could
you try booting that c360 with a precompiled  kernel at
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/ ?

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
