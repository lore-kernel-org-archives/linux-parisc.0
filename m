Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA22553
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 08:48:51 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 6 Jul 2000 14:50:04 -0000
To: law@cygnus.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] untested but building 64-bit toolchain,  issues/questions
References: <7553.962836782@upchuck> <87puorl517.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 06 Jul 2000 10:49:14 -0400
In-Reply-To: David Huggins-Daines's message of "06 Jul 2000 10:14:28 -0400"
Message-ID: <873dlnl3f9.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Jeffrey A Law <law@cygnus.com> writes:
> 
> > 64bit is hppa64-*-*.
> > 
> > We do _not_ want to ever default the tools to 64bit due to the significant
> > code generation penalties that involves.
> > 
> > Thus we can not key 64bit generation on the strings returned by config.guess.
> 
> Yes, but I thought that 'hppa2.0w' means 64 bit by definition, so it
> strikes me that the problem is with config.guess returning this.

Oh, and one more thing.  GCC thinks that hppa2.0w is a 64-bit target.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
