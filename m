Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA02274
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 19:45:48 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39B5A1B1.CA09A271@uswest.net>
Date: Tue, 05 Sep 2000 19:45:21 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Bob Pflederer <krp@rsn.hp.com>
CC: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
References: <200009030329.VAA17641@udlkern.fc.hp.com> <20000905120228.H999@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bob and John,

I have the latest CVS kernel on booting on the C200+ and a 755.
They both booted to an ash prompt without any modifications!

Just wanted to let everyone know the changes John made are
working great for me in PARISC 1.1 and PARISC 2.0 land!

Thanks,

Ryan

P.S. It is a great feeling to see my C200+ finally boot linux!

Bob Pflederer wrote:

> I noticed that John committed something this morning, so I tried it out
> on my C180, and it works!  For the first time, the CVS kernel boots
> un-modified on my C180.  Odds are good that it will also work in C200+.
>
> Thanks, John.
>
> >
> > My fix will do a simple 3-4 assembly instruction test for PA2.0 in
> > head.S, and then install the appropriate iva. This wastes 2K of memory
> > having two iva's, but is a lot simpler to do in assembly very early
> > in the boot process. I'll try to get this done by Tuesday morning
> > (I work throughout the night Monday).
> >
> > John Marvin
> > jsm@fc.hp.com
> >
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
