Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA25975
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 04:36:15 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39923147.1140E9AE@uswest.net>
Date: Wed, 09 Aug 2000 22:36:24 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] merge with 2.4.0-testN?
References: <200008100423.VAA04954@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Will the port name change from parisc to hppa at this time too?

ie... Will the following directories change?

Documentation/parisc
arch/parisc
arch/parisc64
include/asm-parisc
include/asm-parisc64

Let me know when/where and I'll do what I can to help with the merge.

Thanks,

Ryan


Grant Grundler wrote:

> Matthew Wilcox wrote:
> >
> > it's been well over 2 months since we last merged Linus' tree into ours.
> > i'm thinking about leaving the -test6 patch to mature over the next week
> > or so, see if there's any cripplingly awful bug reports and, if not,
> > merge -test6 into our tree.  if there are, -test4 had some good reviews,
> > i might consider that instead.
>
> Mathew,
> ok with me. either way.
>
> > i'm going to tentatively set a date as Thursday 16th August for this.
> > if you've got any big changes outstanding, now would be an excellent
> > time to commit them before the landscape shifts under our feet.
>
> San Jose, LWE is on until Aug 17th. We will have a RH linux PC, 712, A180
> and internet access during the show...so Matt and I might be able to help
> some anyway if the HP booth is wonderfully boring. :^)
>
> BTW, should we move to a "linux" or "linux-2.4" repository?
> I have no clue what the mechanics are of doing such a move but
> this merge might be a good time to do it.
>
> thanks,
> grant
>
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
