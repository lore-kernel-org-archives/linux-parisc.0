Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA03629
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 00:53:06 -0700
Date: Fri, 8 Dec 2000 23:55:46 -0800
From: Richard Henderson <rth@redhat.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001208235546.A4574@redhat.com>
References: <23471.976334727@upchuck> <Pine.LNX.4.21.0012091544270.17519-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012091544270.17519-100000@front.linuxcare.com.au>; from Alan Modra on Sat, Dec 09, 2000 at 06:52:13PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 09, 2000 at 06:52:13PM +1100, Alan Modra wrote:
>    for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
>      if (call_used_regs[i] && ! fixed_regs[i]
> +	&& REGNO_REG_CLASS (i) == GENERAL_REGS

This isn't what you meant.  You meant "is this register a 
member of general regs".  What you got was "is general regs
the most specific class for this register".

Which means that ports like x86 where practically every
register has its own class will break.


r~
