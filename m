Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA05258
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 21:37:10 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39B1B797.D64CAB00@uswest.net>
Date: Sat, 02 Sep 2000 20:29:43 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Bob Pflederer <krp@rsn.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
References: <39B1822A.4E8F20AB@uswest.net> <20000902210713.C987@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bob,

Testing the patch now... if it works for me ... I'll commit the patch.

Thanks for the patch!

Ryan


Bob Pflederer wrote:

> I see this on C180.  It goes away if you modify entry.S to use
> PA2.0-style tlb inserts instead of the PA1.1-style tlb inserts.
> Try the attached patch.  It modifies the tlb miss handlers at startup to
> use PA2.0 tlb inserts if you have a PA2.0 cpu.  PA-8000 docs claim
> that PA1.1 tlb inserts are not supported, so I suspect we're hitting
> a case that doesn't work.
>
> Would someone who has CVS write access be willing to commit this
> patch?  It's the last thing I need to make C180 work.
>
> -Bob
