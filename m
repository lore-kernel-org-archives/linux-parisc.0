Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23649
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 09:42:33 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Jul 2000 15:44:04 -0000
To: law@cygnus.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Don't rebuild gcc/glibc yet
References: <4567.963328578@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Jul 2000 11:42:49 -0400
In-Reply-To: Jeffrey A Law's message of "Tue, 11 Jul 2000 09:16:18 -0600"
Message-ID: <878zv8brly.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

>   > (i.e. are there definitions of those functions anywhere?) 
> I believe they're in libc.a or milli.a on hpux systems.

Yes, actually, gcc/config/pa/quadlib.c, as I discovered when looking
at the other PA targets.

>   > I get 'sizeof(long double) == 0' when configuring glibc, but
>   . strangely enough it still wants to use them...
> You should never get sizeof long double == 0 -- if long doubles are
> not supported, they should be treated like doubles.

Yeah, I realized why that is, it's because glibc's configure.in does:

dnl check for the size of 'long double'.
AC_CHECK_SIZEOF(long double, 0)

Which makes sense :-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
