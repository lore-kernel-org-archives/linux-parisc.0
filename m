Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA32087
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 12:54:28 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id 76B145A2
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 12:57:00 -0700 (MST)
Message-Id: <200011221955.LAA21865@milano.cup.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Wed, 22 Nov 2000 01:11:57 PST."
             <200011220811.BAA14756@udlkern.fc.hp.com>
Date: Wed, 22 Nov 2000 11:55:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
> Grant Grundler wrote:
> > Yes I do. It is supposed to work for ccio+PCX-W platforms (eg C360).
...
> Well, personally i'd vote to get rid of it. It works for ONE machine only,
> and MAY have an advantage in some small case.

And so does the OB600 mouse driver I rewrote/published.
AFAIK, it only works on OB600s.

I was originally thinking D/K/R-class boxes had PCX-W upgrades but
AFAICT, they don't.

> But if we keep it, lets make
> sure that it is real clear that it should NOT be the default choice.
> 
> It should be marked CONFIG_EXPERIMENTAL, and the text associated with it
> should clearly show that it works on a C360 only. If possible, it should
> also be made clear that ccio-dma.c works for C360, so people who have
> C360's don't think they have to choose ccio-rm-dma.c.

IIRC, Comments in the headers of both ccio files make those issues clear.
I'm not sure where else that needs to be documented.

> Grant, I hope you are prepared to answer the parisc-linux mailing list
> questions this is going to generate once parisc-linux starts becoming more
> visible.  Another FAQ entry perhaps? :-)

Ryan owns it. He's responsible for documenting it and adding FAQ questions.
He can choose to delete ccio-rm-dma.c as well.
:^)

I think it'd be a waste to throw it away before someone figures
out that it's really not useful - even if just for C360.

thanks,
grant
