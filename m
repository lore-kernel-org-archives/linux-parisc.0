Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA25133
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 12:53:19 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 18:54:55 -0000
To: law@cygnus.com
Cc: Alan Modra <amodra@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <1991.963592762@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Jul 2000 14:53:23 -0400
In-Reply-To: Jeffrey A Law's message of "Fri, 14 Jul 2000 10:39:22 -0600"
Message-ID: <87aefkzgpo.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

> Either we need to avoid merging the section symbols to avoid twiddling
> the addend, or we need to avoid reducing relocs to section symbols to
> begin with.

We only reduce relocations to section symbols for static data.  It
seems that every other platform I've investigated (Sparc, PowerPC,
Alpha) does the same thing, so, while I think it would be possible to
not reduce them on PA, I'm not sure what the unintended side effects
would be.

As for not merging section symbols ... I'm not sure how that would be
done, but if it's the only option I guess we can figure it out.

Alan: any thoughts on this?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
