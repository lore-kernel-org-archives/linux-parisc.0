Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA01082
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:25 -0700
Date: Sat, 6 Nov 1999 19:33:30 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] sash commands
Message-Id: <19991106193330.I11609@mathe.stud.uni-erlangen.de>
References: <19991105021334.J25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991105021334.J25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> cd
> -chgrp
> -chmod
> -chown
> help
> -ls
> -mkdir
> -pwd
> -touch
> -where

whee.

> -mount is known to not work.  I need to speak to prumpf about why this is.

If I see this correctly this is the 4-argument problem.  Our current (hacked)
syscall support only supports the register arguments because supporting the
other ones too just would mean nobody ever got around to fix syscall support :)

If anyone else needs to send me email (or needed in the last two weeks or so),
please use the new ugly address Philipp.H.Rumpf@mathe.stud.uni-erlangen.de. As
I don't work for SuSE any more, prumpf@suse.de is very likely to be invalid
shortly and I am not sure how often I'll be able to check it before.

> Ditto -sync.

what's the problem with sync ?

	Philipp Rumpf
