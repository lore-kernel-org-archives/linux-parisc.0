Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22771
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 09:14:25 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Don't rebuild gcc/glibc yet 
Reply-To: law@cygnus.com
In-reply-to: Your message of 11 Jul 2000 11:06:37 EDT.
             <87em50btaa.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Jul 2000 09:16:18 -0600
Message-ID: <4567.963328578@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <87em50btaa.fsf@linuxcare.com>you write:
 > Is the long double stuff in gcc supposed to work at all? 
Yes.

  > (i.e. are there definitions of those functions anywhere?) 
I believe they're in libc.a or milli.a on hpux systems.

  > I get 'sizeof(long double) == 0' when configuring glibc, but
  . strangely enough it still wants to use them...
You should never get sizeof long double == 0 -- if long doubles are
not supported, they should be treated like doubles.
jeff
