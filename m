Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24451
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 10:12:45 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Jul 2000 16:14:13 -0000
To: law@cygnus.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Don't rebuild gcc/glibc yet
References: <4774.963331170@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Jul 2000 12:12:58 -0400
In-Reply-To: Jeffrey A Law's message of "Tue, 11 Jul 2000 09:59:30 -0600"
Message-ID: <873dlgbq7p.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

>   In message <878zv8brly.fsf@linuxcare.com>you write:
>   > Yes, actually, gcc/config/pa/quadlib.c, as I discovered when looking
>   > at the other PA targets.
> Ah.  Actually quadlib.c is just a front-end to routines provided
> elsewhere by the hpux libraries.

Right, I found that out the hard way :(

I suspect that I'll just turn it off for Linux for the time being, as
I don't know how difficult it will be to reimplement those, and
whether there is a good reason to or not.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
