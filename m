Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA07889
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 15:47:10 -0600
Message-Id: <3.0.3.32.19990621143929.01891a44@hpuxmail.cup.hp.com>
Date: Mon, 21 Jun 1999 14:39:29 -0700
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
From: Larry Dwyer <larry_dwyer@hp.com>
Subject: Re: [parisc-linux] HPUX binary compatibility
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19990620194015.J30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

At 07:40 PM 6/20/99 +0200, Matthew Wilcox wrote:
>
>How far do we want to or are we able to go with making constants identical
>between HPUX and Linux?
>
> ...
>The real thing which bothers me about this is that doing this means that
>HPUX and Linux are then allocating from the same numberspace, so where
>Linux has things which HPUX doesn't, HPUX might later allocate the same
>number for a different extension.
>

I would encourage converging the vector constants for Linux on PA with the
same constants for HP-UX on PA.

If there are some extra constants in Linux, I can arrange to have them
reserved in HP-UX.

Do not assume they are reserved until I post to this group (in other words,
every enq needs an ack).  It is best to send mail directly to me since I do
not read this mailing list as often as I ought to.


>(Of course, if HP want to add Linux binary compatibility to HPUX, now
>would be a great time to mention it :-)

Let's just say that we do not want to preclude binary compatibility at some
time in the future.


		Cheers,
		Larry
