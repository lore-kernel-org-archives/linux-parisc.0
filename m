Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA21389
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:15:51 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 16:17:14 -0000
To: law@cygnus.com
Cc: Alan Modra <alan@linuxcare.com.au>, Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <1747.963590525@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Jul 2000 12:02:37 -0400
In-Reply-To: Jeffrey A Law's message of "Fri, 14 Jul 2000 10:02:05 -0600"
Message-ID: <87lmz4zoma.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

>   In message <Pine.LNX.4.21.0007141038590.15538-100000@front.linuxcare.com.au>y
> ou write:
>   > Zap these two lines, and I think the problem will go away.
> But that's totally the wrong thing to do as it will break hpux.
> 
> The linker is the problem.

I've conditionalized it on the existence of GNU ld, is that okay?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
